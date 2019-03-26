%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char *);
int yylex(void);
char p = 'A'-1;
int array[100];
int i = 0;
%}
%token VARIABLE NUMBER
%%
prog : prog stmt '\n'
     |
     ;
stmt : expr {printf("");}
     ;
expr : NUMBER {}
     | VARIABLE {}
     | expr '+' expr {p++;printf("%c = %c+%c",p,$1,$3);$$=p;printf("%d %d %d\n",array[p]++,array[$1]++,array[$3]++);}
     | expr '-' expr {p++;printf("%c = %c-%c",p,$1,$3);$$=p;printf("%d %d %d\n",array[p]++,array[$1]++,array[$3]++);}
     | expr '*' expr {p++;printf("%c = %c*%c",p,$1,$3);$$=p;printf("%d %d %d\n",array[p]++,array[$1]++,array[$3]++);}
     | expr '/' expr {p++;printf("%c = %c/%c",p,$1,$3);$$=p;printf("%d %d %d\n",array[p]++,array[$1]++,array[$3]++);}
     | '(' expr ')' {$$=$2;}
     ;
%%
void yyerror(char *a)
{printf("EFhfbjfvjdfhg");}
int main()
{
yyparse();
return 0;
}
