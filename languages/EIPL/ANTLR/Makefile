cp = -cp .:../../../lib/Java/antlr-4.4-complete.jar
antlr = java ${cp} org.antlr.v4.Tool
EiplChecker = java ${cp} org.softlang.EiplChecker

all:
	make generate
	make compile
	make test

generate:
	${antlr} org/softlang/EiplChecker.g4

compile:
	javac ${cp} org/softlang/*.java

test:
	${EiplChecker} ../sample.eipl
	! ${EiplChecker} ../tests/missing-var-dec.eipl
	! ${EiplChecker} ../tests/missing-proc-dec.eipl
	! ${EiplChecker} ../tests/var-clash.eipl
	! ${EiplChecker} ../tests/proc-clash.eipl

clean:
	cd org/softlang; \
	rm -f *.class; \
	rm -f *.tokens *Lexer.* *Parser.* *Listener*.*;
