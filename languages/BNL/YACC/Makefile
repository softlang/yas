test: bnl
	./bnl < ../samples/5comma25.bnl

bnl: bnl.y bnl.l Makefile
	lex bnl.l
	yacc -d bnl.y
	cc lex.yy.c y.tab.c -o bnl

clean:
	rm -f *.yy.c y.tab.* bnl
