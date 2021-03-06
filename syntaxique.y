%{
extern unsigned int nblignes;
%}
%token mc_import lib_process lib_loop lib_array mc_start mc_decvar mc_execut mc_if mc_else mc_endif mc_while fonc_entree fonc_sortie mc_po mc_pf mc_ao mc_af mc_adresse mc_sup mc_supe mc_inf mc_infe mc_diff mc_eg mc_aff mc_sept mc_add mc_mul mc_div endinst mc_int mc_float mc_char mc_string mc_const mc_o mc_i mc_com mc_idf mc_idftab mc_pgm mc_dp mc_ds integer floa str chara
%start S
%%
S: LISTE_BIB PROGRAMME { printf("Programme Syntaxiquement correct");
YYACCEPT; }
;
LISTE_BIB: BIB LISTE_BIB
|
;
BIB: mc_import LIB;
LIB: lib_process 
	| lib_loop 
	| lib_array 
	;
PROGRAMME: mc_pgm mc_idf mc_ao CORPS mc_af;
CORPS: LISTE_DEC INSTRUCTIONS 
|
;
LISTE_DEC: DEC LISTE_DEC
|
; 
DEC: DEC_VAR 
	| DEC_CONST
	; 
DEC_VAR: mc_decvar VAR;
DEC_CONST: mc_const CONSTANTE;
CONSTANTE: TYPE mc_dp LISTEIDF mc_aff NBCONST mc_ds CONSTANTE
	|TYPE mc_dp LISTEIDF mc_aff NBCONST endinst;
NBCONST: integer
	| floa
	;
VAR: TYPE mc_dp LISTEIDF mc_ds VAR
	| TYPE mc_dp LISTEIDF endinst
	;
TYPE: mc_int 
	| mc_float 
	| mc_char 
	| mc_string
	;
LISTEIDF: mc_idf 
	| mc_idftab
INSTRUCTIONS: AFFECTATION 
	| BOUCLE 
	| IO 
	| CONDITIONS 
	;
AFFECTATION: LISTEIDF mc_aff EXPRESSION; 
EXPRESSION: LISTEIDF EXARI EXPRESSION 
	| LISTEIDF
	; 
EXARI: mc_add 
	| mc_mul 
	| mc_diff 
	| mc_div
	;
BOUCLE: mc_while mc_po CONDITION mc_pf mc_ao INSTRUCTIONS mc_af;
CONDITION: LISTEIDF EXLOG LISTEIDF; 
EXLOG: mc_sup 
	| mc_supe 
	| mc_inf 
	| mc_infe 
	| mc_diff 
	| mc_eg 
	;
IO: ECRITURE 
	| LECTURE 
	;
ECRITURE: fonc_sortie mc_o; 
LECTURE: fonc_entree mc_i;
CONDITIONS: mc_execut INSTRUCTIONS CONDIF mc_endif 
	| mc_execut INSTRUCTIONS CONDIF mc_else mc_execut INSTRUCTIONS mc_endif
	;
CONDIF: mc_if mc_po CONDITION mc_pf;
%%
main()
{
	yyparse();
}
yywrap() 
{
	
}

int yyerror(char * msg) 
{
printf("erreur syntaxique a la ligne %d.\n",nblignes);
}