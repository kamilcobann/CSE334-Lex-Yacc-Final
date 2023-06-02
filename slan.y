%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
void yyerror (char *s);     /* C declarations used in actions */
int yylex();
int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
int computeSymbolIndex(char token);
int val_1 = 0;
int whileVal = 1;
int ifVal = 1;
int funcval = 0;
void functionCall(char symbol);
void functionExp(char symbol);
char* s = "";
extern char* yytext;

%}


%union {int num; char id; char* me;}         /* Yacc definitions */
%start line
%token PRINT
%token COMMENT
%token LOOP 
%token IF
%token ELSE
%token <num> INTEGER
%token QUESTION_EQUAL NOT_EQUAL GREATER_EQUAL LESS_EQUAL GREATER_THAN LESS_THAN
%token TRUE FALSE NOT
%token FUNCTION
%token EXIT
%token <id> VAR
%token <me> STRING
%token AND OR
%type <num> line expression term arithmeticExpression logicalExpression statements logics
%type <num> printStatement assignmentStatement exitStatement
%type <num> loopStatement loopExpression loopSts loopStates
%type <num> ifelseStatement ifStatement ifExpression ifSts elseStatement elseSts ifStates
%type <num> functionStatement functionCallStatement functionStates functionSts functionExpression
%type <num> sts
%type <id> assignment


%%
line    : statements
        | line statements
        | line statements commentStatement
        | statements commentStatement
        ;

statements  : printStatement
            | exitStatement
            | assignmentStatement
            | loopStatement
            | ifelseStatement
            | functionStatement
            | functionCallStatement
            ;


printStatement  : PRINT '('expression')' {printf("%d\n",$3);}
                | PRINT '('STRING')' {printf("%s\n",$3);}
                ;

exitStatement   : EXIT {exit(EXIT_SUCCESS);}
                ;

commentStatement    : COMMENT
                    ;


assignmentStatement : assignment {;}
                    ;

functionStatement   : 
                    functionExpression '{'functionStates'}' {if(funcval==1) $$=val_1;}
                    ;
                ;

functionExpression  : 
                    FUNCTION VAR '('')' {functionExp($2);}
                    ;
                ;


functionCallStatement   :
                        VAR '('')' {functionCall($1);}
                        ;


assignment  : VAR '=' expression {updateSymbolVal($1,$3);}
            ;

expression  : arithmeticExpression {$$ = $1;}
            | logicalExpression {$$ = $1;}
            ;


arithmeticExpression    : term  {$$ = $1;}
                        | arithmeticExpression '+' term {$$ = $1 + $3;}
                        | arithmeticExpression '-' term {$$ = $1 - $3;}
                        | arithmeticExpression '*' term {$$ = $1 * $3;}
                        | arithmeticExpression '/' term {$$ = $1 / $3;}
                        | arithmeticExpression '%' term {$$ = $1 % $3;}
                        ;


loopStatement   : loopExpression '{'loopStates'}' {while(whileVal == 1) $$ = val_1;}
                ;


loopExpression  : LOOP '('logicalExpression')' {whileVal = $3;}
                | LOOP '('VAR')' {whileVal = symbolVal($3);}
                ;



loopStates  : sts
            | loopSts
            | loopStates sts
            | loopStates loopSts
            ;


loopSts : VAR '=' sts {while(whileVal == 1) updateSymbolVal($1, val_1);}
        | PRINT '('sts')' {while(whileVal == 1) printf("%d\n",val_1);}
        | PRINT '('STRING')' {while(whileVal == 1) printf("%s\n",$3);}
        | loopStatement {;}
        | ifelseStatement {;}
        | functionCallStatement {;}
        ;

ifelseStatement : ifStatement
                | ifStatement elseStatement
                ;


ifStatement : ifExpression '{'ifStates'}' {if(ifVal == 1) $$ = val_1;}
        ;


ifExpression    : IF '('logicalExpression')' {ifVal = $3; }
                | IF '('VAR')' {ifVal = symbolVal($3);}
                ;


ifStates    : sts
            | ifSts
            | ifStates sts
            | ifStates ifSts
        ;


