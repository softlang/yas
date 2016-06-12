import static java.lang.System.out;

public class Demo {

	public static void main(String[] args) {
		List l1 = new Cons(1, new Cons(42, new Nil()));
		List l2 = l1.snoc(88);
		out.println(l1.length()); // 2
		out.println(l2.length()); // 3
		out.println(l1.last()); // 42
		out.println(l2.last()); // 88
	}

}
