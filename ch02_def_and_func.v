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

(* 整数とモジュール *)
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

(* データ型の定義 *)
Inductive janken : Set :=
  | gu
  | choki
  | pa.

Definition weakness t :=
  match t with
  | gu    => pa
  | choki => gu
  | pa    => choki
  end.
Eval compute in weakness pa.
Print bool.
Print janken.

Definition wins t1 t2 :=
  match t1, t2 with
  | gu, choki => true
  | choki, pa => true
  | pa,    gu => true
  | _, _      => false
  end.
Check wins.
Eval compute in wins gu pa.

Module Play2.
  Inductive winner : Set :=
    | first
    | second
    | aiko.

  Definition play t1 t2 :=
    if wins t1 t2 then first else
    if wins t2 t1 then second else
    aiko.

  Eval compute in play gu pa.
  Eval compute in play choki choki.
End Play2.

Print andb.
Print orb.

Module Play3.
  Inductive winner : Set :=
    | first
    | second
    | third
    | aiko.

  Definition play (t1 t2 t3 : janken) : winner := aiko.
End Play3.
