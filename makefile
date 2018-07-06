all:
	yacc -d yacc.y
	lex lex.l
	gcc -g lex.yy.c y.tab.c -o compiler

compelete:
	yacc -d yacc.y
	lex lex.l
	gcc -g lex.yy.c y.tab.c -o compiler
	./compiler < in.txt  > out.txt