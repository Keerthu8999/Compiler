%token REL OPEN CLOSE WHILE IF ELSE CLOSE1 STATM  LOGIC ASSIGN TERM
%{
#include <stdlib.h>
#include <stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}

%%
expr:	IF bool CLOSE1 OPEN expr CLOSE {printf("Valid\n");}
    	|IF bool CLOSE1 OPEN expr CLOSE ELSE OPEN expr CLOSE {printf("Valid\n");}
	|WHILE bool CLOSE1 OPEN expr CLOSE {printf("Valid\n");}
	|STATM
	|ASSIGN
	;
bool:	TERM	{printf("  Goto:%d \n",$1);}
    	|REL	{printf("  Goto:%d \n",$1);}
	|bool LOGIC REL { $$=$1 < $3;	printf("  Goto:%d \n",$3);}
	|bool LOGIC TERM {$$=$1 < $3;printf("  Goto:%d \n",$3);}
	;
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}


