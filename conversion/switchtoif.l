%option noyywrap
num [0-9]+
%{
char string[100];
char string1[100];
char content[100];
char string2[100];
char boo;
char id;
int size=0,size1=0,size2=0,con=0;
%}
%s SWITCH ASSIGN CONTENT HELLO CASE CONTENTS CHECK BREAK DEFAULT 

%%
<INITIAL>switch {BEGIN SWITCH;}
<SWITCH>"(" {BEGIN ASSIGN;}
<ASSIGN>")" {BEGIN CONTENT;}
<ASSIGN>. {boo = yytext[0];}
<CONTENT>"{" {BEGIN HELLO;}
<HELLO>case {BEGIN CASE;}
<HELLO>default {BEGIN DEFAULT;}
<CASE>{num} {id = yytext[0];printf("if(%c == %c)",boo,id);BEGIN CONTENTS;}
<CONTENTS>; {content[con]=0;puts(content);con = 0;BEGIN CHECK;}
<CONTENTS>. {content[con++] = yytext[0];}
<CHECK>break {BEGIN BREAK;}
<BREAK>; {BEGIN HELLO;}
<DEFAULT>: {printf("else");BEGIN CONTENTS;}
<DEFAULT>"}" {BEGIN INITIAL;}
%%
int main(int argc, char *argv[])
{
	return yylex();
}


