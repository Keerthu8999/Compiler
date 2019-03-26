%option noyywrap
%{
#include<stdio.h>
#include<stdlib.h>
char string[100];
char string1[100];
char string2[100];
int size=0,size1=0,con=0,size2=0;
char content[100];
%}
ws [ \t]+
%s FOR ASSIGN COND INCDEC COPY COPYING
%%
<INITIAL>for    { BEGIN FOR; }
<FOR>"("        { BEGIN ASSIGN; }
<ASSIGN>{ws}    {}
<ASSIGN>;       { string[size]=0; if(*string) printf("%s;\n", string); size=0; puts("do{ \n "); BEGIN COND; }
<ASSIGN>.       { string[size++] = yytext[0]; }
<COND>{ws}      {}
<COND>;         { string1[size]=0; size=0; BEGIN INCDEC; }
<COND>.         { string1[size++] = yytext[0]; }
<INCDEC>{ws}    {}
<INCDEC>")"     { string[size]=0; printf("%s ;\n }while(%s);",string1,string); BEGIN INITIAL; }
<INCDEC>. { string[size++] = yytext[0]; }
%%
int main(){
yylex();}
