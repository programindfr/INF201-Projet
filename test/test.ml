open Votes
open Data

(* Q2.2 *)
let () =
  assert (compte "Kyle" u1 = 4);
  assert (compte "Stan" u1 = 5);
  assert (compte "Eric" u1 = 7)

(* Q2.3 *)
let () =
  assert (depouiller lc1 u1 = r1);
  assert (depouiller lc2 u2 = r2)

(* Q2.4 *)
let () = assert (union r1 r2 = r3)

(* Q2.5 *)

let () =
  assert (max_depouiller r4 = ("Kyle", 4));
  assert (max_depouiller r5 = ("Kenny", 13))

(* Q2.6 *)

let () =
  assert (vainqueur_scrutin_uninominal u1 lc1 = "Eric");
  assert (vainqueur_scrutin_uninominal u2 lc2 = "Eric")

(* Q2.7 *)

let () =
  assert (suppr_elem [ "a"; "b"; "c" ] "b" = [ "a"; "c" ]);
  assert (suppr_elem [ "a"; "b"; "a" ] "a" = [ "b"; "a" ])

let () =
  assert (deux_premiers u1 lc1 = (("Eric", 7), ("Stan", 5)));
  assert (deux_premiers u2 lc2 = (("Eric", 6), ("Kyle", 4)))

(* Q3.12 *)

let () = assert (depouille_jm ujm1 = ms)

(* Q3.13 *)

let () = assert (tri b1 = [ Arejeter; Passable; Assezbien; Tresbien ])
let () = assert (tri_mentions ms = ms_triee)

(* Q3.14 *)

let () =
  assert (mediane @@ List.nth ms_triee 0 = Tresbien);
  assert (mediane @@ List.nth ms_triee 1 = Assezbien);
  assert (mediane @@ List.nth ms_triee 2 = Arejeter)

(* Q3.15 *)

let () = assert (meilleure_mediane ms_triee = Tresbien)

(* Q3.16 *)

let () =
  assert (
    supprime_perdants ms_triee
    = [
        [ Assezbien; Tresbien; Tresbien ];
        [];
        [];
        [ Passable; Tresbien; Tresbien ];
      ])

(* Q3.17 *)

let () =
  assert (
    supprime_mention Tresbien @@ List.nth ms_triee 0 = [ Assezbien; Tresbien ]);
  assert (
    supprime_mention Tresbien @@ List.nth ms_triee 1
    = [ Arejeter; Assezbien; Assezbien ])
