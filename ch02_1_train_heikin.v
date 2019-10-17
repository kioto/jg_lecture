(*
   練習問題 2.1
   Z の中で二つの整数値の平均を計算する
   関数 heikin : Z -> Z -> Z を定義せよ.
*)

Require Import ZArith.
Module Z.
  Definition heikin (x y : nat) := (x + y) / 2.
  Eval compute in heikin 10 20.
End Z.
