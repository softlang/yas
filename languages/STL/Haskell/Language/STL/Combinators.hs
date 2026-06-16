module Language.STL.Combinators where

import Prelude hiding (drop, filter, id, map, pred, take)

import qualified Prelude as P

import Language.STL.Domains
import Language.STL.Syntax

-- Basic stream transformers

id :: Transducer
id =
  P.id

map :: Unary -> Transducer
map f =
  P.map (unary f)

filter :: Pred -> Transducer
filter p =
  P.filter (pred p)

take :: Int -> Transducer
take n =
  P.take n

drop :: Int -> Transducer
drop n =
  P.drop n

-- Composition

seq :: Transducer -> Transducer -> Transducer
seq t1 t2 =
  t2 P.. t1

-- Fan-out / fan-in

par :: Binary -> Transducer -> Transducer -> Transducer
par f t1 t2 xs = binary f (t1 xs) (t2 xs)

-- Built-in meanings

unary :: Unary -> Int -> Int
unary Inc =
  (+ 1)

unary Dec =
  subtract 1

unary Double =
  (* 2)

unary Square =
  \x -> x * x

unary Negate =
  P.negate

pred :: Pred -> Int -> Bool
pred Even =
  P.even

pred Odd =
  P.odd

pred Positive =
  (> 0)

pred Negative =
  (< 0)

pred (GreaterThan n) =
  (> n)

pred (LessThan n) =
  (< n)


binary :: Binary -> Stream -> Stream -> Stream

binary Interleave =
  interleave

binary Fst =
  curry fst

binary Snd =
  curry snd

-- Stream-level helper
interleave :: Stream -> Stream -> Stream
interleave [] ys = ys
interleave xs [] = xs
interleave (x:xs) (y:ys) = x:y:interleave xs ys
