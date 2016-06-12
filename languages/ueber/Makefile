all:
	make languages.pdf
	make functions.pdf

%.pdf: %.dgl
	dot -Tpdf $*.dgl -o $*.pdf
	open $*.pdf

clean:
	rm -f *.pdf
