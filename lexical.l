%{
	#include "syntaxique.tab.h"
	int nblignes=1;
%}
SNombre [0-9]
INTEGER ([0-9]|\-[0-9])*
FLOAT ({INTEGER}.{SNombre}+)
IDF [A-Z]([A-Za-z]*{SNombre}*)*
IDFTAB {IDF}{TailleTab}
CHAR [A-Za-z0-9]
STRING \"{CHAR}*\"
OpCond [SUP|SUPE|EG|DIFF|INF|INFE]
TailleTab \[{SNombre}*\]
FIO [$|%|#|&]
TO \(\".*{FIO}\"\|{IDF}\)
TI \(\".*{FIO}\"\|@{IDF}\)
commentaire \/\*{STRING}\*\/
%%
"Programme" returns mc_pgm;
"##" {return mc_import; printf("mc_import\t");}
"PROCESS" {return lib_process; printf("lib_process\t");}
"LOOP" {return lib_loop; printf("lib_loop\t");}
"ARRAY" {return lib_array; printf("lib_array\t");}
"PROGRAMME" {return mc_start; printf("mc_start\t");}
"VAR" {return mc_decvar; printf("mc_decvar\t");}
"EXECUT" {return mc_execut; printf("mc_execut\t");}
"IF" {return mc_if; printf("mc_if\t");}
"ELSE" {return mc_else; printf("mc_else\t");}
"END_IF" {return mc_endif; printf("mc_endif\t");}
"While" {return mc_while; printf("mc_while\t");}
"READ" {return fonc_entree; printf("fonc_entree\t");}
"WRITE" {return fonc_sortie; printf("fonc_sortie\t");}
"(" {return mc_po; printf("mc_po\t");} 
")" {return mc_pf; printf("mc_pf\t");}
"{" {return mc_ao; printf("mc_ao\t");}
"}" {return mc_af; printf("mc_af\t");}
"@" {return mc_adresse; printf("mc_adresse\t");}
"SUP" {return mc_sup; printf("mc_sup\t");}
"SUPE" {return mc_supe; printf("mc_supe\t");}
"INF" {return mc_inf; printf("mc_inf\t");}
"INFE" {return mc_infe; printf("mc_infe\t");}
"DIFF" {return mc_diff; printf("mc_diff\t");}
"EG" {return mc_eg; printf("mc_eg\t");}
":=" {return mc_aff; printf("mc_aff\t");}
"|" {return mc_sept; printf("mc_sep\t");}
"+" {return mc_add; printf("mc_add\t");}
"*" {return mc_mul; printf("mc_mul\t");}
"-" {return mc_diff; printf("mc_diff\t");}
"/" {return mc_div; printf("mc_div\t");}
"$" {return endinst; printf("endinst\t");}
"::" {return mc_dp; printf("mc_dp\t");}
"//" {return mc_ds; printf("mc_ds\t");}
{INTEGER} {return int;printf("INTEGER\t");}
"INTEGER" {return mc_int;printf("mc_int\t");}
{FLOAT} {return float;printf("FLOAT\t");}
"FLOAT" {return mc_float;printf("mc_float\t");}
{CHAR} {return char;printf("CHAR\t");}
"CHAR" {return mc_char;printf("mc_char\t");}
{STRING} {return string;printf("string\t");}
"STRING" {return mc_string;printf("mc_string\t");}
"CONST" {return mc_const;printf("mc_const\t");}
{IDF} {return mc_idf;printf("IDF\t");}
{IDFTAB} {return mc_idftab;printf("IDFTAB\t");}
{commentaire} {return mc_com;printf("commentaire\t");}
{TI} {return mc_i;printf("mc_i");}
{TO} {return mc_o;printf("mc_o");}
\n {nblignes++;}
[ \t] 
. {printf("erreur dans la ligne %d a l'entite %s",nblignes,yytext);}
