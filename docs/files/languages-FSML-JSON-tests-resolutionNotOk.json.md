# File _languages/FSML/JSON/tests/resolutionNotOk.json_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/JSON/tests/resolutionNotOk.json)**
```
{
  "stateA": [{
      "initial": true,
      "transitions": {
        "eventI": [["actionI", "stateB"]],
        "eventII": [["actionII", "stateC"]] }}],
  "stateB": [{
      "initial": false,
      "transitions": { }}]
}
```
