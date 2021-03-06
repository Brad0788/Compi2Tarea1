
%option noyywrap
%option yylineno
%option caseless
%{
    //#define YYSTYPE char*
    #include "tokens.h"

    //extern char* yylval;
    
    
%}

IDENTIFICADOR [A-Za-z][A-Za-z0-9]*

%%
[ \t\n\r] {/*ignore*/ }
"def" { return TK_DEF;}
"declarations" { return TK_DECLARATION;}
"int" { return TK_INT;}
"end" { return TK_END;}
"write" { return TK_WRITE;}
[0-9]+ { yylval.int_t = atoi(yytext); return TK_NUMBER;}
{IDENTIFICADOR} { yylval.string_t = strdup(yytext); return TK_IDENTIFICADOR;}

";" { return TK_PUNTOCOMA;}
":" { return TK_DOSPUNTOS;}
"+" { return TK_MAS;}
"-" { return TK_MENOS;}
"*" { return TK_MULTI;}
"/" { return TK_DIVI;}
"(" {return TK_ABREP;}
")" {return TK_CIERRAP;}
"=" {return TK_IGUAL;}



. {printf("Invalid character %c\n",*yytext);}


%%