(* 定義と関数 *)
Definition one' := 1.
Print one'.
Definition one : nat := 1.
Definition double x := x + x.
Print double.
Eval compute in double 2.
Definition double' := fun x => x + x.
Print double'.
Definition quad x := let y := double x in 2 * y.
Eval compute in quad 2.
Definition quad' x := double (double x).
Eval compute in quad' 2.
Definition triple x :=
  let double x := x + x in
  double x + x.
Eval compute in triple 3.
Eval compute in 1 - 2.

Require Import ZArith.
Module Z.
  Open Scope Z_scope.

  Eval compute in 1 - 2.
  Eval compute in (2 + 3) / 2.

  Definition p (x y : Z) := 2 * x - y * y.
  Print p.

  Eval compute in p 3 4.

  Definition p' := fun x => fun y => 2 * x - y * y.
  Print p'.
  Definition q := p 3.

  Eval compute [p q] in q.
  Eval compute in q 4.

  Eval compute in let x := 0 in q x.
  Eval compute in let x := 0 in q x.
End Z.

Print Z.p.

Eval compute in 1 - 2.

(* 整数とモジュール *)
Eval compute in 1 - 2.

Require Import ZArith.
Module Z.
  Open Scope Z_scope.
