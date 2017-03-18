cp = -cp .:../../../lib/Java/antlr-4.4-complete.jar
antlr = java ${cp} org.antlr.v4.Tool -o org/softlang/eipl
EiplChecker = java ${cp} org.softlang.eipl.EiplChecker

all:
	make generate
	make compile
	make test

generate:
	${antlr} EiplChecker.g4

compile:
	javac ${cp} org/softlang/eipl/*.java

test:
	${EiplChecker} ../sample.eipl
	! ${EiplChecker} ../tests/missing-var-dec.eipl
	! ${EiplChecker} ../tests/missing-proc-dec.eipl
	! ${EiplChecker} ../tests/var-clash.eipl
	! ${EiplChecker} ../tests/proc-clash.eipl

clean:
	cd org/softlang/eipl; \
	rm -f *.class; \
	rm -f *.tokens *Lexer.* *Parser.* *Listener*.*;
