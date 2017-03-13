%{
#include "y.tab.h"
#include "tree.h"
%}

%%

[0-9]+          { yylval.a_number = atoi(yytext); return I; }
:=              { return Af; }
Skip            { return Sk; }
;               { return Se; }
if              { return If; }
then            { return Th; }
else            { return El; }
while           { return Wh; }
do              { return Do; }
\+              { return Pl; }
\-              { return Mo; }
\*              { return Mu; }
[A-Za-z0-9]+    { yylval.a_variable = *yytext; return V; }
[\t\n]          { return 0; }
.               { return yytext[0]; }

%%
