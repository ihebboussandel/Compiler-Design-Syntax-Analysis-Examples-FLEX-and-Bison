%{
#include <stdlib.h>
#include <stdio.h>
int sum=0;
%}
intss  [0-9]+

%%
{intss} { sum+=atoi(yytext);}
.* {;}
%%
int main(int argc, char**argv){           
if (argc > 1){
    FILE *file;
    file = fopen(argv[1], "r");
    if (!file){
        fprintf(stderr, "Could not open %s\n", argv[1]);
        exit(1);
    }
    yyin = file;
}
yylex();

  printf("sum %8d ",sum);
}

    int yywrap() { return 1; }