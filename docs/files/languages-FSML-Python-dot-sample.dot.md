# File _languages/FSML/Python/dot/sample.dot_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Python/dot/sample.dot)**
```
digraph  {
	graph [nodesep=0.5,
		rankdir=LR,
		title="Sample FSM"
	];
	exception	 [shape=ellipse];
	exception -> exception	 [label="ticket/eject"];
...
```

## Languages
* [DOT](../languages/DOT.md)

## References
* mapsTo(visualize,['languages/FSML/Python/sample.json'],['languages/FSML/Python/dot/sample.dot'])
* elementOf('languages/FSML/Python/dot/sample.dot',dot(text))
