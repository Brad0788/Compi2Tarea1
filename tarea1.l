
%option noyywrap
%option yylineno
%option caseless
%{
    #define YYSTYPE char*
    #include "tokens.h"
    extern char* yylval;
   
    
%}

IDENTIFICADOR [A-Za-z][A-Za-z0-9]*

%%
"def" { return TK_DEF;}
"declarations" { return TK_DECLARATION;}
"int" { return TK_INT;}
"end" { return TK_END;}
"write" { return TK_WRITE;}
[0-9]+ { yylval = strdup(yytext); return TK_NUMBER;}
{IDENTIFICADOR} { yylval = yytext; return TK_IDENTIFICADOR;}

";" { return TK_PUNTOCOMA;}
":" { return TK_DOSPUNTOS;}
"+" { return TK_MAS;}
"-" { return TK_MENOS;}
"*" { return TK_MULTI;}
"/" { return TK_DIVI;}
"(" {return TK_ABREP;}
")" {return TK_CIERRAP;}

[ \t\n] {/*ignore*/ }
. {printf("Invalid character %c\n",*yytext);}


%%