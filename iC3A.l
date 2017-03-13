%{
#include "iC3A.h"
%}

%%

([\+\-])?[0-9]+          { yylval.i = atoi(yytext); return N; }
[A-Za-z][A-Za-z0-9]*     { yylval.id = yytext; return Id; }
\+              { return Pl; }
\-              { return Mo; }
\*              { return Mu; }
:=              { return Af; }
:=              { return Afc; }
Skip            { return Sk; }
goto            { return Jp; }
goto            { return Jz; }
EXIT_FAILURE    { return St; }
[ \t\n]         { return; }
.               { return yytext[0]; }

%%
