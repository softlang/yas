public class Nil implements List {

	public Nil() {
	}
	
	public int head() {
		throw new UnsupportedOperationException();
	}

	public List tail() {
		throw new UnsupportedOperationException();
	}

	public boolean isNil() { 
		return true;
	}

	public int length() { 
		return 0;
	}
		
	public List append(List l) {
		return l;
	}

	public List snoc(int e) {
		return new Cons(e, new Nil());
	}

	public int last() {
		throw new UnsupportedOperationException();
	}

	public List init() {
		throw new UnsupportedOperationException();
	}
}
