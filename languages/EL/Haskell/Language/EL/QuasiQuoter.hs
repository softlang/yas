-- BEGIN ...
{-# LANGUAGE FlexibleContexts #-}
module Language.EL.QuasiQuoter ( el ) where
import Language.EL.QQ.Syntax
import Language.EL.QQ.Parser
import Language.Haskell.TH
import Language.Haskell.TH.Quote
import Data.Generics
import Text.Parsec.Utilities
-- END ...
el :: QuasiQuoter
el = QuasiQuoter
    { quoteExp  = quoteElExp
    , quotePat  = quoteElPat
    , quoteType = undefined
    , quoteDec  = undefined
    }

quoteElExp :: String -> Q Exp
quoteElExp str = do
    x <- parseQ expr str
    dataToExpQ (const Nothing `extQ` f) x
  where
    f :: Expr -> Maybe (Q Exp)
    f (MetaVar v) = Just $ varE (mkName v)
    f _ = Nothing

quoteElPat :: String -> Q Pat
quoteElPat str = do
    x <- parseQ expr str
    dataToPatQ (const Nothing `extQ` f) x
  where
    f :: Expr -> Maybe (Q Pat)
    f (MetaVar v) = Just $ varP (mkName v)
    f _ = Nothing
