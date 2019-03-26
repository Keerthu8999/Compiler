%token REL OPEN CLOSE WHILE IF ELSE CLOSE1 STATM  LOGIC ASSIGN TERM
%{
#include <stdlib.h>
#include <stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}

%%
expr : IF bool CLOSE1 OPEN expr CLOSE 
