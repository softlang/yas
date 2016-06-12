build:
	javac *.java

test:
	java TurnstileDemo > output.txt
	diff baseline.txt output.txt

clean:
	rm -f *.class
	rm -f output.txt

