{-# LANGUAGE FlexibleContexts #-}
-- Compositional/denotational style variation on Language.EGL.Interpreter
module Language.EGL.DS.Interpreter where
import Prelude hiding (lookup)
import Language.EGL.Syntax
import Language.EGL.Lexer
import Text.Parsec
import Data.Map (Map, lookup)

type Acceptor = Parsec String () ()

accept :: Grammar -> Map String Acceptor -> String -> Either ParseError ()
accept g m s = parse top "" s

 where

  top = trim (nonterminal stsy) >> eof
   where ((_, stsy, _):_) = g

  -- Syntax-directed interpretation

  gsymbols :: GSymbols -> Acceptor
  gsymbols = sequence_ . map gsymbol

  gsymbol :: GSymbol -> Acceptor
  gsymbol (T t)          = terminal t
  gsymbol (N n)          = nonterminal n
  gsymbol (Star gss)     = star   (gsymbols gss)
  gsymbol (Plus gss)     = plus   (gsymbols gss)
  gsymbol (Option gss)   = option (gsymbols gss)

  -- Basic denotations
  terminal :: Terminal -> Acceptor
  nonterminal :: Nonterminal -> Acceptor
  terminal t = trim (symbol t)
  nonterminal n = trim (maybe local id (lookup n m))
   where
    local = alternatives
      [ gsymbols gss
      | (_, n', gss) <- g
      , n' == n
      ]

  -- Meaning-level combinators
  alternatives :: [Acceptor] -> Acceptor
  star :: Acceptor -> Acceptor
  plus :: Acceptor -> Acceptor
  option :: Acceptor -> Acceptor

  alternatives ps = choice ps >> return ()
  star p = trim (many p)
  plus p = trim (many1 p)
  option p = trim (optional p)

  -- Consume spaces and void the result
  trim :: Parsec String () a -> Acceptor
  trim p = spaces >> p >> return ()
