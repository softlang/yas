public class Cons implements List {

	private int e;
	private List l;
	
	public Cons(int e, List l) {
		this.e = e;
		this.l = l;
	}
	
	public int head() {
		return e;
	}

	public List tail() {
		return l;
	}

	public boolean isNil() { 
		return false;
	}

	public int length() { 
		return l.length() + 1;
	}
	
	public List append(List l2) {
		return new Cons(e, l.append(l2));
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
