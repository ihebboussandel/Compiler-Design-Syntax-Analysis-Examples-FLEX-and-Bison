%{
int chars = 0;
int words = 0;
int lines = 1;
%}

%%
[a-zA-Z]+ { words++; chars += strlen(yytext); }// chars+= yyleng;
\n        { chars++; lines++; }
.         { chars++; }
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

  printf("\n lines %8d \n mot : %8d \n chars %8d \n ", lines, words, chars);

  return 0;
}
 int yywrap() { return 1; }