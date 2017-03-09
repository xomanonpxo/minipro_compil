%{
#include "myCompImp.h"
%}

%%

[0-9]+          { yylval.i = atoi(yytext); return I; }
[A-Za-z0-9]+    { yylval.id = yytext; return V; }
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
[\t\n]          { return; }
.               { return yytext[0]; }

%%
