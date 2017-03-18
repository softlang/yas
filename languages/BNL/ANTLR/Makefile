cp = -cp .:../../../lib/Java/antlr-4.4-complete.jar
antlr = java ${cp} org.antlr.v4.Tool -o org/softlang/bnl
BnlBnfSyntaxChecker = java ${cp} org.softlang.bnl.BnlBnfSyntaxChecker
BnlEbnfSyntaxChecker = java ${cp} org.softlang.bnl.BnlEbnfSyntaxChecker
BnlEbnfAcceptor = java ${cp} org.softlang.bnl.BnlEbnfAcceptor
BnlBnfConversion = java ${cp} org.softlang.bnl.BnlBnfConversion
BnlEbnfConversion = java ${cp} org.softlang.bnl.BnlEbnfConversion

all:
	make generate
	make compile
	make test

generate:
	${antlr} BnlBnf.g4
	${antlr} BnlEbnf.g4
	${antlr} BnlBnfConversion.g4
	${antlr} BnlEbnfConversion.g4

compile:
	javac ${cp} org/softlang/bnl/*.java

test:
	${BnlBnfSyntaxChecker} ../samples/5comma25.bnl 0
	${BnlEbnfSyntaxChecker} ../samples/5comma25.bnl 0
	${BnlEbnfAcceptor} ../samples/5comma25.bnl
	${BnlBnfConversion} ../samples/5comma25.bnl 5.25
	${BnlEbnfConversion} ../samples/5comma25.bnl 5.25

clean:
	cd org/softlang/bnl; \
	rm -f *.class; \
	rm -f *.tokens *Lexer.* *Parser.* *Listener*.*;
