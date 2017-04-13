# File _languages/FSML/Prolog/generated/StepperBase.java_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/generated/StepperBase.java)**
```
import java.util.HashMap;

// Reusable code
public abstract class StepperBase<S, I, A> {
    protected S state;
    protected HandlerBase<A> handler;
    private HashMap<S,HashMap<I,Pair<A,S>>> table =
...
```

## Languages
* [Java](../languages/Java.md) (java(text))

## References
* elementOf('languages/FSML/Prolog/generated/StepperBase.java',java(text))
