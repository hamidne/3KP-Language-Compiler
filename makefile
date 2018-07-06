all:
	yacc -d yacc.y
	lex lex.l
	gcc -g lex.yy.c y.tab.c -o compiler