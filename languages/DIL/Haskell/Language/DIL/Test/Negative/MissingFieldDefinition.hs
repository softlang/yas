{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

-- EXPECT_ERROR: Field assignment has no corresponding field definition in its instantiation chain

module Main where

import Data.HList
import Language.DIL.Syntax
import Language.DIL.WellFormedness
import Language.DIL.TestVocabulary

bad =
  mlm $
    ( level @0
    ,   root @Book @0
          (set @Price (9.95 :: Double) :> End)
    :>  End
    )
    :>
    End

main :: IO ()
main = pure ()
