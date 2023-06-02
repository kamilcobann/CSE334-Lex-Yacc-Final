%{
#include "y.tab.h"
void yyerror (char *s);
int yylex();
int yylineno;
%}


%%
"PRINT"           {return PRINT; }
"EXIT"         {return EXIT;}
"TRUE"         {return TRUE;}
"FALSE"        {return FALSE;}
"LOOP"         {return LOOP;}
"NOT"         {return NOT;}
"IF"          {return IF;}
"ELSE"       {return ELSE;}
"=="            {return QUESTION_EQUAL;}
"!="            {return NOT_EQUAL;}
"<"             {return LESS_THAN;}
"<="            {return LESS_EQUAL;}
">"             {return GREATER_THAN;}
">="            {return GREATER_EQUAL;}
"AND"            {return AND;}
"OR"          {return OR;}
"FUNCTION"           {return FUNCTION;}


COMMENT(.*)COMMENT                    {return COMMENT;}
\".*\"                                  {yylval.me = strdup(yytext); return STRING;}
[a-zA-ZĞ-ğÇ-çÜ-üŞ-şÖ-öÇ-çİ-ı]           {yylval.id = yytext[0]; return VAR;}
[0-9]+	                                {yylval.num = atoi(yytext); return INTEGER;}
[ \t\r\n]	                            ;
[-+*/%=]                                {return yytext[0];}
"("        	                            {return *yytext;}
")"      	                            {return *yytext;}
"{"        	                            {return *yytext;}
"}"      	                            {return *yytext;}
.		                                {yyerror ("UNEXPECTED CHAR");}
%%
int yywrap (void) {return 1;}
