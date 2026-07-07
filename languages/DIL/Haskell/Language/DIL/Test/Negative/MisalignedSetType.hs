{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

-- EXPECT_ERROR: Field assignment is not type-aligned with its definition

module Main where

import Data.HList
import Language.DIL.Syntax
import Language.DIL.WellFormedness
import Language.DIL.TestVocabulary

bad =
  mlm $
    ( level @1
    ,   root @ProductType @1
          (def @Price @1 @Double :> End)
    :>  End
    )
    :>
    ( level @0
    ,   instanceOf @Book @0 @ProductType
          (set @Price (9 :: Int) :> End)
    :>  End
    )
    :>
    End

main :: IO ()
main = pure ()
