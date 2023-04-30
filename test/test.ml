open Votes

(* Q2.2 *)
let () =
  assert (compte "Kyle" Data.u1 = 4);
  assert (compte "Stan" Data.u1 = 5);
  assert (compte "Eric" Data.u1 = 7)

(* Q2.3 *)
let () =
  assert (
    depouiller Data.lc1 Data.u1 = [ ("Eric", 7); ("Kyle", 4); ("Stan", 5) ]);
  assert (
    depouiller Data.lc2 Data.u2
    = [ ("Eric", 6); ("Kyle", 4); ("Stan", 3); ("Keny", 3) ])

(* Q2.4 *)
let () =
  assert (
    union
      [ ("Eric", 7); ("Kyle", 4); ("Stan", 5) ]
      [ ("Eric", 6); ("Kyle", 4); ("Stan", 3); ("Keny", 3) ]
    = [ ("Eric", 13); ("Kyle", 8); ("Stan", 8); ("Keny", 3) ])

