
# 3KP Language compiler


### run this commad :
```
yacc -d yacc.y
lex lex.l
gcc -g lex.yy.c y.tab.c -o compiler
```