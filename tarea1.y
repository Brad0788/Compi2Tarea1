%{
    #define YYSTYPE char*
    #include <cstdio>
    using namespace std;
    int yylex();
    extern int yylineno;
    void yyerror(const char * err){
        fprintf(stderr, "Line: %d, error: %s",yylineno,err);
    } 

%}

%token TK_DEF TK_DECLARATION TK_INT TK_END TK_WRITE TK_NUMBER
%token TK_IDENTIFICADOR TK_PUNTOCOMA TK_DOSPUNTOS TK_MAS TK_MENOS TK_MULTI 
%token TK_DIVI TK_ABREP TK_CIERRAP


%%


%%
