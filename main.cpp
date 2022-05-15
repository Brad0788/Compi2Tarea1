#include <stdio.h>

using namespace std;

extern FILE *yyin;

extern int yylineno;


int yylex();
char* yylval;
int yyparse();

int main(int argc, char * argv[]){

    if(argc < 2){
        fprintf(stderr, "Missing input file %s \n",argv[0]);
        return 1;
    }

    FILE * f = fopen(argv[1],"r");

    if(f==NULL){
        fprintf(stderr, "Couldn't open file %s \n",argv[0]);
        return 1;
    }

    yyin = f;
    int token;
   /* while(token = yylex()){
        printf("\tLine: %d, Token Type %d \n",yylineno,token);
     
            //printf(" =%s\n",yylval);
       
    }*/
     yyparse();

    return 0;
}