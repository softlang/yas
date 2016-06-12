public interface List {
	int head();
	List tail();
	boolean isNil();
	int length();
	List append(List l2);
	List snoc(int e);
	int last();
	List init();
}
