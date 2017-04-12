# File _languages/LAL/lib/differencing.lal2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/differencing.lal2)**
```
sort Any
sort L <= Any
sort DiffAny
sort DiffL <= DiffAny
function diff : L # L -> DiffL
function applyDiff : DiffL # L -> L
function invDiff : DiffL -> DiffL
...
```
