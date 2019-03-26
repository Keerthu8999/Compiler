cha [a-zA-Z]
rel ">"|"<"|"&&"|"!="|"^"|\|\|
equ [=]
su [+|-|*|/]
digit [0-9]
%{
	#include <stdlib.h>
	void yyerror(char *);
	#include "y.tab.h"
int lc=1;
%}
%%
"if("	{yylval = *yytext;return IF;}
"while("	{yylval = *yytext;return WHILE;}
"else"		{yylval = *yytext;return ELSE;}
"&&"|"^"|"!="|\|\|	{yylval = *yytext;return LOGIC;}

"{"	{yylval = *yytext;return OPEN;}
"}"	{yylval = *yytext;return CLOSE;}
")"	{yylval = *yytext;return CLOSE1;}
[ \n\t]	;
{cha}{rel}{cha}?{digit}* {
			yylval = ++lc;
			printf("\nif %s \n",yytext);
			return REL;
		}
{cha}		{
			yylval = ++lc;
			return TERM;
		}

{cha}{equ}{cha}?{digit}?	{
			printf("%d: %s\n",lc,yytext);
			return ASSIGN;
			}
"print"	{
		yylval = *yytext;

		return STATM;
	} 
%%
int yywrap(void) {
	return 1;
}

