%{
#include <stdio.h>
#define YYSTYPE int
int yyparse();
int yylex();
int yyerror(char *s);
%}

%token <i> I
%token <id> V
%token Af
%token Sk
%token Se
%token If
%token Th
%token El
%token Wh
%token Do
%token Pl
%token Mo
%token Mu

%%


%%
