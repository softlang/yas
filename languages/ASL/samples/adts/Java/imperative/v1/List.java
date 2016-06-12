public class List {
	private Cons first;

	public int head() {
		return first.head;
	}

	public void tail() {
		first = first.tail;
	}

	public boolean isNil() {
		return first == null;
	}

	public int length() {
		int len = 0;
		for (Cons i = first; i != null; i = i.tail)
			len++;
		return len;
	}

	public void append(List l) {
		if (!l.isNil())
			if (first == null) {
				first = l.first;
			} else {
				Cons i;
				for (i = first; i.tail != null; i = i.tail)
					;
				i.tail = l.first;
			}
	}

	public void snoc(int e) {
		Cons c = new Cons();
		c.head = e;
		//
		// Reuse append
		//
		// List l = new List();
		// l.first = c;
		// append(l);
		//
		// Specialized append
		//
		if (first == null)
			first = c;
		else {
			Cons i;
			for (i = first; i.tail != null; i = i.tail)
				;
			i.tail = c;
		}
	}

	public int last() {
		Cons i;
		for (i = first; i.tail != null; i = i.tail)
			;
		return i.head;
	}

	public void init() {
		if (first.tail == null)
			first = null;
		else {
			Cons i;
			for (i = first; i.tail.tail != null; i = i.tail)
				;
			i.tail = null;
		}
	}
}
