{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

-- EXPECT_ERROR: Duplicate field introduction in DIL MLM instantiation chain

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
          (def @Price @0 @Double :> End)
    :>  End
    )
    :>
    End

main :: IO ()
main = pure ()
