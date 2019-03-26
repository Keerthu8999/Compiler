%{
int count=0;
%}

%%
.*"com"\n {count++;ECHO;}
. ;

%%
int main(){yylex();}
