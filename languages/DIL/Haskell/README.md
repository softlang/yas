# DIL well-formedness tests

These are compile-result tests for `Language.DIL.WellFormedness`.

Positive tests in `positive/` must compile.

Negative tests in `negative/` must fail to compile. Each negative test declares
an expected diagnostic substring with:

```haskell
-- EXPECT_ERROR: some expected diagnostic text
```

## Install / run

Unpack this archive into `languages/DIL/Haskell` so that the repository has:

```text
languages/DIL/Haskell/test/run-tests.sh
languages/DIL/Haskell/test/positive/*.hs
languages/DIL/Haskell/test/negative/*.hs
```

Then run:

```sh
cd languages/DIL/Haskell
sh test/run-tests.sh
```

You may also add this to `languages/DIL/Haskell/Makefile`:

```make
.PHONY: test
test:
	sh test/run-tests.sh
```

and then run:

```sh
make test
```

## Covered constraints

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
