{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

-- EXPECT_ERROR: Malformed DIL MLM levels

module Main where

import Data.HList
import Language.DIL.Syntax
import Language.DIL.WellFormedness
import Language.DIL.TestVocabulary

bad =
  mlm $
    (level @2, root @ProductType @2 End :> End)
    :>
    (level @0, instanceOf @Book @0 @ProductType End :> End)
    :>
    End

main :: IO ()
main = pure ()
