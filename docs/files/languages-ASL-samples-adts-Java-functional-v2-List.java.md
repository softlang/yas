# File _languages/ASL/samples/adts/Java/functional/v2/List.java_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/ASL/samples/adts/Java/functional/v2/List.java)**
```
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
```

## Languages
* [Java](../languages/Java.md) (java(text))

## References
* elementOf('languages/ASL/samples/adts/Java/functional/v2/List.java',java(text))
