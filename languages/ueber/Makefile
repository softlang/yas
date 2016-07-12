all:
	make languages.pdf
	open languages.pdf
	make functions.pdf
	open functions.pdf

%.pdf: %.dgl
	dot -Tpdf $*.dgl -o $*.pdf

clean:
	rm -f *.pdf
