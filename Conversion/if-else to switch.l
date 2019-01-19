%option noyywrap
%{
char string[100];
char content[100];
int size = 0;
char id,id1;
%}
ws [ \t]+
%s IF
%s COND
%s ELSEIF
%s COPY
%s COPYING
%%
<INITIAL>if {printf("switch(%c):{",yytext[0]);BEGIN IF;}
<INITIAL>elseif {BEGIN ELSEIF;}
<IF>"(" {BEGIN COND; }
<ELSEIF>"(" {BEGIN COND; }
<COND>{ws} {}
<COND>")" {string[size]=0; if(*string) printf(" case %c : ",string[size-1]);size = 0; BEGIN COPY; }
<COND>. {string[size++] = yytext[0]; }
<COPY>"{" {BEGIN COPYING;}
<COPYING>"}" {content[size]=0;size=0;puts(content);printf(" break;");BEGIN INITIAL;}
%%
int main(int argc, char *argv[])
{
yylex();
printf("}");
}
