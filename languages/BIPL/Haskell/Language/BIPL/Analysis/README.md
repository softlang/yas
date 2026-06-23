# Summary of BIPL Analyses

All these analyses obey compositionality in the sense of denotational semantics; they leverage different abstract domains -- in the sense of abstract interpretation -- for different properties of interest. Typically, the coverage of while-loops is the most interesting, as different types of fixed-point computation are required.

Each analysis is structured like this:
* BIPL/Haskell/Language/BIPL/Analysis/.../Sample.hs -- Illustrative examples in abstract syntax
* BIPL/Haskell/Language/BIPL/Analysis/.../Domain.hs -- (Abstract) domains for analysis
* BIPL/Haskell/Language/BIPL/Analysis/.../...Analysis.hs -- An algebra and helpers for the analysis
* Main.hs -- Test invocations of the analysis

## 1. Type-state analysis: abstract interpretation as lightweight type checking

https://github.com/softlang/yas/tree/master/languages/BIPL/Haskell/Language/BIPL/Analysis/TypeState

**Purpose.**  
Type-state analysis detects type inconsistencies in a language whose syntax does not enforce a static type discipline (such as by means of variable declarations). It interprets expressions and assignments over a small type lattice rather than over concrete values.

**Motivating BIPL snippet**

```
x := 1;
x := x >= 0
```

The snippet assigns an integer to `x` first and then assigns a boolean to the same variable. This is syntactically allowed, but the analysis can flag that `x` has inconsistent type usage.

**Abstract domain.**  
The type domain contains bottom, integer type, boolean type, and type error. Bottom represents no information or unreachable information. Type error is the top element and records inconsistency. A type environment maps variables to their inferred type states.

**Technicalities.**  
Assignments join the new type with any previous type for the variable. Therefore, assigning both an integer and a boolean to the same variable yields a type error. Guards are also checked: conditionals and loops require boolean guards, and ill-typed guards are reflected in the resulting environment. Loops use fixed-point iteration over the finite type lattice. Because the domain is finite, naive iteration is sufficient.

**Pragmatics: observation and diagnostics.**  
Diagnostics are encoded in the resulting abstract environment rather than emitted as a separate warning stream. A consumer inspects variables and special error markers to determine whether the program is type-consistent. This makes the analysis simple but somewhat indirect from a user-interface perspective.

---

## 2. Sign analysis: first abstract interpretation example

https://github.com/softlang/yas/tree/master/languages/BIPL/Haskell/Language/BIPL/Analysis/Sign

**Purpose.**  
Sign analysis infers coarse numeric facts: whether integer expressions are definitely positive, definitely negative, or definitely zero. It is a small and clear example of abstract interpretation in the BIPL analysis suite: instead of executing the program over concrete integers and booleans, the semantics is reused over an abstract domain of signs and abstract booleans.

**Motivating BIPL snippet**

```
x := 1;
if x >= 0 then
  y := x
else
  y := -1
```

Here, the analysis can infer that `x` is positive after the first assignment, and that the guard `x >= 0` is definitely true. The interesting point is not the computation itself, but the replacement of concrete values by abstract signs.

**Abstract domain.**  
Expressions are interpreted as either sign information or abstract boolean information. Stores map variables to abstract values. Integer constants are mapped to signs, variables are looked up in the abstract store, arithmetic is lifted to sign operations, and comparisons produce abstract booleans.

**Technicalities.**  
Loops are handled by fixed-point computation. The implementation repeatedly applies the loop transformer until two consecutive approximants agree. This works naturally for finite-height domains such as signs.

**Pragmatics: observation and diagnostics.**  
The output is mainly a final abstract store, not a list of warnings. The analysis is useful for explaining what can be known about variable signs after a program (or after each statement). It also illustrates how quickly precision can be lost in loops, where results may become top/unknown.

---

## 3. Interval analysis: more informative numeric abstraction

https://github.com/softlang/yas/tree/master/languages/BIPL/Haskell/Language/BIPL/Analysis/Interval

