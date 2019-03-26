%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
%%
	/* variable*/

	/* integers */

[a-z]	{
		yylval = *yytext;
		return INTEGER;
	}

	/* operators */

[-+()=/*\n]	{ return *yytext; }

	/* skip whitespace */

[ \t]	;

	/* anything else is an error */

.	yyerror("invalid character");
%%
int yywrap(void) {
return 1;
}

