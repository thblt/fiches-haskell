{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Monad                  (liftM)
import           Data.Default                   (def)
import           Data.Monoid                    (mappend, mconcat, mempty)
import           Hakyll
import           Hakyll.Core.Identifier.Pattern (Pattern (..))
import           Hakyll.Web.Sass
import           Text.Pandoc.Options
import           Text.Pandoc

bibFile, cslFile :: String
bibFile = "bibliography.bib"
cslFile = "theme/iso690-author-date-fr.csl"

main :: IO ()
main = hakyll $ do

  match (fromGlob bibFile) $ compile biblioCompiler

  match (fromGlob cslFile) $ compile cslCompiler

  match "haskell.org" $ do
    route $ customRoute $ const "index.html"
    compile $
        bibtexCompiler cslFile bibFile >>=
        loadAndApplyTemplate "theme/tpl/default.html" defaultContext >>=
        relativizeUrls

  match "theme/scss/theme.scss" $ do
      route   $ gsubRoute "theme/scss/" (const "theme/") `composeRoutes` setExtension "css"
      compile $ sassCompilerWith def {
        sassOutputStyle = SassStyleCompressed -- SassStyleCompact
        }

  match ("theme/img/*" .||. "theme/js/*") $ do
        route idRoute
        compile copyFileCompiler

  match "theme/tpl/*" $ compile templateCompiler


bibtexCompiler :: String -> String -> Compiler (Item String)
bibtexCompiler cslFileName bibFileName = do
    csl <- load $ fromFilePath cslFileName
    bib <- load $ fromFilePath bibFileName
    liftM (writePandocWith myWriterOptions)
      (getResourceBody >>= readPandocBiblio myReaderOptions csl bib)
      where

        myReaderOptions :: ReaderOptions
        myReaderOptions = def {
          readerParseRaw = True,
          readerSmart = True }

        myWriterOptions :: WriterOptions
        myWriterOptions = def { writerSectionDivs = True,
                                writerHtml5 = True,
                                writerHighlight = True,
                                writerHTMLMathMethod = Text.Pandoc.MathML Nothing,
                                writerEmailObfuscation = NoObfuscation }

-- bibtexCompiler = do
--   csl <- load "theme/iso690-author-date-fr.csl"
--   bib <- load "bibliography.bib"
--   getResourceBody
--   >>= readPandocBiblio def csl bib
--   >>= return . writePandoc
--
