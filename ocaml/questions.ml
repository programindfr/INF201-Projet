(* Q2.1 *)
type candidat = string;; (* Réstriction aux chaînes représentants un candidat. *)
type bulletin = candidat;;
type urne = bulletin list;;
type score = int;; (* Réstriction aux entiers positifs. *)
type panel = candidat list;;



let lc1 = ["Eric";"Kyle";"Stan"];;
let u1 = ["Eric";"Kyle";"Stan";"Kyle";"Kyle";"Stan";"Eric";"Eric";"Kyle";"Eric";"Stan";"Eric";"Eric";"Eric";"Stan";"Stan"];;
(* Q2.2 *)
let rec compte (c: candidat) (u: urne) : score =
  match u with
  | [] -> 0
  | t::q -> if t = c then 1 + (compte c q) else (compte c q);;



(* Q2.3 *)
type resultat = candidat*score;;
let rec depouiller (lc: panel) (u: urne) : resultat list =
  match lc with
  | [] -> []
  | t::q -> (t, compte t u)::(depouiller q u);;



(* Q2.4 *)
let union (r1: resultat) (r2: resultat) : resultat =
  let (c1, s1) = r1 and (c2, s2) = r2 in
if c1 = c2 then (c1, s1 + s2) else failwith "Les candidats sont différents.";;



(* Q2.5 *)
let rec max_depouiller (l: resultat list) : resultat =
  match l with
  | [] -> failwith "Il n'y à pas de resultat."
  | [e] -> e
  | t::q -> let (c1, s1) = t and (c2, s2) = (max_depouiller q) in
  if s1 > s2 then t else (c2, s2);;



(* Q2.6 *)
let vainqueur_scrutin_uninominal (u: urne) (lc: panel) : candidat =
  let (c, s) = max_depouiller (depouiller lc u) in c;;



(* Q2.7 *)
let rec suppr_elem (l: 'a list) (e: 'a) : 'a list =
  match l with
  | [] -> []
  | t::q -> if t = e then q else t::(suppr_elem q e);;

let deux_premiers (u: urne) (lc: panel) : resultat*resultat =
  let (c1, s1) = (max_depouiller (depouiller lc u)) in
  let c2 = (max_depouiller (depouiller (suppr_elem lc c1) u)) in
((c1, s1), c2);;



(* Q3.11 *)
type mention = Arejeter | Insuffisant | Passable | Assezbien | Bien | Tresbien;;
type bulletin_jm = mention list;;
type urne_jm = bulletin_jm list;;



(* Q3.12 *)
let my_urne_jm =
  [[Tresbien; Assezbien; Arejeter; Passable]; (* Premier bulletin *)
  [Assezbien; Assezbien; Arejeter; Tresbien]; (* Second bulletin *)
  [Tresbien; Arejeter; Arejeter; Tresbien]];; (* Troisième bulletin *)

let rec depouille_jm (u: urne_jm) : mention list list =
  match u with
  | [] -> []
  | e -> (List.map (List.hd) u)::(
    match (List.hd u) with
    | [] -> []
    | [e] -> []
    | e -> depouille_jm (List.map (List.tl) u)
  );;



(* Q3.13 *)
let tri (l:'a list):'a list = List.sort compare l;;
let tri_mentions (u: mention list list) : mention list list = List.map (tri) u;;



(* Q3.14 *)
let mediane (l: 'a list) : 'a = List.nth l ((List.length l) / 2);;



(* Q3.15 *)
let ms =
  [[Tresbien; Assezbien; Tresbien]; [Assezbien; Assezbien; Arejeter];
  [Arejeter; Arejeter; Arejeter]; [Passable; Tresbien; Tresbien]];;
let ms_triee =
  [[Assezbien; Tresbien; Tresbien]; [Arejeter; Assezbien; Assezbien];
  [Arejeter; Arejeter; Arejeter]; [Passable; Tresbien; Tresbien]];;
let meilleur_mediane (u: mention list list) : mention =
  let medList = List.map (mediane) (tri_mentions u) in
    tri medList |> List.rev |> List.hd;;



(* Q3.16 *)
let supprime_perdants (u: mention list list) : mention list list =
  let med = meilleur_mediane u in
    List.map (
      fun (l: mention list ) : mention list -> if mediane l < med then [] else l
    ) u;;



(* Q3.17 *)
let ms_triee_supr = supprime_perdants ms_triee;;
let rec supprime_mention (l: mention list) (e: mention) : mention list =
  match l with
  | [] -> []
  | t::q -> if t = e then q else t::(supprime_mention q e);;

let supprime_meilleure_mediane (u: mention list list) : mention list list =
  List.map (
    fun (l: mention list) : mention list ->
      if l = [] then [] else l |> mediane |> supprime_mention l
  ) u;;



(* Q3.18 *)


(* let rec vainqueur_jm (lc: panel) (u: urne_jm) : candidat =
  let rec use_supprime_perdants (u: urne_jm) : mention list =
    match u with
    | [] -> []
    | t::q -> if t=[] then use_supprime_perdants q else (mediane t)::use_supprime_perdants q
  in
  match u with
  | [] -> ""
  | e -> if (
      List.fold_left (
        fun a b -> a = b
      ) true (use_supprime_perdants u)
    ) then (
      let new_u = supprime_perdants u in vainqueur_jm lc new_u
    ) else (

    );; *)
let rec vainqueur_jm (lc: panel) (u: urne_jm) : candidat =
  let rec mediane_liste (u: urne_jm) : mention list =
    match u with
    | [] -> []
    | t::q -> if t=[] then mediane_liste q else (mediane t)::mediane_liste q
  in
  match u with
  | [] -> ""
  | e -> if ( (* la liste de mediane est egale a la liste qui contient que les meilleur medianes *)
      let medListe = mediane_liste u and bestMed = meilleur_mediane u in List.filter (fun (ms: mention) -> ms = bestMed) medListe <> medListe (* condition d'arret q16 *)
    ) then (
      let new_u = supprime_perdants u in vainqueur_jm lc new_u
    ) else (
      if ( (* liste de listes vides avec une liste non vide && mediane superieur aux autres *)
        List.length (List.filter (fun l->if l<>[] then true else false) u) <> 1 && let bestMed = 
      ) then (

      ) else (

      )
    );;