-- BEGIN ...
{-# LANGUAGE FlexibleContexts #-}
module Language.EGL.Interpreter where
import Prelude hiding (lookup)
import Language.EGL.Syntax
import Language.EGL.Lexer
import Text.Parsec
import Data.Map (Map, lookup)
-- END ...
type Acceptor = Parsec String () ()
accept :: Grammar -> Map String Acceptor -> String -> Either ParseError ()
accept g m s = parse top "" s
  where
    top = trim (gsymbol (N stsy)) >> eof
      where ((_, stsy, _):_) = g
    gsymbols gss = mapM gsymbol gss
    gsymbol (T t) = trim $ symbol t
    gsymbol (N n) = trim $ maybe n' id (lookup n m)
       where n' = choice (map gsymbols gsss) >> return ()
               where gsss@(_:_) = [ gss | (_, n', gss) <- g, n' == n ]
    gsymbol (Star gss) = trim $ many (gsymbols gss)
    gsymbol (Plus gss) = trim $ many1 (gsymbols gss)
    gsymbol (Option gss) = trim $ optional (gsymbols gss)

-- Consume spaces and void the result
trim p = spaces >> p >> return ()
