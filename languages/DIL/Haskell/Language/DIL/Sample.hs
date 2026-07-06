{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE IncoherentInstances #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE IncoherentInstances #-}

module Language.DIL.Sample where

import Language.DIL.Syntax
import Language.DIL.WellFormedness
import GHC.TypeLits
import Data.Proxy
import Data.HList

-- L_2:
-- * ProductType^2:
--   * taxRate^1 : Integer
--   * price^2 : Float
--
-- L_1:
-- * Book^1 < ProductType:
--   * taxRate^0 : 7

--   * price^1 : Float
-- * DVD^1 < ProductType:
--   * taxRate^0 : 19
--
-- L_0:
-- * MobyDick^0 < Book
--   * price^0 : 9.95
-- * Film2001^0 < DVD
--   * price^0 : 19.95

data ProductType; instance {-# OVERLAPPING #-} Structure ProductType
data TaxRate; instance {-# OVERLAPPING #-} Field TaxRate
data Price; instance {-# OVERLAPPING #-} Field Price
data Book; instance {-# OVERLAPPING #-} Structure Book
data DVD; instance {-# OVERLAPPING #-} Structure DVD
data MobyDick; instance {-# OVERLAPPING #-} Structure MobyDick
data Film2001; instance {-# OVERLAPPING #-} Structure Film2001

sample = mlm $
 (
   level @2,
     root @ProductType @2 (
          def @TaxRate @1 @Int
       :> def @Price @2 @Double
       :> End
     )
   :> End
 )
 :>
 (
   level @1,
     instanceOf @Book @1 @ProductType (
       set @TaxRate (7::Int) :> End
     ) :>
     instanceOf @DVD @1 @ProductType (
       set @TaxRate (19::Int) :> End
     ) :> End
 )
 :>
 (
   level @0,
     instanceOf @MobyDick @0 @Book (
       set @Price (9.95::Double) :> End
     ) :>
     instanceOf @Film2001 @0 @DVD (
       set @Price (19.95::Double) :> End
     ) :> End
 )
 :> End
