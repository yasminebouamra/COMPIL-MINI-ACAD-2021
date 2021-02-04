%{
	#include "syntaxique.tab.h"
	int nblignes=1;
	}%
/* regex */
/* declaration des types */
SNombre [0-9]
INTEGER {SNombre}*|-{SNombre}*
FLOAT {INTEGER}.{SNombre}*
CHAR [A-Z|a-z]
STRING {CHAR}*
/* declaration des identificateurs */
IDF [A-Z]({CHAR}*{SNombre}*)*
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
/* format des conditions */

%%
/* bibliothèques : doivent commencer par ## */
"##" return mc_import;
"PROCESS" return lib_process;
"LOOP" return lib_loop;
"ARRAY" return lib_array;
/* debut du programme */
"PROGRAMME" return mc_start;
/* declaration des variables */
"VAR" return mc_decvar;
/* acolades et paranthèses */
"(" return mc_po;
")" return mc_pf;
"{" return mc_ao;
"}" return mc_af;
"@" return mc_adresse;
""

/* fin de ligne */
"$" return endinst;


%%

%%
redef
%%
