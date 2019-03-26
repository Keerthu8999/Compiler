%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char *);
int yylex(void);
int reg[3];
void opaloc(char,char,char);
void aloc(char);
%}
%token VARIABLE NUMBER
%%
prog : prog stmt '\n' 
     |
     ;
stmt : expr {printf("");}
     ;
expr : VARIABLE {aloc($1);}
     | expr '+' expr {opaloc($1,'+',$3);}
     | expr '-' expr {opaloc($1,'-',$3);}
     | expr '*' expr {opaloc($1,'*',$3);}
     | expr '/' expr {opaloc($1,'/',$3);}
     | '(' expr ')' {$$=$2;}
     ;
%%
void opaloc(char a , char b , char c){
int i=0,j;
for(i=0;i<3;i++){
if(reg[i] == a|| reg[i] == c){
for(j=i+1;j<3;j++){
if(reg[j] == a|| reg[j] == c){
printf("%c R%d,R%d,R%d",b,i,i,j);
reg[j] = 'z';
break;
}}}}}
void aloc(char v){
int i;
for(i=0;i<3;i++){
if(reg[i] == 'z'){
printf("LD R%d , %c",i,v);
reg[i] = v;
break;
}}}
void yyerror(char *a){
printf("vsgsfhb");}
int main()
{
int i;
for(int i=0;i<3;i++){reg[i]='z';}
yyparse();return 0;
}
