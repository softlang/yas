module Language.ZigZag.Resolution where

import Language.ZigZag.Syntax

resolve :: Prog -> EName -> PName -> Maybe Value
resolve p en pn = do
  (Instance _ ps) <- lookup en p
  (Set v) <- lookup pn ps
  return v
