all:
	make clean
	make generate
	make run
	make test

install-very-specific:
	sudo pip install --user antlr4-python2-runtime
	sudo pip install --user pygraphviz --install-option="--include-path=/usr/local/include" --install-option="--library-path=/usr/local/lib"

generate:
	java -cp .:../ANTLR/antlr-4.4-complete.jar org.antlr.v4.Tool Fsml.g4

run:
	python -B FsmlMain.py
	cd dot; dot -Tpdf sample.dot -o sample.pdf

test:
	python -B FsmlTest.py

clean:
	@rm -rf *.pyc
	@rm -rf Fsml.tokens FsmlLexer.py FsmlParser.py
	@rm -rf generated/*.py
	@rm -rf sample_fsml.json
	@rm -rf sample_output.json
	@rm -rf dot/*.dot
	@rm -rf dot/*.pdf
