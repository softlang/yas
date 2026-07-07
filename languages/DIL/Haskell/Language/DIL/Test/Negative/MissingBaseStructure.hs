{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

-- EXPECT_ERROR: Unknown structure in DIL MLM instantiation chain

module Main where

import Data.HList
import Language.DIL.Syntax
import Language.DIL.WellFormedness
import Language.DIL.TestVocabulary

bad =
  mlm $
    ( level @0
    ,   instanceOf @Book @0 @ProductType End
    :>  End
    )
    :>
    End

main :: IO ()
main = pure ()
