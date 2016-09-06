-- BEGIN ...
{-# LANGUAGE FlexibleContexts #-}
module Language.FSML.QuasiQuoter ( fsml ) where
import Language.FSML.Syntax
import Language.FSML.Parser
import Language.FSML.StringChecker
import Language.Haskell.TH
import Language.Haskell.TH.Quote
import Text.Parsec.Utilities
-- END ...
fsml :: QuasiQuoter
fsml = QuasiQuoter
    { quoteExp  = quoteFsmlExp
    , quotePat  = undefined
    , quoteType = undefined
    , quoteDec  = undefined
    }

quoteFsmlExp :: String -> Q Exp
quoteFsmlExp str = do
    x <- parseQ fsm str
    case check x of
      [] -> dataToExpQ (const Nothing) x
      errs -> error $ unlines errs
