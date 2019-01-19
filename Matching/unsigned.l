digits [0-9]
letters [A-Za-z]
punct [.,;:'"?/]
minus [-]
zero [0]
decimal [.]
expo [E]
%%
^({digits})* {ECHO; printf("unsigned");}
^({digits})*+{expo}+({digits})* {ECHO;printf("unsigned");}
^({digits})*+{decimal}+({digits})*+{expo}+({digits})* {ECHO;printf("unsigned");}
^({digits})*+{decimal}+({digits})*+{expo}+({digits})*+{minus}+({digits})* {ECHO;printf("unsigned");}
^({digits})*+{decimal}+({digits})* {ECHO;printf("unsigned");}
%%
