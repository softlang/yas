cp = -cp .:../../../lib/Java/antlr-4.4-complete.jar
antlr = java ${cp} org.antlr.v4.Tool
fsmlSyntaxChecker = java ${cp} org.softlang.FsmlSyntaxChecker

all:
	make generate
	make compile
	make test

generate:
	${antlr} org/softlang/Fsml.g4
# BEGIN ...
	${antlr} org/softlang/FsmlToObjects.g4
	${antlr} org/softlang/FsmlToObjects2.g4
# END ...

compile:
	javac ${cp} org/softlang/*.java

test:
	${fsmlSyntaxChecker} ../sample.fsml 0
	${fsmlSyntaxChecker} ../tests/syntaxError.fsml 1
# BEGIN ...

clean:
	cd org/softlang; \
	rm -f *.class Fsml*.tokens Fsml*Lexer.* Fsml*Parser.* Fsml*Listener.* Fsml*BaseListener.*
# END ...
