# File _languages/PPL/tests/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/PPL/tests/.ueber)**
```
[
  macro(fxy(pp, 'text.ppl', ppl(term), 'text.txt', text)),
  macro(fxy(pp, 'vbox.ppl', ppl(term), 'vbox.txt', text)),
  macro(fxy(pp, 'vlist.ppl', ppl(term), 'vbox.txt', text)),
  % ...
% BEGIN ...
  macro(fxy(pp, 'hbox.ppl', ppl(term), 'hbox.txt', text)),
  macro(fxy(pp, 'hlist.ppl', ppl(term), 'hbox.txt', text)),
  macro(fxy(pp, 'hseplist.ppl', ppl(term), 'hseplist.txt', text)),
  macro(fxy(pp, 'indent.ppl', ppl(term), 'indent.txt', text))
% END ...
].
```

## Languages
* [Ueber](../languages/Ueber.md)

## References
* elementOf('languages/PPL/tests/.ueber',ueber(term))
