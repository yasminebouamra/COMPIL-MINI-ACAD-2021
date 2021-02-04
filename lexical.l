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
TailleTab {SNombre}

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


/* fin de ligne */
"$" return endinst;


%%

%%
redef
%%
