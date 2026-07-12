# Haskell-based DIL implementation

## Motivating example

Let's assume some random concrete syntax for structures in the "Deep Instantiation Language" (DIL):

```
Level 2:
  Structure ProductType^2:
    Field taxRate^1 : Integer
    Field price^2 : Float
    
Level 1:
   Structure Book^1 < ProductType:
    Field taxRate^0 : 7
   Structure DVD^1 < ProductType:
    Field taxRate^0 : 19
    
Level 0:
   Structure MobyDick^0 < Book
    Field price^0 : 9.95
   Structure Film2001^0 < DVD
    Field price^0 : 19.95
```

This example originates from:

https://dl.acm.org/doi/10.1145/1297105.1297044

https://www.scitepress.org/Papers/2020/89735/89735.pdf

```
@inproceedings{10.1145/1297027.1297044,
author = {K\"{u}hne, Thomas and Schreiber, Daniel},
title = {Can programming be liberated from the two-level style: multi-level programming with deepjava},
year = {2007},
isbn = {9781595937865},
publisher = {Association for Computing Machinery},
address = {New York, NY, USA},
url = {https://doi.org/10.1145/1297027.1297044},
doi = {10.1145/1297027.1297044},
booktitle = {Proceedings of the 22nd Annual ACM SIGPLAN Conference on Object-Oriented Programming Systems, Languages and Applications},
pages = {229–244},
numpages = {16},
keywords = {deep characterization, domain metatypes, ontological metamodeling},
location = {Montreal, Quebec, Canada},
series = {OOPSLA '07}
}
```

## Haskell-based embedding syntax

The example is rendered in Haskell as follows:

```
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
```

We also need empty types for all structure and field names:

```
data ProductType; instance Structure ProductType
data TaxRate; instance Field TaxRate
data Price; instance Field Price
data Book; instance Structure Book
data DVD; instance Structure DVD
data MobyDick; instance Structure MobyDick
data Film2001; instance Structure Film2001
```

The leveraged Haskell syntax clarifies the Haskell-based representation of DIL models:

* Use type-level naturals 2, 1, 0 for levels.
* Use type-level naturals for potencies, too.
* Use type-level naturals for durabilities, too.
* Use nominal types for structure and field names.
* Use HLists (heterogeneous lists) for lists of levels, structures, and fields.
* Use explicit type application (@...) for passing all type-level material.
* Use smart constructors: mlm, level, root, instanceOf, def, set.

For HLists; see here: https://dl.acm.org/doi/10.1145/1017472.1017488 

For what it matters, the internal representation mainly consists of proxies for all the types involved. The set values for fields (and all the necessary hlist constructors (around mostly proxies) are the only value-level structures.

## Well-formedness of DIL models

Type-level programming is employed to enforce several constraints -- in particular:

* Levels must be descending one by one down to zero.
* Names of structure must be unique across a model.
* Names of defined (introduced) fields must be unique along instantiation chains.
* Field sets (assignments) must be aligned with definitions in terms of durabilities.
* Instantiation must not be cyclic.

See here for the code: https://github.com/softlang/yas/blob/master/languages/DIL/Haskell/Language/DIL/WellFormedness.hs

The following concepts of type-level programming are leveraged:

* HLists
* Proxy
* TypeEquality
* Type classes
* Type families
* Promotion of data types to the kind level
* GADTs
* Type-level type error messages

## DIL well-formedness tests

These are compile-result tests for `Language.DIL.WellFormedness`.

Positive tests must compile.
Negative tests must fail to compile. 
Each negative test declares an expected diagnostic substring with:

```haskell
-- EXPECT_ERROR: some expected diagnostic text
```

### Run

make test

### Covered constraints

See here for the code: https://github.com/softlang/yas/tree/master/languages/DIL/Haskell/Language/DIL/Test

Positive tests:

* `ProductOK.hs`: canonical well-formed product/book/example chain.
* `SiblingFieldOK.hs`: sibling branches may introduce the same field name.

Negative tests:

* `BadLevels.hs`: levels are not descending down to zero.
* `DuplicateStructure.hs`: repeated structure declaration.
* `InstantiationCycle.hs`: cyclic base relation.
* `DuplicateFieldInChain.hs`: repeated field introduction in one chain.
* `MisalignedSetDurability.hs`: assignment distance differs from definition durability.
* `MisalignedSetType.hs`: assignment type differs from definition type.
* `MissingBaseStructure.hs`: base structure is not declared.
* `MissingFieldDefinition.hs`: assignment has no corresponding field definition.
