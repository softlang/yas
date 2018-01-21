i = -i.:../../../lib/Haskell:
ghci = ghci Main.hs ${i}

test:
	@echo main | ${ghci}

run:
	ghci Main.hs ${i}

%.run:
	ghci $*.hs ${i}
