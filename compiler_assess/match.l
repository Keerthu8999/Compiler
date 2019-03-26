%{
%}
alpha [^abc]
%%
(.)*({alpha})(.)* printf("Valid");
%%
int main()
{
yylex();
return 0;
}
