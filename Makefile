javadirs = languages/ASL/samples/adts/Java languages/BNL/ANTLR languages/BNL/ESL/java languages/BNL/Java languages/BTL/Java languages/EIPL/ANTLR languages/FSML/Java languages/GBL/Java samples/xcoupled
haskelldirs = languages/BFPL/Haskell languages/BGL/Haskell languages/BIPL/Haskell languages/BNL/ESL/haskell languages/BSL/Haskell languages/BNL/Haskell languages/BTL/Haskell languages/EGL/Haskell languages/EL/Haskell languages/FSML/Haskell languages/GBL/Haskell lib/Haskell samples/Haskell
pythondirs = languages/FSML/Python
nonprologdirs = ${javadirs} ${haskelldirs} ${pythondirs}
nonsle16dirs = ${nonprologdirs} attic tools

# The ueber-based test approach
test:
	@swipl -q -f main.pro

view:
	cd languages/ueber; make

# 
elide:
	cd tools; make elide

haskell:
	cd languages/FSML/Haskell; make
	cd languages/BTL/Haskell; make

# Do not exit session
session:
	@swipl -q -f main.pro -- session

# Be verbose
verbose:
	@swipl -q -f main.pro -- verbose 

# Force file creation
create:
	@swipl -q -f main.pro -- create verbose

# Force file overriding
override:
	@swipl -q -f main.pro -- override verbose

# create and override combined
force:
	@swipl -q -f main.pro -- create override verbose

# Broken, old tests; still some porting needed
test-old:
	make prelude.test
	make term.test
	make cfg.test
	make dict.test
	make graph.test
	make mm.test
	make mt.test
	make plt.test
	make dgl.test
	make java.test

%.test:
	@echo Testing package $* ...
	@swipl -q -f packages/$*.pro -g $*_main

remove-nonsle16dirs:
	for dir in ${nonsle16dirs} ; do \
		rm -rf $$dir ; \
	done
