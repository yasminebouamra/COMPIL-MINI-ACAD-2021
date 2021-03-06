
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     mc_import = 258,
     lib_process = 259,
     lib_loop = 260,
     lib_array = 261,
     mc_start = 262,
     mc_decvar = 263,
     mc_execut = 264,
     mc_if = 265,
     mc_else = 266,
     mc_endif = 267,
     mc_while = 268,
     fonc_entree = 269,
     fonc_sortie = 270,
     mc_po = 271,
     mc_pf = 272,
     mc_ao = 273,
     mc_af = 274,
     mc_adresse = 275,
     mc_sup = 276,
     mc_supe = 277,
     mc_inf = 278,
     mc_infe = 279,
     mc_diff = 280,
     mc_eg = 281,
     mc_aff = 282,
     mc_sept = 283,
     mc_add = 284,
     mc_mul = 285,
     mc_div = 286,
     endinst = 287,
     mc_int = 288,
     mc_float = 289,
     mc_char = 290,
     mc_string = 291,
     mc_const = 292,
     mc_o = 293,
     mc_i = 294,
     mc_com = 295,
     mc_idf = 296,
     mc_idftab = 297,
     mc_pgm = 298,
     mc_dp = 299,
     mc_ds = 300,
     int = 301,
     float = 302,
     string = 303,
     char = 304
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


