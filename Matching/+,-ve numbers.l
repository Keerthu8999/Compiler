digits [0-9]
plus [+]
minus [-]
letters [A-Za-z]
punct [.,:;?/#@]
%{
%}
%%
^({punct}|{letters})+({digits}|{letters}|{punct})* {ECHO;printf("Invalid");break;}
^({plus}|{minus})+({digits})* {ECHO;printf("Valid");break;}
^({plus}|{minus})+({letters}|{punct})* {ECHO;printf("Invalid");break;}
^({letters})+({plus}|{minus})+({digits})* {ECHO;printf("Valid");break;}
%%
int main()
{
yylex();
}
