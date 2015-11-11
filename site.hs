{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.Default (def)
import Control.Monad (liftM)
import Data.Monoid (mappend, mconcat, mempty)

import Hakyll

main :: IO ()
main = hakyll $ do
    match "contents/**.md" $
        compile $ customCompiler

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

    match "bibliography.bib" $ compile biblioCompiler

    match  "theme/iso690-author-date-fr.csl" $ compile cslCompiler

    match "contents_extras/**" $ do
        route   $ gsubRoute "contents_extras/" (const "") `composeRoutes`
            setExtension "html"
        compile $ customCompiler
            >>= loadAndApplyTemplate "theme/tpl/page.html" defaultContext
            >>= loadAndApplyTemplate "theme/tpl/default.html" defaultContext
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

customCompiler = 
  getResourceBody
  >>= (withItemBody $ unixFilter "gpp" ["-T", "--include", "html.gpp"])
  >>= renderPandoc
  >>= return . fmap demoteHeaders
  >>= return . fmap demoteHeaders
  >>= loadAndApplyTemplate "theme/tpl/item.html" defaultContext
  >>= relativizeUrls

-- bibtexCompiler = do 
--   csl <- load "theme/iso690-author-date-fr.csl"
--   bib <- load "bibliography.bib"
--   getResourceBody
--   >>= readPandocBiblio def csl bib
--   >>= return . writePandoc
-- 