**Purpose.**  
Interval analysis refines sign analysis by tracking numeric ranges instead of only signs. This makes it possible to reason about bounds, counters, and simple guard conditions more precisely.

**Motivating BIPL snippet**

```
i := 0;
while i <= 10 do
  i := i + 1
```

This program motivates interval analysis because sign information alone would mostly say that `i` is non-negative, while interval information can express that `i` starts in `[0,0]` and then grows. In principle, one would like to infer a loop invariant such as `i ∈ [0,11]`, though widening may produce a less precise upper bound.

**Abstract domain.**  
The domain contains integer intervals with finite and infinite bounds, an explicit bottom interval, abstract booleans, and a top value for imprecision. Environments map variables to abstract values.

**Technicalities.**  
Loops use widening. The analysis joins the input state with the effect of one loop iteration while the condition may hold. After a small number of iterations, widening is applied so that growing intervals stabilize. This is essential because interval domains can have infinite ascending chains such as `[0,0]`, `[0,1]`, `[0,2]`, and so on.

**Pragmatics: observation and diagnostics.**  
The output is a final interval environment. The result should be read as a safe over-approximation, not as an exact range. Widening makes the analysis terminate, but it may replace precise bounds by infinity. Thus, this analysis is good for finding broad range facts, not for proving tight numeric postconditions.

---

## 4. Dead-code analysis: value abstraction plus diagnostics

https://github.com/softlang/yas/tree/master/languages/BIPL/Haskell/Language/BIPL/Analysis/DeadCode

**Purpose.**  
Dead-code analysis reports branches or loop bodies that are definitely unreachable because a guard can be evaluated statically in the abstract domain.

**Motivating BIPL snippet**

```
x := 1;
if x > 0 then
  y := 1
else
  y := 2
```

The snippet motivates the analysis because the condition `x > 0` is definitely true after `x := 1`. Therefore, the `else` branch is unreachable. Unlike sign or interval analysis, the main product here is a diagnostic: the analysis should tell the programmer that part of the program cannot execute.

**Abstract domain.**  
The domain tracks small constant information: known integers, known booleans, bottom, and top. Environments map variables to abstract values. This is enough to evaluate simple guards exactly when constants are available.

**Technicalities.**  
Conditionals inspect the abstract truth value of the guard. If the guard is known true, only the then-branch is analyzed and the else-branch is reported unreachable. If the guard is known false, only the else-branch is analyzed and the then-branch is reported unreachable. If the guard is unknown, both branches are analyzed and their environments are joined.

Loops with definitely false guards produce an unreachable-loop-body diagnostic. Other loops use bounded fixed-point approximation.

**Pragmatics: observation and diagnostics.**  
This is a diagnostic-first analysis. The final abstract environment exists, but the most useful output is the list of unreachable syntactic constructs. It is intended to support programmer feedback rather than deep semantic proof.

---

## 5. Slicing/dependency analysis: provenance abstraction

https://github.com/softlang/yas/tree/master/languages/BIPL/Haskell/Language/BIPL/Analysis/Slicing

**Purpose.**  
Slicing analysis computes which source variables may influence each variable. Instead of asking “what value can this expression have?”, it asks “where could this value have come from?”

**Motivating BIPL snippet**

```
x := a + b;
y := x * c
```

The snippet shows a simple data-dependency chain. After the first assignment, `x` depends on `a` and `b`. After the second assignment, `y` depends on `x` and `c`, and therefore ultimately on `a`, `b`, and `c`.

**Abstract domain.**  
The abstract value of an expression is a set of variable names. An environment maps each program variable to the set of source variables on which it may depend. Unknown variables are treated as external inputs that depend on themselves, which is useful for analyzing open program fragments.

**Technicalities.**  
Constants have no dependencies. Variable expressions inherit the variable’s current dependency set. Compound expressions union the dependencies of their subexpressions. Assignment stores the expression dependencies, combined with the current program-counter dependencies.

Conditionals and loops introduce control dependencies. For example:

```
if secret then
  public := 1
else
  public := 0
```

