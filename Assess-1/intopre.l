%{

int i=0,size=0,s=0,pri,pri1;
char a[100],b[100];
int pre(char t)
{
if(t=='/')
return 3;
if(t=='*')
return 2;
if(t=='+')
return 1;
else
return 0;
}
void pop(char t)
{
a[size]=b[s-1];
s--;
size++;
while(pre(t)<pre(b[s-1]))
{
pop(t);
}

}

%}
%%
.*    { for(i=0;i<yyleng;i++)
{
        if(yytext[i]>=97&&yytext[i]<=122)
                {
                        a[size]=yytext[i];
                        size++;
                }
        else
                {
                        if(s==0)
                                { 
                                        b[s]=yytext[i];
                                        s++;
                                        continue; 
                                }
                        if(s>0)
                               {
                                                                     pri=pre(b[s-1]);
                                        pri1=pre(yytext[i]);
                                                if(pri<pri1)
                                                        {
                                                                b[s]=yytext[i];
                                                                s++;
                                                        }
                                                else
                                                        {
                                                                pop(yytext[i]);
                                                                b[s]=yytext[i];
                                                                s++;
                                                        }
                                }
                 }
}
for(i=s-1;i>=0;i--)
{
a[size]=b[i];
size++;
}
for(i=size;i>=0;i--)
{
printf("%c",a[i]);
}
}

%%
int main()
{
yylex();
}


