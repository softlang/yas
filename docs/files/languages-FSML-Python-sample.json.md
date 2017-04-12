# File _languages/FSML/Python/sample.json_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Python/sample.json)**
```
{"exception": [{"initial": false, "transitions": {"release": [[null, "locked"]], "ticket": [["eject", "exception"]], "mute": [[null, "exception"]], "pass": [[null, "exception"]]}}], "locked": [{"initial": true, "transitions": {"ticket": [["collect", "unlocked"]], "pass": [["alarm", "exception"]]}}], "unlocked": [{"initial": false, "transitions": {"ticket": [["eject", "unlocked"]], "pass": [[null, "locked"]]}}]}
```

## Languages
* [JSON](../languages/JSON.md)
* [FSML](../languages/FSML.md)

## References
* elementOf('languages/FSML/Python/sample.json',json)
* elementOf('languages/FSML/Python/sample.json',ok(fsml(json)))
* mapsTo(parse,['languages/FSML/sample.fsml'],['languages/FSML/Python/sample.json'])
* mapsTo(visualize,['languages/FSML/Python/sample.json'],['languages/FSML/Python/dot/sample.dot'])
