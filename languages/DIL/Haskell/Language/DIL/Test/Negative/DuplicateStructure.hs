{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

-- EXPECT_ERROR: Duplicate structure declaration in DIL MLM

module Main where

import Data.HList
import Language.DIL.Syntax
import Language.DIL.WellFormedness
import Language.DIL.TestVocabulary

bad =
  mlm $
    ( level @0
    ,   root @Book @0 End
    :>  root @Book @0 End
    :>  End
    )
    :>
    End

main :: IO ()
main = pure ()
