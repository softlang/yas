all: test

test: test-input test-output

# Run tests on original 101implementation:jdom
test-input:
	cd input; make test-xsltproc

# Run same tests on transformed implementation
test-output:
	cd output; make test-xsltproc
