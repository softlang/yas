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
    ( level @1
    ,   root @ProductType @1 End
    :>  End
    )
    :>
    ( level @0
    ,   instanceOf @Book @0 @ProductType
          (def @Title @0 @String :> End)
    :>  instanceOf @DVD @0 @ProductType
          (def @Title @0 @String :> End)
    :>  End
    )
    :>
    End

main :: IO ()
main = pure ()