Although neither assignment uses `secret` as a data value, the final value of `public` depends on the guard. The analysis accounts for this by adding guard dependencies to the program-counter context.

Loops are handled by bounded fixed-point iteration. The analysis also explicitly propagates guard dependencies to variables assigned in the loop body.

**Pragmatics: observation and diagnostics.**  
The result is a dependency environment, useful for answering slicing questions such as “which inputs can affect `z`?” It is not primarily a warning analysis. It supports program understanding, impact analysis, and as a foundation for more specialized analyses such as information flow.

---

## 6. Information-flow analysis: security lattice plus diagnostics

https://github.com/softlang/yas/tree/master/languages/BIPL/Haskell/Language/BIPL/Analysis/InformationFlow

**Purpose.**  
Information-flow analysis tracks confidentiality and reports possible leaks from high-security data to low-security/public sinks. It builds on the same dependency intuition as slicing, but interprets dependencies through a security lattice.

**Motivating BIPL snippet**

```
if secret then
  public := 1
else
  public := 0
```

This snippet motivates implicit-flow checking. The variable `secret` is never assigned directly to `public`, so there is no explicit data flow. Nevertheless, the final value of `public` reveals information about `secret`, because the branch taken depends on `secret`.

**Abstract domain.**  
The security domain is a two-point lattice: `Low <= High`. Variables mapped to `Low` are public or non-sensitive; variables mapped to `High` may contain secret information. The analysis also tracks a program-counter security level, representing whether execution is currently controlled by high-security information.

**Technicalities.**  
Expression security is computed as the join of the security levels of variables used in the expression. Assignment gives the target variable the join of the expression level and the current program-counter level. Thus, an assignment inside a branch controlled by a high guard becomes high even if the assigned expression is a constant.

Loops use fixed-point computation over the finite security lattice. Since the lattice is small, stabilization is straightforward, though implementations often keep an iteration cap for robustness.

**Pragmatics: observation and diagnostics.**  
This analysis produces both a final security environment and diagnostics. It distinguishes explicit leaks, implicit leaks, high-control guards, and final public-sink violations. The diagnostic output matters because simply saying “`public` is High” is often less helpful than explaining whether the cause was direct assignment, control flow, or a final sink check.

---

## 7. Termination analysis: syntactic variant recognizer

https://github.com/softlang/yas/tree/master/languages/BIPL/Haskell/Language/BIPL/Analysis/DeadCode

**Purpose.**  
Termination analysis looks for common counter-loop patterns that appear to move toward a loop bound. It is not a general termination prover. Instead, it is a lightweight syntactic recognizer for simple variants.

**Motivating BIPL snippet**

```
while i < 10 do
  i := i + 1
```

The snippet is a classic terminating counter loop. The guard gives an upper bound on `i`, and the body increments `i`, moving it toward the point where `i < 10` becomes false. The analysis tries to recognize exactly this kind of pattern.

A contrasting example is:

```
while i < 10 do
  i := i - 1
```

Here the guard still gives an upper bound, but the body moves `i` away from that bound, making the loop suspicious rather than provably terminating by this simple criterion.

**Abstract domain.**  
The domain is not a store of abstract values. Instead, it consists of syntactic findings: recognized guard bounds, recognized variable deltas, and verdicts such as proven variant, suspect variant, or unknown variant.

**Technicalities.**  
The analysis recognizes guards such as `x < c`, `x <= c`, `x > c`, and `x >= c`, including some reversed forms. It then looks for simple updates such as `x := x + k`, `x := k + x`, `x := x - k`, or `x := x`.

There is no fixed-point computation. Nested loops and conditionals are inspected structurally. For conditionals, the analysis can keep a known delta only when both branches change the variable consistently.

**Pragmatics: observation and diagnostics.**  
The result should be read as a heuristic diagnostic. “Proven” means proven only relative to the recognized syntactic pattern, not proven in a general semantic sense. “Unknown” means the loop may still terminate, but the simple recognizer could not establish it. This analysis is therefore useful for programmer guidance, not for full verification.
