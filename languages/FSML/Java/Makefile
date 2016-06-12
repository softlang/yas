cp = -cp .:antlr-4.4-complete.jar
antlr = java ${cp} org.antlr.v4.Tool

all:
	make generate

generate:
	${antlr} org/softlang/Fsml.g4
