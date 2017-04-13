%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <math.h>
extern int yylex();
void yyerror(char *msg);
%}
%union 
{ 
int f;
}
%token <f> NB
%type <f> E T F
%start S

%%
S:E { printf("resultat:%d\n",$1); }
;
E:NB'+'T{$$=$1+$3;}
|NB'-'T{$$=$1-$3;}
|T{$$=$1;}
;
T:NB'*'F{$$=$1*$3;}
|F{$$=$1;}
;
F:'('E')' {$$=$2;}
|'-'F{$$=$2;}
|NB{$$=$1;}
;
%%
void yyerror(char *msg){
	fprintf(stderr,"%s\n",msg);
	exit(1);
}
int main(void){
	yyparse();
}

