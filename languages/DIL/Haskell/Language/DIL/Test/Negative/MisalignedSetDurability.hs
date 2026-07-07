{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

-- EXPECT_ERROR: Field assignment is not durability-aligned with its definition

module Main where

import Data.HList
import Language.DIL.Syntax
import Language.DIL.WellFormedness
import Language.DIL.TestVocabulary

bad =
  mlm $
    ( level @1
    ,   root @ProductType @1
          (def @Price @2 @Double :> End)
    :>  End
    )
    :>
    ( level @0
    ,   instanceOf @Book @0 @ProductType
          (set @Price (9.95 :: Double) :> End)
    :>  End
    )
    :>
    End

main :: IO ()
main = pure ()
