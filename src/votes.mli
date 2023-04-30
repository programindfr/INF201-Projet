(* Q2.1 *)
type candidat = string (* Restriction aux chaînes représentants un candidat. *)
type bulletin = candidat
type urne = bulletin list
type score = int (* Restriction aux entiers positifs. *)
type panel = candidat list

(* Q2.2 *)
val compte : candidat -> urne -> score

(* Q2.3 *)
type resultat = candidat * score

val depouiller : panel -> urne -> resultat list

(* Q2.4 *)
val union : resultat list -> resultat list -> resultat list

(* Q2.5 *)
val max_depouiller : resultat list -> resultat

(* Q2.6 *)
val vainqueur_scrutin_uninominal : urne -> panel -> candidat

(* Q2.7 *)
val suppr_elem : 'a list -> 'a -> 'a list
val deux_premiers : urne -> panel -> (candidat * score) * (candidat * score)

(* [...] *)

(* Q3.11 *)
type mention = Arejeter | Insuffisant | Passable | Assezbien | Bien | Tresbien
type bulletin_jm = mention list
type urne_jm = bulletin_jm list

(* Q3.12 *)
val depouille_jm : urne_jm -> mention list list

(* Q3.13 *)
val tri : 'a list -> 'a list
val tri_mentions : mention list list -> mention list list

(* Q3.14 *)
val mediane : 'a list -> 'a

(* Q3.15 *)
val meilleure_mediane : mention list list -> mention

(* Q3.16 *)
val supprime_perdants : mention list list -> mention list list

(* Q3.17 *)
val supprime_mention : mention -> mention list -> mention list
val supprime_meilleure_mediane : mention list list -> mention list list

(* Q3.18 *)
val vainqueur_jm : panel -> mention list list -> string
