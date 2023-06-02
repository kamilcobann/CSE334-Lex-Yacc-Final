slan: lex.yy.c y.tab.c
	gcc -g lex.yy.c y.tab.c -o slanscan

lex.yy.c: y.tab.c slan.l
	lex slan.l

y.tab.c: slan.y
	yacc -d slan.y

clean: 
	rm -rf lex.yy.c y.tab.c y.tab.h slanscan slan.dSYM