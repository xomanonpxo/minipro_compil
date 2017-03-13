%{
#include <stdio.h>
#include "tree.h"
int yyparse();
int yylex();
int yyerror(char *s);
%}


%union {
  int a_number;
  char a_variable;
  struct tree* a_tree;
}
%start C
%token <a_number> I
%token <a_variable> V
%type <a_tree> E T F C
%token Af Sk Se If Th El Wh Do Pl Mo Mu

%%

C : V Af E            { $$ = $3; }
  | Sk                { return 1; }
  | '(' C ')'         { $$ = $2; }
  | If E Th C El C    { if ($2 != 0) { $$ = $4; } else { $$ = $6; } }
  | Wh E Do C         { while ($2 != 0) { $$ = $4; }}
  ;

E : Pl T              { $$ = $2; }
  | Mo T              { $$ = make_operator(NULL, '-', $2); }
  | T                 { $$ = $1; }
  | E Pl T            { $$ = make_operator($1, '+', $3); }
  | E Mo T            { $$ = make_operator($1, '-', $3); }
  ;

T : F                 { $$ = $1; }
  | T Mu F            { $$ = make_operator($1, '*', $3); }
  ;

F : I                 { $$ = make_number($1); }
  | V                 { $$ = make_variable($1); }
  | '(' E ')'         { $$ = $2; }
  ;

%%

int yyerror(char *s){
	fprintf(stderr, "*** ERROR: %s\n", s);
	return 0;
}
int yywrap(){
	return -1;
}
int main(int argn, char **argv){
	yyparse();
	return 0;
}
