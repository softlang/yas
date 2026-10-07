module Language.ZigZag where

{-

ProductType = { taxRate: int^1, price: float^2 }
Book = ProductType <- { taxRate = 7 }
MobyDick = Book <- { price = 9.95 }

-}

type Prog = [Def]
type Def = (Name, Elem)
type Name = String
data Elem
  = Literal [Field]
  | Instance Name [Field]
  deriving (Read, Show, Eq)
data Field
  = Decl Name Type Durability
  | Def Name Value
  deriving (Read, Show, Eq)
type Value = Either Int Float
data Type = IntType | FloatType
  deriving (Read, Show, Eq)
type Durability = Int

sample :: Prog
sample = [
    ("ProductType", Literal [Decl "taxRate" IntType 1, Decl "price" FloatType 2]),
    ("Book", Instance "ProductType" [Def "taxRate" (Left 7)]),
    ("MobyDick", Instance "Book" [Def "price" (Right 9.95)])
  ]
