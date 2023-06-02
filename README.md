# CSE334-Lex-Yacc-Final
# CSE334-Lex-Yacc
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

\<mod\> ::= \<expression\> '%' \<expression\>

\<assign\> ::= \<identifier\> '=' \<expression\> ';'

\<plus\_equal\>::= \<identifier\> '+=' \<expression\>

\<minus\_equal\>::= \<identifier\> '-=' \<expression\>

\<divide\_equal\>::= \<identifier\> '/=' \<expression\>

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

\<inc\> ::= \<expression\> '++' \<expression\>

\<dec\> ::= \<expression\> '--' \<expression\>

\<xor\> ::= \<expression\> ' ' ' \<expression\>

\<string\> ::= '"' \<character\>\* '"' | \<identifier\>

\<or\> ::= \<expression\> ' |' \<expression\>

\<and\> ::= \<expression\> ' & ' \<expression\>

\<pi\> ::= 'pi'

\<infinity\> ::='infinity'

\<call\_function\> ::= \<identifier\> "(" \<argument\_list\> ")"

\<argument\_list\> ::= \<expression\> | \<argument\_list\> "," \<expression\>

\<var\> ::= \<type\> \<identifier\> ";"

\<identifier\> ::= \<letter\> | "\_" | \<identifier\> \<letter\_or\_digit\> | \<identifier\> "\_"

\<let\> ::= "let" \<identifier\> "=" \<expression\> ";"

\<identifier\> ::= \<letter\> | "\_" | \<identifier\> \<letter\_or\_digit\> | \<identifier\> "\_"

\<const\> ::= "const" \<type\> \<identifier\> "=" \<expression\> ";"

\<identifier\> ::= \<letter\> | "\_" | \<identifier\> \<letter\_or\_digit\> | \<identifier\> "\_"

\<letter\_or\_digit\> ::= \<letter\> | \<digit\>



slan is designed for a beginner software developers. 
