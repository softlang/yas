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
		return this.append(new Cons(e, new Nil()));
	}

	public int last() {
		return this.tail().isNil() ? this.head() : this.tail().last(); 
	}

	public List init() {
		return this.tail().isNil() ?
					new Nil() :
					new Cons(this.head(), this.tail().init());
	}
}
