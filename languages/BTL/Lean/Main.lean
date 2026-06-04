/-
BTL in Lean 4

Run with:

  lean Main.lean

No Mathlib required.
-/

namespace BTL

/-- BTL types. -/
inductive Ty where
  | bool
  | nat
  deriving DecidableEq, Repr

/-- BTL syntax. -/
inductive Term where
  | tru
  | fls
  | zero
  | succ   : Term → Term
  | pred   : Term → Term
  | iszero : Term → Term
  | ite    : Term → Term → Term → Term
  deriving DecidableEq, Repr

/-- Boolean values: true and false. -/
inductive BoolVal : Term → Prop where
  | tru : BoolVal Term.tru
  | fls : BoolVal Term.fls

/-- Numeric values: zero, succ zero, succ (succ zero), ... -/
inductive NatVal : Term → Prop where
  | zero : NatVal Term.zero
  | succ {t : Term} : NatVal t → NatVal (Term.succ t)

/-- Values are boolean values or numeric values. -/
inductive Value : Term → Prop where
  | bool {t : Term} : BoolVal t → Value t
  | nat  {t : Term} : NatVal t → Value t

/-- Small-step operational semantics. -/
inductive Step : Term → Term → Prop where
  | succ {t t' : Term} :
      Step t t' →
      Step (Term.succ t) (Term.succ t')

  | pred {t t' : Term} :
      Step t t' →
      Step (Term.pred t) (Term.pred t')

  | pred_zero :
      Step (Term.pred Term.zero) Term.zero

  | pred_succ {n : Term} :
      NatVal n →
      Step (Term.pred (Term.succ n)) n

  | iszero {t t' : Term} :
      Step t t' →
      Step (Term.iszero t) (Term.iszero t')

  | iszero_zero :
      Step (Term.iszero Term.zero) Term.tru

  | iszero_succ {n : Term} :
      NatVal n →
      Step (Term.iszero (Term.succ n)) Term.fls

  | ite {t0 t0' t1 t2 : Term} :
      Step t0 t0' →
      Step (Term.ite t0 t1 t2) (Term.ite t0' t1 t2)

  | ite_true {t1 t2 : Term} :
      Step (Term.ite Term.tru t1 t2) t1

  | ite_false {t1 t2 : Term} :
      Step (Term.ite Term.fls t1 t2) t2

/-- Typing relation. -/
inductive HasType : Term → Ty → Prop where
  | tTrue :
      HasType Term.tru Ty.bool

  | tFalse :
      HasType Term.fls Ty.bool

  | tZero :
      HasType Term.zero Ty.nat

  | tSucc {t : Term} :
      HasType t Ty.nat →
      HasType (Term.succ t) Ty.nat

  | tPred {t : Term} :
      HasType t Ty.nat →
      HasType (Term.pred t) Ty.nat

  | tIsZero {t : Term} :
      HasType t Ty.nat →
      HasType (Term.iszero t) Ty.bool

  | tIf {t0 t1 t2 : Term} {T : Ty} :
      HasType t0 Ty.bool →
      HasType t1 T →
      HasType t2 T →
      HasType (Term.ite t0 t1 t2) T

/--
Canonical form for natural numbers.
Theorem: A value of type Nat must be a numeric value.
Since t is a value, it is either a boolean value or a numeric value.
If it is a boolean value, then t is either true or false.
Neither true nor false can have type Nat, contradicting the assumption that t has type Nat.
If it is a numeric value, then we are done immediately.
-/
theorem canonical_nat {t : Term} :
    HasType t Ty.nat → Value t → NatVal t := by
  intro ht hv
  cases hv with
  | bool hb =>
      /- shorter like this: cases hb <;> cases ht -/
      cases hb with
      | tru =>
          cases ht
      | fls =>
          cases ht
  | nat hn =>
      exact hn

/-- Canonical form for booleans. -/
theorem canonical_bool {t : Term} :
    HasType t Ty.bool → Value t → BoolVal t := by
  intro ht hv
  cases hv with
  | bool hb =>
      exact hb
  | nat hn =>
      cases hn with
      | zero =>
          cases ht
      | succ hn' =>
          cases ht

/--
Preservation:

If `t` has type `T` and `t` steps to `t'`,
then `t'` also has type `T`.
-/
theorem preservation {t t' : Term} {T : Ty} :
    HasType t T → Step t t' → HasType t' T := by
  intro ht hs
  induction hs generalizing T with
  | succ hs ih =>
      cases ht with
      | tSucc ht1 =>
          exact HasType.tSucc (ih ht1)

  | pred hs ih =>
      cases ht with
      | tPred ht1 =>
          exact HasType.tPred (ih ht1)

  | pred_zero =>
      cases ht with
      | tPred ht1 =>
          cases ht1
          exact HasType.tZero

  | pred_succ hn =>
      cases ht with
      | tPred ht1 =>
          cases ht1 with
          | tSucc htNat =>
              exact htNat

  | iszero hs ih =>
      cases ht with
      | tIsZero ht1 =>
          exact HasType.tIsZero (ih ht1)

  | iszero_zero =>
      cases ht with
      | tIsZero ht1 =>
          cases ht1
          exact HasType.tTrue

  | iszero_succ hn =>
      cases ht with
      | tIsZero ht1 =>
          exact HasType.tFalse

  | ite hs ih =>
      cases ht with
      | tIf ht0 ht1 ht2 =>
          exact HasType.tIf (ih ht0) ht1 ht2

  | ite_true =>
      cases ht with
      | tIf ht0 ht1 ht2 =>
          exact ht1

  | ite_false =>
      cases ht with
      | tIf ht0 ht1 ht2 =>
          exact ht2

/--
Progress:

A well-typed BTL term is either already a value,
or it can take a small step.
-/
theorem progress {t : Term} {T : Ty} :
    HasType t T → Value t ∨ ∃ t', Step t t' := by
  intro ht
  induction ht with
  | tTrue =>
      exact Or.inl (Value.bool BoolVal.tru)

  | tFalse =>
      exact Or.inl (Value.bool BoolVal.fls)

  | tZero =>
      exact Or.inl (Value.nat NatVal.zero)

  | tSucc ht ih =>
      cases ih with
      | inl hv =>
          have hn : NatVal _ := canonical_nat ht hv
          exact Or.inl (Value.nat (NatVal.succ hn))
      | inr hstep =>
          rcases hstep with ⟨t', hs⟩
          exact Or.inr ⟨Term.succ t', Step.succ hs⟩

  | tPred ht ih =>
      cases ih with
      | inl hv =>
          have hn : NatVal _ := canonical_nat ht hv
          cases hn with
          | zero =>
              exact Or.inr ⟨Term.zero, Step.pred_zero⟩
          | succ hn' =>
              exact Or.inr ⟨_, Step.pred_succ hn'⟩
      | inr hstep =>
          rcases hstep with ⟨t', hs⟩
          exact Or.inr ⟨Term.pred t', Step.pred hs⟩

  | tIsZero ht ih =>
      cases ih with
      | inl hv =>
          have hn : NatVal _ := canonical_nat ht hv
          cases hn with
          | zero =>
              exact Or.inr ⟨Term.tru, Step.iszero_zero⟩
          | succ hn' =>
              exact Or.inr ⟨Term.fls, Step.iszero_succ hn'⟩
      | inr hstep =>
          rcases hstep with ⟨t', hs⟩
          exact Or.inr ⟨Term.iszero t', Step.iszero hs⟩

  | tIf ht0 ht1 ht2 ih0 ih1 ih2 =>
      cases ih0 with
      | inl hv0 =>
          have hb : BoolVal _ := canonical_bool ht0 hv0
          cases hb with
          | tru =>
              exact Or.inr ⟨_, Step.ite_true⟩
          | fls =>
              exact Or.inr ⟨_, Step.ite_false⟩
      | inr hstep =>
          rcases hstep with ⟨t0', hs0⟩
          exact Or.inr ⟨Term.ite t0' _ _, Step.ite hs0⟩

/--
One-step type soundness:

A well-typed term is either a value,
or it can step to another term of the same type.
-/
theorem soundness_one_step {t : Term} {T : Ty} :
    HasType t T → Value t ∨ ∃ t', Step t t' ∧ HasType t' T := by
  intro ht
  cases progress ht with
  | inl hv =>
      exact Or.inl hv
  | inr hstep =>
      rcases hstep with ⟨t', hs⟩
      exact Or.inr ⟨t', hs, preservation ht hs⟩

/-
Executable type checker.
-/

def typeOf? : Term → Option Ty
  | Term.tru =>
      some Ty.bool

  | Term.fls =>
      some Ty.bool

  | Term.zero =>
      some Ty.nat

  | Term.succ t =>
      match typeOf? t with
      | some Ty.nat => some Ty.nat
      | _ => none

  | Term.pred t =>
      match typeOf? t with
      | some Ty.nat => some Ty.nat
      | _ => none

  | Term.iszero t =>
      match typeOf? t with
      | some Ty.nat => some Ty.bool
      | _ => none

  | Term.ite t0 t1 t2 =>
      match typeOf? t0, typeOf? t1, typeOf? t2 with
      | some Ty.bool, some T1, some T2 =>
          if T1 = T2 then some T1 else none
      | _, _, _ =>
          none

/-
Executable one-step evaluator.
-/

def isNatVal : Term → Bool
  | Term.zero =>
      true
  | Term.succ t =>
      isNatVal t
  | _ =>
      false

def step? : Term → Option Term
  | Term.succ t =>
      match step? t with
      | some t' => some (Term.succ t')
      | none => none

  | Term.pred Term.zero =>
      some Term.zero

  | Term.pred (Term.succ n) =>
      if isNatVal n then
        some n
      else
        match step? (Term.succ n) with
        | some t' => some (Term.pred t')
        | none => none

  | Term.pred t =>
      match step? t with
      | some t' => some (Term.pred t')
      | none => none

  | Term.iszero Term.zero =>
      some Term.tru

  | Term.iszero (Term.succ n) =>
      if isNatVal n then
        some Term.fls
      else
        match step? (Term.succ n) with
        | some t' => some (Term.iszero t')
        | none => none

  | Term.iszero t =>
      match step? t with
      | some t' => some (Term.iszero t')
      | none => none

  | Term.ite Term.tru t1 _t2 =>
      some t1

  | Term.ite Term.fls _t1 t2 =>
      some t2

  | Term.ite t0 t1 t2 =>
      match step? t0 with
      | some t0' => some (Term.ite t0' t1 t2)
      | none => none

  | _ =>
      none

/--
Fuel-bounded evaluator.

This computes repeated small steps.
With fuel 0, it returns the input term unchanged.
-/
def evalFuel : Nat → Term → Term
  | 0, t =>
      t
  | fuel + 1, t =>
      match step? t with
      | some t' => evalFuel fuel t'
      | none => t

/--
Fuel-bounded trace.

This returns the whole reduction sequence up to the fuel limit.
-/
def traceFuel : Nat → Term → List Term
  | 0, t =>
      [t]
  | fuel + 1, t =>
      match step? t with
      | some t' => t :: traceFuel fuel t'
      | none => [t]

/-
Logical reflexive/transitive closure.
-/

inductive MultiStep : Term → Term → Prop where
  | refl {t : Term} :
      MultiStep t t
  | step {t u v : Term} :
      Step t u →
      MultiStep u v →
      MultiStep t v

/-
Sample terms, matching the Haskell samples.
-/

def sampleExpr : Term :=
  Term.pred
    (Term.ite
      (Term.iszero Term.zero)
      (Term.succ (Term.succ Term.zero))
      Term.zero)

def illtypedSampleExpr : Term :=
  Term.succ Term.tru

/-
Typing examples.
-/

example : HasType sampleExpr Ty.nat := by
  unfold sampleExpr
  exact
    HasType.tPred
      (HasType.tIf
        (HasType.tIsZero HasType.tZero)
        (HasType.tSucc (HasType.tSucc HasType.tZero))
        HasType.tZero)

example : ¬ HasType illtypedSampleExpr Ty.nat := by
  intro h
  unfold illtypedSampleExpr at h
  cases h with
  | tSucc h1 =>
      cases h1

/-
Logical multi-step sample:

  pred (if (iszero zero) then succ (succ zero) else zero)
  --> pred (if true then succ (succ zero) else zero)
  --> pred (succ (succ zero))
  --> succ zero
-/

example :
    MultiStep sampleExpr (Term.succ Term.zero) := by
  unfold sampleExpr
  apply MultiStep.step
  · apply Step.pred
    apply Step.ite
    exact Step.iszero_zero
  apply MultiStep.step
  · apply Step.pred
    exact Step.ite_true
  apply MultiStep.step
  · exact Step.pred_succ (NatVal.succ NatVal.zero)
  exact MultiStep.refl

/-
Things to inspect from the command line.

Running

  lean Main.lean

will print output for these #check and #eval commands.
-/

#check Ty
#check Term
#check Step
#check HasType
#check preservation
#check progress
#check soundness_one_step
#check MultiStep
#check evalFuel
#check traceFuel

#eval typeOf? sampleExpr
#eval typeOf? illtypedSampleExpr

#eval step? sampleExpr
#eval traceFuel 10 sampleExpr
#eval evalFuel 10 sampleExpr

#eval step? (Term.iszero Term.zero)
#eval step? (Term.pred (Term.succ Term.zero))
#eval evalFuel 10 (Term.pred (Term.succ (Term.succ Term.zero)))

end BTL
