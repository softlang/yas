all: elide

elide:
	make clean
	cd ..; python tools/elider.py
#	cd ..; cd src; find . -type f -name '*...' -exec echo {} +; cd ..; python tools/elider.py

clean:
	cd ..; find . -name "*..." -type f -delete
