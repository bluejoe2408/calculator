# calculator
simple calculator implemented by yacc and lex

./calc to run the calculator.

compile:

bison -vdty calc.y
flex calc.l
gcc -o calc y.tab.c lex.yy.c

parse:
S -> S E \n | ε
E -> E + E | E - E | E * E | E / E | - E | T_NUM | ( E )