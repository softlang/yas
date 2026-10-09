module Language.ZigZag.Syntax where

{-

In concrete syntax:

ProductType = { taxRate: int^1, price: float^2 }
Book = ProductType <- { taxRate = 7, owner: Person^2 }
MobyDick = Book <- { price = 9.95 }
Person = { name : String^1 }
Bookworm = Person <- { name = "bookworm" }

-}

-- Abstract syntax definition
type Prog = [EDef]
type EDef = (EName, Element)
data Element
  = Literal [PDef]
  | Instance EName [PDef]
  deriving (Read, Show, Eq)
type PDef = (PName, Property)
data Property
  = Decl Type Durability
  | Set Value
  deriving (Read, Show, Eq)
data Value
  = IntValue Int
  | FloatValue Float
  | StringValue String
  | ElementValue EName
  deriving (Read, Show, Eq)
data Type
  = IntType
  | FloatType
  | StringType
  | ElementType EName
  deriving (Read, Show, Eq)
type Durability = Int
type EName = String
type PName = String

-- The same sample as above
sample :: Prog
sample = [
    ("ProductType", Literal [("taxRate", (Decl IntType 1)), ("price", Decl FloatType 2)]),
    ("Book", Instance "ProductType" [("taxRate", Set (IntValue 7)), ("owner", (Decl (ElementType "Person") 2))]),
    ("MobyDick", Instance "Book" [("price", Set (FloatValue 9.95))]),
    ("Person", Literal [("name", Decl StringType 1)]),
    ("Bookworm", Instance "Person" [("name", Set (StringValue "bookworm"))])
  ]
