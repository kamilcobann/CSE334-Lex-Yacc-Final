# CSE334-Lex-Yacc-Final
# SLAN LANGUAGE
This project is created by : Kamil Çoban and Esra Tontu





\<digit\> ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

\<letter\> ::= 'a' | 'b' | ... | 'z' | 'A' | 'B' | ... | 'Z'

\<symbol\> ::= '+' | '-' | '\*' | '/' | '=' | '\<' | '\>' | '&' | '|' | '!' | '%' | '^' | '~' | ',' | '.' | ':' | ';' | '(' | ')' | '[' | ']' | '{' | '}' | '"' | ''' | '?' | '#' | '@' | '$' | '`'

\<whitespace\> ::= ' ' | '\t' | '\n' | '\r'

\<operator\> ::= "+" | "-" | "\*" | "/" | …

\<number\> ::= \<digit\> | \<number\> \<digit\>

\<type\> ::= "int" | "float" | "double" | "char" | ...

\<character\> ::= \<letter\> | \<digit\> | \<symbol\> | \<whitespace\>

\<integer\> ::= \<digit\> \<digit\> \<digit\>

\<float\> ::= \<digit\>+ '.' \<digit\>

\<double\>::= \<digit\>+ '.' \<digit\>

\<open\_paren\>::= '(' \<expression\>

\<close\_paran\>::=\<expression\> ')'

\<open\_bracket\_\>::= '[' \<expression\>

\<close\_bracket\_\>::= \<expression\>']'

\<open\_brace\> ::= '{' \<expression\>

\<close\_brace\>::= \<expression\>'}'

\<plus\> ::= \<expression\> '+' \<expression\>

\<multiply\> ::= \<expression\> '\*' \<expression\>

\<minus\> ::= \<expression\> '-' \<expression\>

\<divide\> ::= \<expression\> '/' \<expression\>

\<question\_equal\>::= \<identifier\> '?=' \<expression\>

\<not\_equal\>::= \<identifier\> '!=' \<expression\>

\<greater\_equal\>::= \<identifier\> '\>=' \<expression\>

\<less\_equal\>::= \<identifier\> '\<=' \<expression\>

\<greater\_than\>::= \<identifier\> '\>' \<expression\>

\<less\_than\>::= \<identifier\> '\<' \<expression\>

\<true\> ::= "true"

\<false\> ::= "false"

IF : if

ELSE : else

FUNC : func

BREAK : break

\<print\>::='print' \<var\>

\<string\> ::= '"' \<character\>\* '"' | \<identifier\>

\<or\> ::= \<expression\> ' |' \<expression\>

\<and\> ::= \<expression\> ' & ' \<expression\>

\<pi\> ::= 'pi'

\<infinity\> ::='infinity'

\<call\_function\> ::= \<identifier\> "(" \<argument\_list\> ")"

\<argument\_list\> ::= \<expression\> | \<argument\_list\> "," \<expression\>

\<var\> ::= \<type\> \<identifier\> ";"



slan is designed for a beginner software developers. 


Makefile

Manuel: 
lex slan.l
Yacc -d slan.y
gcc -g lex.yy.c y.tab.c -o slanscan

Otomatic
Make plan

Clean 
Make clean
