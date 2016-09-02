cp = -cp .:../../../lib/Java/antlr-4.4-complete.jar
antlr = java ${cp} org.antlr.v4.Tool
fsmlSyntaxChecker = java ${cp} org.softlang.FsmlSyntaxChecker

all:
	make clean
	make generate
	make compile
	make test

generate:
	${antlr} org/softlang/Fsml.g4
	${antlr} org/softlang/FsmlToObjects.g4

compile:
	javac ${cp} org/softlang/*.java

test:
	${fsmlSyntaxChecker} ../sample.fsml 0
	${fsmlSyntaxChecker} ../tests/syntaxError.fsml 1

clean:
	cd org/softlang; \
	rm -f *.class Fsml*.tokens Fsml*Lexer.* Fsml*Parser.* Fsml*Listener.* Fsml*BaseListener.*
