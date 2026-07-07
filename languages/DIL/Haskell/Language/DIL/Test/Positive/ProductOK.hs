{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

module Main where

import Data.HList
import Language.DIL.Syntax
import Language.DIL.WellFormedness
import Language.DIL.TestVocabulary

example =
  mlm $
    ( level @2
    ,   root @ProductType @2
          (   def @TaxRate @1 @Int
          :>  def @Price @2 @Double
          :>  End
          )
    :>  End
    )
    :>
    ( level @1
    ,   instanceOf @Book @1 @ProductType
          (   set @TaxRate (7 :: Int)
          :>  End
          )
    :>  instanceOf @DVD @1 @ProductType
          (   set @TaxRate (19 :: Int)
          :>  End
          )
    :>  End
    )
    :>
    ( level @0
    ,   instanceOf @MobyDick @0 @Book
          (   set @Price (9.95 :: Double)
          :>  End
          )
    :>  End
    )
    :>
    End

main :: IO ()
main = pure ()
