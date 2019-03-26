%{
#include<stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}
%token INT VAR
%left '+''-''*''/'
%%
prog : prog stmt '\n'
     |
     ;
stmt : expr {printf("%d\n",$1);}
     | VAR '=' expr {sym[$1] =  $3;}
     ;
expr : expr '+' expr {$$ = $1 + $3;}
     | expr '-' expr {$$ = $1 - $3;}
     | expr '*' expr {$$ = $1 * $3;}
     | expr '/' expr {$$ = $1 / $3;}
     | '(' expr ')' {$$ = $2;}
     | INT
     | VAR {$$ = sym[$1];}
     ;
%%
void yyerror(char *s)
{
fprintf(stderr,"%s\n",s);
return 0;
}
int main()
{
yyparse();
return 0;
}
