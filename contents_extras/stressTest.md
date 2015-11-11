---
title: Theme stress test
---

# Testing Haskell code in titles \hs{if a then 2 else 3}
## Testing Haskell code in titles \hs{if a then 2 else 3}
### Testing Haskell code in titles \hs{if a then 2 else 3}
#### Testing Haskell code in titles \hs{if a then 2 else 3}

# Testing inline and block code

Here's some inline code \hs{data Book = Book Int String [String]} !

\hs{data Book = Book { bookTitle :: String, bookAuthors :: [String], bookYear :: Int}}

Testing Haskell code in titles \hs{if a then 2 else 3}

# Haskell code blocks
\haskellN
main :: IO ()
main = hakyll $ do
    match "contents/**.md" $
      compile $ customCompiler
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
\eof

\haskell
main :: IO ()
main = hakyll $ do
    match "contents/**.md" $
      compile $ customCompiler
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
\eof

# COde in boxes

\box{info}

Here's some inline code \hs{data Book = Book Int String [String]} !

\hs{fmap} !!!

\endbox

# The infamous inline titles problem

## Title 1

Some text

## Title 2

Some text

## Title 3

Some text

## Inlining titles only
## Inlining titles only
## Inlining titles only
this will probably fail, and is not a problem.

## The infamous justification bug

## Some line of text
Some relatively long content

Some extra content in a new paragraph

## Some longer line of text
Some relatively long content

Some extra content in a new paragraph

## Some longer longer line of text
Some relatively long content

Some extra content in a new paragraph

## Some longer longer longer line of text
Some relatively long content

Some extra content in a new paragraph

## Some longer longer longer longer line of text
Some relatively long content

Some extra content in a new paragraph

## Some longer longer longer longer longer line of text
Some relatively long content

Some extra content in a new paragraph

## Some longer longer longer longer longer longer line of text
Some relatively long content

Some extra content in a new paragraph

## Some longer longer longer longer longer longer longer line of text
Some relatively long content

Some extra content in a new paragraph

## Some longer longer longer longer longer longer longer longer line of text
Some relatively long content

Some extra content in a new paragraph

## Some longer longer longer longer longer longer longer longer longer line of text
Some relatively long content

Some extra content in a new paragraph

## Some longer longer longer longer longer longer longer longer longer longer line of text
Some relatively long content

Some extra content in a new paragraph

## Some longer longer longer longer longer longer longer longer longer longer longer line of text
Some relatively long content

Some extra content in a new paragraph