ifSts   : VAR '=' sts {if(ifVal == 1) updateSymbolVal($1, val_1);}
        | PRINT '('sts')' {if(ifVal==1) printf("%d\n", val_1);}
        | PRINT '('STRING')' {if(ifVal==1) printf("%s\n", $3);}
        | ifelseStatement {;}
        | loopStatement {;}
        | functionCallStatement {;}
        ;

elseStatement   : ELSE '{'elseStates'}' {if(ifVal == 0) $$ = val_1;}
            ;


elseStates  : sts
            | elseSts
            | elseStates sts
            | elseStates elseSts
            ;


elseSts : VAR '=' sts {if(ifVal == 0) updateSymbolVal($1, val_1);}
        | PRINT '('sts')' {if(ifVal == 0) printf("%d\n",val_1);}
        | PRINT '('STRING')' {if(ifVal == 0) printf("%s\n",$3);}
        | ifelseStatement {;}
        | loopStatement {;}
        | functionCallStatement {;}
        ;


functionStates  : sts
                | functionSts
                | functionStates sts
                | functionStates functionSts
            ;


functionSts : VAR '=' sts {if(funcval == 1) updateSymbolVal($1, val_1);}
            | PRINT '('sts')' {;}
            | PRINT '('STRING')' {if(ifVal == 1) s=$3;}
            | ifelseStatement {;}
            | loopStatement {;}
            | functionCallStatement {;}
        ;

logicalExpression   : 
                     logics {$$ = $1;}
                    | NOT logics {$$ = !$2;}
                    | logicalExpression AND logics {$$ = $1 && $3;}
                    | logicalExpression OR logics {$$ = $1 || $3;}
                    | arithmeticExpression QUESTION_EQUAL arithmeticExpression {$$ = $1==$3 ? 1 : 0;}
                    | arithmeticExpression NOT_EQUAL arithmeticExpression {$$ = $1!=$3 ? 1 : 0;}
                    | arithmeticExpression GREATER_EQUAL arithmeticExpression {$$ = $1>=$3 ? 1 : 0;}
                    | arithmeticExpression LESS_EQUAL arithmeticExpression {$$ = $1<=$3 ? 1 : 0;}
                    | arithmeticExpression GREATER_THAN arithmeticExpression {$$ = $1>$3 ? 1 : 0;}
                    | arithmeticExpression LESS_THAN arithmeticExpression {$$ = $1<$3 ? 1 : 0;}
                    ;
                    

sts : term '+' term {val_1 = $1+$3;}
    | term '-' term {val_1 = $1-$3;}
    | term '*' term {val_1 = $1*$3;}
    | term '/' term {val_1 = $1/$3;}
    | term '%' term {val_1 = $1%$3;}
    | term QUESTION_EQUAL term {val_1 = $1==$3 ? 1 : 0;}
    | term NOT_EQUAL term {val_1 = $1 != $3 ? 1 : 0;}
    | term GREATER_EQUAL term {val_1 = $1 >= $3 ? 1 : 0;}
    | term LESS_EQUAL term {val_1 = $1<=$3 ? 1 : 0;}
    | term GREATER_THAN term {val_1 = $1>$3 ? 1 : 0;}
    | term LESS_THAN term {val_1 = $1<$3 ? 1 : 0;}
    | NOT logics {val_1 = !$2;}
    | logics {val_1 = $1;}
    | term {val_1 = $1;}
    ;

    

logics  : TRUE {$$ = 1;}
        | FALSE {$$ = 0;}
         

term    : INTEGER {$$ = $1;}
        | VAR {$$ = symbolVal($1);}
        ;

%%

int computeSymbolIndex(char token)
{
    int idx = -1;
    if(islower(token))
    {
        idx = token - 'a' + 26;
    }else if(isupper(token)){
        idx = token - 'A';
    }
    return idx;
}

int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}


void functionCall(char symbol)
{
	if(symbolVal(symbol) == -1){
		funcval = 1;
		printf("%d\n",val_1);
		printf("%s\n",s);
	}
	else{
		printf("The function is not defined.\n");
	}	
}


void functionExp(char symbol)
{
	if(symbolVal(symbol) == -1){
		printf("The function already exists.\n");
	}
	if(symbolVal(symbol) != -1){
		updateSymbolVal(symbol, -1);	
	}	
}


int main (void) {
	/* init symbol table */
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}

	return yyparse ( );
}


void yyerror(char* message){
    printf("Parse error:%s\n", message);
    exit(1);

} 