{-# LANGUAGE OverloadedStrings #-}
module Main where

-- import Data.Functor ((<$>))
-- import Data.List (isPrefixOf)
-- import qualified Data.Map as M
-- import qualified Data.Set as S
-- import Data.Maybe (fromMaybe)
import Data.Monoid (mappend, mconcat, mempty)
-- import Data.Text (pack, unpack, replace, empty)
-- import Text.Pandoc.Options

import Hakyll

main :: IO ()
main = hakyll $ do
    match "contents/**.md" $
        -- route $ setExtension "html"
        compile $
            getResourceBody
            >>= (withItemBody $ unixFilter "gpp" ["-T", "--include", "html.gpp"])
            >>= renderPandoc
            >>= return . fmap demoteHeaders
            >>= return . fmap demoteHeaders
            >>= loadAndApplyTemplate "theme/tpl/item.html" defaultContext
            >>= relativizeUrls

    create ["index.html"] $ do
        route idRoute
        compile $ do
            posts <- loadAll "contents/**.md"
            let archiveCtx =
                    listField "posts" defaultContext (return posts) `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "theme/tpl/cards.html" archiveCtx
                >>= loadAndApplyTemplate "theme/tpl/default.html" archiveCtx
                >>= relativizeUrls

    match "theme/scss/theme.scss" $ do
        route   $ gsubRoute "theme/scss/" (const "theme/") `composeRoutes` setExtension "css"
        compile $ getResourceString
            -- FIXME "-r gridle" works, but really feels dirty. There must be
            -- a way for required scss libraries to be listed outside of here. A
            -- _theme/scss/gems file would be better.
            >>= withItemBody (unixFilter "sass" ["-I", "theme/scss", "-r", "gridle", "--scss", "--compass"])
            >>= return . fmap compressCss
            -- FIXME This doesn't create dependencies for included _*.scss
            -- files. See here://http://www.blaenkdenum.com/posts/extra-dependencies-in-hakyll/

    match ("theme/img/*" .||. "theme/js/*") $ do
        route idRoute
        compile copyFileCompiler

    match "theme/tpl/*" $ compile templateCompiler
