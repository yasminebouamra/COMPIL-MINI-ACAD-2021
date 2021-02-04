%{
	#include "syntaxique.tab.h"
	int nblignes=1;
	}%
/* regex */
/* declaration des types */
SNombre [0-9]
INTEGER {SNombre}{SNombre}*|-{SNombre}{SNombre}*
FLOAT {INTEGER}.{SNombre}*
CHAR [A-Z|a-z|0-9]
STRING {CHAR}{CHAR}*
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
TIO \"({STRING}{FIO}*)*\"
/* format IO */
FTIO \({TIO}\|{IDF}*\)
%%
/* bibliothèques : doivent commencer par ## */
"##" return mc_import;
"PROCESS" return lib_process;
"LOOP" return lib_loop;
"ARRAY" return lib_array;
/* mot réservés */
/* debut du programme */
"PROGRAMME" return mc_start;
/* declaration des variables */
"VAR" return mc_decvar;
/* conditions */
"EXECUT" return mc_execut;
"IF" return mc_if;
"ELSE" return mc_else;
"END_IF" return mc_endif;
/* loops */
"While" return mc_while;
/* fonctions IO */
"READ" return fonc_entree;
"WRITE" return fonc_sortie;
/* acolades et paranthèses */
"(" return mc_po;
")" return mc_pf;
"{" return mc_ao;
"}" return mc_af;
"@" return mc_adresse;
"SUP" return mc_sup;
"SUPE" return mc_supe;
"INF" return mc_inf;
"INFE" return mc_infe;
"DIFF" return mc_diff;
"EG" return mc_eg;
":=" return mc_aff;
"|" return mc_sep;
/* fin de ligne */
"$" return endinst;
\n {nblignes++; return new_line;}
[ \t] 
. {printf("erreur dans la ligne %d a l'entite %s",nblignes,yytext); return err;}
