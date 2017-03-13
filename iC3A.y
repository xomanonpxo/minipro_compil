%{
#include <stdio.h>
#include <tree.h>
#define YYSTYPE int
int yyparse();
int yylex();
int yyerror(char *s);
%}

%union{
	int i;
}

%token <i> N
%token <id> Id
%token Pl
%token Mo
%token Mu
%token Af
%token Afc
%token Sk
%token Jp
%token Jz
%token St
%type <i> Etiquette Destination
%type <Id> || <N> Argument
%type <a_tree> Operateur

%%

Etiquette:	Id	{ $$ = $1; }
		;

Operateur:	Pl	{ $$ = make_operator(NULL, '+', NULL); }
		| Mo	{ $$ = make_operator(NULL, '-', NULL); }
		| Mu	{ $$ = make_operator(NULL, '*', NULL); }
		| Af	{ $$ = :=; }
		| Afc	{ $$ = :=; }
		| Sk	{ $$ = ; }
		| Jp	{ $$ = goto; }
		| Jz	{ $$ = goto; }
		| St	{ $$ = EXIT_FAILURE; }
		;

Argument:	N	{ $$ = $1 }
		| Id	{ $$ = $1; }
		;

Destination:	Id	{ $$ = $1; }
		;

%%

int yyerror(char *s) {
	printf("yyerror : %s\n",s);
	return 0;
}

int main(void) {
	yyparse();
	return 0;
}
