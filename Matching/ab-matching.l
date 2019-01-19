newline [\n]
null [\0]
%{
int count1 = 0;
int count2 = 0;
%}
%%
(abc)++{newline} {ECHO;printf("valid\n");break;}
(abc)++([[:alpha:]])*+{newline} {ECHO;printf("invalid\n");break;}
^(b|c)*+([[:alpha:]])*+{newline} {ECHO;printf("invalid\n");break;}
%%
int main()
{
yylex();
}
