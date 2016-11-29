i = -i.:../../../lib/Haskell
ghci = ghci Main.hs ${i}

accept:
	ghci ${i} Command/FsmlAcceptor/Main.hs

compile:
	ghc ${i} Command/FsmlAcceptor/Main.hs -o ../../../tmp/FsmlAcceptor.run

test:
	@echo main | ${ghci}

clean:
	rm -f Command/FsmlAcceptor/*.hi Command/FsmlAcceptor/*.o ../../../tmp/FsmlAcceptor.run

run:
	${ghci}
