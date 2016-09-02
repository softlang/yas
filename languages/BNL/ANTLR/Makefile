cp = -cp .:../../../lib/Java/antlr-4.4-complete.jar
antlr = java ${cp} org.antlr.v4.Tool
BnlBnfSyntaxChecker = java ${cp} org.softlang.BnlBnfSyntaxChecker
BnlEbnfSyntaxChecker = java ${cp} org.softlang.BnlEbnfSyntaxChecker
BnlBnfConversion = java ${cp} org.softlang.BnlBnfConversion
BnlEbnfConversion = java ${cp} org.softlang.BnlEbnfConversion

all:
	make generate
	make compile
	make test

generate:
	${antlr} org/softlang/BnlBnf.g4
	${antlr} org/softlang/BnlEbnf.g4
	${antlr} org/softlang/BnlBnfConversion.g4
	${antlr} org/softlang/BnlEbnfConversion.g4

compile:
	javac ${cp} org/softlang/*.java

test:
	${BnlBnfSyntaxChecker} ../samples/5comma25.bnl 0
	${BnlEbnfSyntaxChecker} ../samples/5comma25.bnl 0
	${BnlBnfConversion} ../samples/5comma25.bnl 5.25
	${BnlEbnfConversion} ../samples/5comma25.bnl 5.25

clean:
	cd org/softlang; \
	rm -f *.class; \
	rm -f *.tokens *Lexer.* *Parser.* *Listener*.*;
