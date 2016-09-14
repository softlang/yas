module Stdlib where

data Pair x y = Pair x y
data Option x = None | Some x
data List x = Nil | Cons x (List x)

first :: Pair a b -> a
first (Pair x _) = x

second :: Pair a b -> b
second (Pair _ y) = y

isNone :: Option x -> Bool
isNone None = True
isNone (Some _) = False

isSome :: Option x -> Bool
isSome None = False
isSome (Some _) = True

maplist :: (a -> b) -> List a -> List b
maplist f Nil = Nil
maplist f (Cons x l) = Cons (f x) (maplist f l)

ziplist :: List a -> List b -> List (Pair a b)
ziplist Nil Nil = Nil
ziplist (Cons x1 l1) (Cons x2 l2) = Cons (Pair x1 x2) (ziplist l1 l2)
ziplist _ _ = error "ziplist"

find :: (a -> Bool) -> List a -> a
find f Nil = error "find"
find f (Cons x l) = if f x then x else find f l

optionlist :: List (Option a) -> Option (List a)
optionlist Nil = Some Nil
optionlist (Cons x l) = optionlist2 x (optionlist l)

optionlist2 :: Option a -> Option (List a) -> Option (List a)
optionlist2 None _ = None
optionlist2 _ None = None
optionlist2 (Some x) (Some l) = Some (Cons x l)
