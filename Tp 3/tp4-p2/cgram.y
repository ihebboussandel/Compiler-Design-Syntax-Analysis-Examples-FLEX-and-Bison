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
%token <f> NUM NEG
%type <f> E
%start S
%left '+''-'
%left '*''/'
%nonassoc NEG
%%
S:E { printf("resultat:%d\n",$1); }
;
E:E'+' E {$$=$1+$3;}
|E'-' E {$$=$1-$3;}
|E'*' E {$$=$1*$3;}
|E'/' E {$$=$1/$3;}
|'-' E %prec NEG{$$=-$2;}
|NUM{$$=$1;}
;
%%
void yyerror(char *msg){
	fprintf(stderr,"%s\n",msg);
	exit(1);
}
int main(void){
	yyparse();
}

