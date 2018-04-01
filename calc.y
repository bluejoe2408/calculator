%{
#include <stdio.h>
void yyerror(const char* msg) {}
%}
%union
{
    double dval;
}
%token <dval> T_NUM

%left '+' '-'
%left '*' '/'
%type <dval>  S
%type <dval>  E
%%

S   :   S E '\n'        { printf("ans = %g\n", $2); }
    |   /* empty */     { /* empty */ }
    ;

E   :   E '+' E         { $$ = $1 + $3; }
    |   E '-' E         { $$ = $1 - $3; }
    |   E '*' E         { $$ = $1 * $3; }
    |   E '/' E         { $$ = $1 / $3; }
    |   '-' E           { $$ = 0.0 - $2; }
    |   T_NUM           { $$ = $1; }
    |   '(' E ')'       { $$ = $2; }
    ;

%%

int main() {
    return yyparse();
}