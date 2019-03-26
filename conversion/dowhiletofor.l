%option noyywrap
%{
char string[100];
char string1[100];
char content[100];
char string2[100];
int size=0,size1=0,size2=0,con=0;
%}
%s DO
%s COPY
%s INCDEC
%s CLOSE
%s WHILE
%s COND
%s HELLO
%%
<INITIAL>; {}
<INITIAL>. {string[size++] = yytext[0];}
<INITIAL>do {BEGIN DO;}
<DO>"{" {BEGIN COPY;}
<COPY>; {BEGIN INCDEC;}
<COPY>. {content[con++]=yytext[0];}
<INCDEC>; {BEGIN CLOSE;}
<INCDEC>. {string2[size2++] = yytext[0];}
<CLOSE>"}" {BEGIN HELLO;}
<HELLO>while {BEGIN WHILE;}
<WHILE>"(" {BEGIN COND;}
<COND>")" {
string[size]=0;string1[size1]=0;string2[size2]=0;content[con]=0;
printf("for(%s;%s;%s){%s;}",string,string1,string2,content);size=0;size1=0;size2=0;con=0;
BEGIN INITIAL;}
<COND>. {string1[size1++] = yytext[0];}
%%
int main(int argc, char *argv[])
{
	return yylex();
}
