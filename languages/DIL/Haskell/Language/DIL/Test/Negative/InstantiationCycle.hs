{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

-- EXPECT_ERROR: Instantiation cycle in DIL MLM involving structure

module Main where

import Data.HList
import Language.DIL.Syntax
import Language.DIL.WellFormedness
import Language.DIL.TestVocabulary

bad =
  mlm $
    ( level @0
    ,   instanceOf @A @0 @B End
    :>  instanceOf @B @0 @A End
    :>  End
    )
    :>
    End

main :: IO ()
main = pure ()
