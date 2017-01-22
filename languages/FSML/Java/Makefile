cp = -cp .:../../../lib/Java/antlr-4.5.3-complete.jar
antlr = java ${cp} org.antlr.v4.Tool -o org/softlang/fsml
fsmlSyntaxChecker = java ${cp} org.softlang.fsml.FsmlSyntaxChecker

all:
	make generate
	make compile
	make test

generate:
	${antlr} Fsml.g4
# BEGIN ...
	${antlr} FsmlToObjects.g4
	${antlr} FsmlToObjects2.g4
# END ...

compile:
	javac ${cp} org/softlang/fsml/*.java

test:
	${fsmlSyntaxChecker} ../sample.fsml 0
	${fsmlSyntaxChecker} ../tests/syntaxError.fsml 1
# BEGIN ...

clean:
	cd org/softlang/fsml; \
	rm -f *.class Fsml*.tokens Fsml*Lexer.* Fsml*Parser.* Fsml*Listener.* Fsml*BaseListener.*
# END ...
