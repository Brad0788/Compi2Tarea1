%{
    //#define YYSTYPE char*
    #include <cstdio>
    #include <iostream>
    #include <map>
    #include <string_view>
    #include <string>
    #include <cstring>
    using namespace std;
    map<string, int> mapa;
    int yylex();
    int variable = 0;
    extern int yylineno;
    void yyerror(const char * err){
        fprintf(stderr, "Line: %d, error: %s\n",yylineno,err);
    }
    void print_map()
    {
        for(auto it=mapa.begin(); it!=mapa.end(); ++it){
            variable++;
           printf("%s => %d\n",it->first.c_str(),it->second);
        }
    }

%}

%union{
    int int_t;
    char * string_t;
}

%token TK_DEF TK_DECLARATION TK_INT TK_END TK_WRITE 
%token  TK_PUNTOCOMA TK_DOSPUNTOS TK_MAS TK_MENOS TK_MULTI 
%token TK_DIVI TK_ABREP TK_CIERRAP TK_IGUAL
%token<int_t> TK_NUMBER 
%token<string_t> TK_IDENTIFICADOR
%type<int_t> term factor expression write_stmt assignment_stmt


%%
input: declarations_block statement_list
    ;

declarations_block: 
    | TK_DEF TK_DECLARATION declarations_list TK_END
    ;

declarations_list: 
    | declarations_list declarations
    ;

declarations: TK_IDENTIFICADOR TK_DOSPUNTOS TK_INT TK_PUNTOCOMA { mapa.insert(make_pair($1,0)); }//print_map();}
    ;

statement_list: 
    | statement_list statement
    ;

statement: write_stmt
    | assignment_stmt
    ;

write_stmt: TK_WRITE TK_ABREP expression TK_CIERRAP TK_PUNTOCOMA { printf("%d\n",$3); }
    ;

assignment_stmt: TK_IDENTIFICADOR TK_IGUAL expression TK_PUNTOCOMA {if(mapa.count($1)){ mapa.find($1)->second = $3;} else { printf("Error: variable %s no existe.\n",$1); return 0;} }
    ;
expression: expression TK_MAS factor { $$ = $1 + $3; }
    | expression TK_MENOS factor { $$ = $1 - $3; }
    | factor { $$ = $1; }
    ;
factor: factor TK_MULTI term { $$ = $1 * $3; }
    | factor TK_DIVI term { $$ = $1 / $3; }
    | term { $$ = $1; }
    ;
term: TK_NUMBER { $$ = $1; }
    | TK_IDENTIFICADOR { if(mapa.count($1)){ $$ = mapa.find($1)->second;} else { printf("Error: variable %s no existe.\n",$1); return 0;} }
    ;

%%
