import static java.lang.System.*;

public class Demo {

	public static void main(String[] args) {
		List l1 = new List();
		l1.snoc(1);
		l1.snoc(7);
		l1.snoc(11);
		out.println(l1.length()); // 3
		out.println(l1.head()); // 1
		out.println(l1.last()); // 11
		l1.init();
		out.println(l1.length()); // 2
		out.println(l1.head()); // 1
		out.println(l1.last()); // 7
	}

}
