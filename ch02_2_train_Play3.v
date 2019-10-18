(*
練習問題 2.2 Play3.play を正しく定義せよ.
*)

Inductive janken : Set :=
  | gu
  | choki
  | pa.

Definition wins t1 t2 :=
  match t1, t2 with
  | gu, choki => true
  | choki, pa => true
  | pa, gu    => true
  | _, _      => false
  end.

(* Check wins. *)

Definition weakness t :=
  match t with
  | gu    => pa
  | choki => gu
  | pa    => choki
  end.

Eval compute in wins gu pa.
Eval compute in wins gu choki.
Eval compute in wins gu gu.
Eval compute in wins choki gu.
Eval compute in wins choki pa.
Eval compute in wins choki choki.
Eval compute in wins pa choki.
Eval compute in wins pa gu.
Eval compute in wins pa pa.


                

Module Play3.
  Inductive winner : Set :=
    | first
    | second
    | third
    | aiko.

  Definition play t1 t2 t3 :=
    if wins t1 t2 then
      if wins t1 t3 then first
      else aiko
    else if wins t2 t1 then
      if wins t2 t3 then second
      else aiko
    else if wins t3 t1 then
      if wins t3 t2 then third
      else aiko
    else aiko.
  

  Eval compute in play gu choki choki.
  Eval compute in play pa choki pa.
  Eval compute in play gu gu pa.

  (* この記述では、以下のように２人が勝ちの場合は正しく判定されない *)
  Eval compute in play gu gu choki.
  Eval compute in play pa pa gu.
  Eval compute in play pa choki choki.
    
End Play3.
