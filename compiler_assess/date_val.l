%{
char dates[100];
char months[100];
char years[100];
char d=0,y=0,m=0;
%}
semi ";"
hyphen "-"
%s DATE
%s MONTH 
%s YEAR
%%
<INITIAL>{hyphen} {BEGIN MONTH;}
<INITIAL>([0-1][0-9]|[2][0-9]|[3][0-1]) {dates[d++] = yytext[0];printf("%c",dates[d-1]);}
<MONTH>{hyphen} {BEGIN YEAR;}
<MONTH>([1-9]|[1][0-2]) {months[m++] = yytext[0];printf("%c",months[m-1]);}
<YEAR>{semi} {
dates[d] = 0;
months[m] = 0;
years[y] = 0; 
printf("%s-%s-%s",months,dates,years);
d = 0,y = 0,m = 0;
BEGIN INITIAL;
}
<YEAR>([1-2][0-9][0-9][0-9]) {years[y++] = yytext[0];printf("%c",years[y-1]);}
%%
int main(){yylex();return 0;}
