(* Q2.1 *)
type candidat = string (* Restriction aux chaînes représentants un candidat. *)
type bulletin = candidat
type urne = bulletin list
type score = int (* Restriction aux entiers positifs. *)
type panel = candidat list

(* Q2.2 *)
let rec compte c = function
  | [] -> 0
  | t :: q -> if t = c then 1 + compte c q else compte c q

(* Q2.3 *)
type resultat = candidat * score

let rec depouiller lc u =
  match lc with [] -> [] | t :: q -> (t, compte t u) :: depouiller q u

(* Q2.4 *)
let union r1 r2 =
  let c1, s1 = r1 and c2, s2 = r2 in
  if c1 = c2 then (c1, s1 + s2) else failwith "Les candidats sont différents."

(* Q2.5 *)
let rec max_depouiller = function
  | [] -> failwith "Il n'y a pas de résultats."
  | [ e ] -> e
  | t :: q ->
      let _, s1 = t and c2, s2 = max_depouiller q in
      if s1 > s2 then t else (c2, s2)

(* Q2.6 *)
let vainqueur_scrutin_uninominal u lc =
  let c, _ = max_depouiller (depouiller lc u) in
  c

(* Q2.7 *)
let rec suppr_elem l e =
  match l with [] -> [] | t :: q -> if t = e then q else t :: suppr_elem q e

let deux_premiers u lc =
  let c1, s1 = max_depouiller (depouiller lc u) in
  let c2 = max_depouiller (depouiller (suppr_elem lc c1) u) in
  ((c1, s1), c2)

(* Q3.11 *)
type mention = Arejeter | Insuffisant | Passable | Assezbien | Bien | Tresbien
type bulletin_jm = mention list
type urne_jm = bulletin_jm list

(* Q3.12 *)
let rec depouille_jm u =
  match u with
  | [] -> []
  | hd :: _ ->
      List.map List.hd u
      ::
      (match hd with
      | [] -> []
      | [ _ ] -> []
      | _ -> depouille_jm (List.map List.tl u))

(* Q3.13 *)
let tri l = List.sort compare l
let tri_mentions = List.map tri

(* Q3.14 *)
let mediane l = List.nth l (List.length l / 2)

(* Q3.15 *)
let meilleur_mediane u =
  let medList = List.map mediane (tri_mentions u) in
  tri medList |> List.rev |> List.hd

(* Q3.16 *)
let supprime_perdants u =
  let med = meilleur_mediane u in
  List.map (fun l -> if mediane l < med then [] else l) u

(* Q3.17 *)
let rec supprime_mention e = function
  | [] -> []
  | hd :: tl -> if hd = e then tl else hd :: supprime_mention e tl

let supprime_meilleure_mediane =
  List.map @@ function [] -> [] | l -> supprime_mention (mediane l) l
