# The ueber-based test approach
test:
	@swipl -q -f main.pro

view:
	cd languages/ueber; make

# 
elide:
	cd tools; make elide

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

