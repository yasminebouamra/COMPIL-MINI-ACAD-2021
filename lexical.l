%{
#include "syntaxique.tab.h"
int nblignes=1;
}%
SNombre ([0-9]+)
INTEGER [{SNombre}{SNombre}*|-{SNombre}{SNombre}*]
FLOAT ({INTEGER}.{SNombre}+)
CHAR .
STRING ({CHAR}+)
/* declaration des identificateurs */
IDF [A-Z]({CHAR}*{SNombre}*)*
/* operateurs conditions */
OpCond [SUP|SUPE|EG|DIFF|INF|INFE]
/* Taille tableau doit etre positive */
TailleTab {SNombre}
/* operateur arithmetique */
opArit [\+|\*|-|/]
/* commentaire */
commentaire \/\*{STRING}\*\/
/* format des input et output */
FIO [$|%|#|&]
/* format texte input et output */
TIO ({STRING}{FIO}*)*
%%
/* bibliothèques : doivent commencer par ## */
"##" {return mc_import; printf("mc_import");}
"PROCESS" {return lib_process; printf("lib_process");}
"LOOP" {return lib_loop; printf("lib_loop");}
"ARRAY" {return lib_array; printf("lib_array")}
/* mot réservés */
/* debut du programme */
"PROGRAMME" {return mc_start; printf("mc_start");}
/* declaration des variables */
"VAR" return {mc_decvar; printf("mc_decvar");}
/* conditions */
"EXECUT" {return mc_execut; printf("mc_execut")}
"IF" {return mc_if; printf("mc_if");}
"ELSE" {return mc_else; printf("mc_else");}
"END_IF" {return mc_endif; printf("mc_endif");}
/* loops */
"While" {return mc_while; printf("mc_while");}
/* fonctions IO */
"READ" {return fonc_entree; printf("fonc_entree");}
"WRITE" {return fonc_sortie; printf("fonc_sortie");}
/* acolades et paranthèses */
"(" {return mc_po; printf("mc_po");}
")" {return mc_pf; printf("mc_pf");}
"{" {return mc_ao; printf("mc_ao");}
"}" {return mc_af; printf("mc_af");}
"@" {return mc_adresse; printf("mc_adresse");}
"SUP" {return mc_sup; printf("mc_sup");}
"SUPE" {return mc_supe; printf("mc_supe");}
"INF" {return mc_inf; printf("mc_inf");}
"INFE" {return mc_infe; printf("mc_infe");}
"DIFF" {return mc_diff; printf("mc_diff");}
"EG" {return mc_eg; printf("mc_eg");}
":=" {return mc_aff; printf("mc_aff");}
"|" {return mc_sep; printf("mc_sep");}
/* fin de ligne */
"$" {return endinst; printf("endinst");}
\n {nblignes++; return new_line;}
[ \t] 
. {printf("erreur dans la ligne %d a l'entite %s",nblignes,yytext); return err;}
