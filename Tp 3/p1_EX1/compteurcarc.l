%{
#include <stdlib.h>
#include <stdio.h>
int chars = 0;
int Vcomp = 0;
int Ccomp = 0;
int Pcomp = 0;
%}

%%
[aeyuioAEYUIO] { Vcomp++; chars += strlen(yytext); }
[zrtpqsdfghjklmnwxcvbnZRTPQSDFGHJKLMNWXCVB]        { Ccomp++; }
[:?!.,] { Pcomp++; }
; { Pcomp++; }
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

  printf("Vcomp %8d \nCcomp %8d \nPcomp %8d \nChars %8d \n ", Vcomp, Ccomp, Pcomp, chars);
}

    int yywrap() { return 1; }