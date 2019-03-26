%option noyywrap
%{
#include<stdio.h>
char string[100];
char string1[100];
int size = 0;
int size1 = 0;
char content[100];
%}
%s CHECK
%s WHILE
%s ASSIGN
%s COND
%s INCDEC
%s COPY
%s TATA
%s COPYING
ws [ \t]+
%%
<INITIAL>{ws} {}
<INITIAL>; {BEGIN CHECK;}
<INITIAL>while {BEGIN WHILE;}
<INITIAL>. {string[size++]=yytext[0];}
<CHECK>while {BEGIN WHILE;}
<WHILE>"(" {BEGIN COND;}
<COND>")" {string[size]=0;string1[size1]=0;printf("for(%s;%s;",string,string1);size=0;size1=0;BEGIN COPY;}
<COND>. {string1[size1++]=yytext[0];}
<COPY>"{" {BEGIN COPYING;}
<COPYING>; {BEGIN INCDEC;}
<COPYING>. {content[size++]=yytext[0];}
<INCDEC>; {BEGIN TATA;}
<INCDEC>. {string1[size1++] = yytext[0];}
<TATA>"}" {content[size]=0;string1[size1]=0;printf("%s){%s;}",string1,content);size=0;size1=0;BEGIN INITIAL;}
%%

int main(int argc, char *argv[])
{
	return yylex();
}

