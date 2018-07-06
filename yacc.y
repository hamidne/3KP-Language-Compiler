%{
void yyerror (char *s);
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <string.h>


struct var
{
	char type;
	char name[16];
};

char var_count = 0;
char last_type = 0;
struct var variables[128];

void declare_variable(char *id);

%}

%union {
	int num;
	char *id;
	double doub;
	char *str;
}

%start Program
%token program
%token integer
%token Double
%token character
%token Boolean
%token for_t
%token then_t
%token STRING_t
%token to_t
%token down_t
%token do_t
%token while_t
%token if_t
%token else_t
%token switch_t
%token of_t
%token break_t
%token repeat_t
%token until_t
%token continue_t
%token return_t
%token read_t
%token write_t
%token print_t
%token case_t
%token true_t
%token false_t
%token in_t
%token end_t
%token Qequal_t
%token Nequal_t
%token and_t
%token or_t
%token CHAR_t
%token lessThan_t
%token greaterThan_t
%token lessORequalThan_t
%token greaterorEqualThan_t
%token divide
%token DOnoghte
%token add_t
%token sub_t
%token mul_t
%token mod_t
%token <doub> RealNumbe_t
%token <id> ID
%token <num> integerNumber


%left add_t sub_t
%left mul_t devide
%%

Program:
	program ID ';' DecList '{'SList  '}' '.' {printf("reduced FROM program ID ';' DecList '{'SList  '}' '.' to Program \n");}
	;

DecList:
	Dec  DecList {printf("reduced FROM Dec  DecList TO DecList \n");}
	|              {printf("reduced FROM  TO DecList \n");}
	;

Dec:
	VarDecs ';'      {printf("reduced FROM VarDecs ';' TO Dec \n");}
    | FuncDecs         {printf("reduced FROM FuncDecs TO Dec \n");}
    ;

FuncDecs:
	FuncDec FuncDecs {printf("reduced FROM FuncDec FuncDecs TO FuncDecs \n");}
	|                  {printf("reduced FROM  TO FuncDecs \n");}
	;

VarDecs:
	VarDec           {printf("reduced FROM VarDec TO VarDecs \n");}
	| VarDec VarDecs   {printf("reduced FROM VarDec VarDecs TO VarDecs \n");}
	;

VarDec:
	Type IDDList      {printf("reduced FROM Type IDDList TO VarDec \n");}
	;

Type:
	integer  		{ last_type = 1; printf("reduced FROM integer  TO Type \n");}
	| Double   		{ last_type = 2; printf("reduced FROM Double  TO Type \n");}
	| Boolean  		{ last_type = 3; printf("reduced FROM Boolean  TO Type \n");}
	| character  	{ last_type = 4; printf("reduced FROM character  TO Type \n");}
	;

IDDim:
	ID                        { declare_variable($1); printf("reduced FROM ID  TO IDDim \n");}
	| IDDim '['integerNumber']' {printf("reduced FROM IDDim '['integerNumber']'  TO IDDim \n");}
	;

IDDList:
	IDDim                  {printf("reduced FROM IDDim  TO IDDList \n");}
	| IDDim ',' IDDList      {printf("reduced FROM IDDim ',' IDDList   TO IDDList \n");}
	;

IDList:
	ID                      { declare_variable($1); printf("reduced FROM ID  TO IDList \n");}    
	| ID ',' IDList           { declare_variable($1); printf("reduced FROM ID ',' IDList  TO IDList \n");}
	;

FuncDec:
	Type ID '(' ArgsList ')' '{' SList '}' ';' {printf("reduced FROM Type ID '(' ArgsList ')' '{' SList '}' ';' TO FuncDec \n");}
	;

ArgsList:
	ArgList {printf("reduced FROM ArgList TO ArgsList \n");}
	|        {printf("reduced FROM  TO ArgsList \n");}
	;

ArgList:
	Arg               {printf("reduced FROM ArgList TO Arg \n");}
	| Arg ';' ArgList   {printf("reduced FROM Arg ';' ArgList TO Arg \n");}
	;

Arg:
	Type IDList           {printf("reduced FROM Arg TO Type IDList  \n");}
    ;

SList:
	Stmt ';' SList       {printf("reduced FROM Stmt ';' SList TO SList  \n");}
	|                     {printf("reduced FROM  TO SList  \n");}
	;

Stmt:
	Exp                              {printf("reduced FROM Exp TO Stmt  \n");}
	| VarDecs                          {printf("reduced FROM VarDecs TO Stmt  \n");}
	| for_t lvalue '=' Exp '('valfor')' Exp do_t Block{printf("reduced FROM for_t lvalue '=' Exp '('valfor')' Exp do_t Block TO Stmt  \n");}
	| while_t Exp do_t Block           {printf("reduced FROM while_t Exp do_t Block TO Stmt  \n");}  
	| if_t Exp then_t Block            {printf("reduced FROM if_t Exp then_t Block TO Stmt  \n");}
	| if_t Exp then_t Block else_t Block {printf("reduced FROM if_t Exp then_t Block else_t Block TO Stmt  \n");} 
	| switch_t Exp of_t '{' Cases '}'  {printf("reduced FROM switch_t Exp of_t '{' Cases '}' TO Stmt  \n");}
	| break_t                          {printf("reduced FROM break_t TO Stmt  \n");}
	| repeat_t Block until_t Exp       {printf("reduced FROM repeat_t Block until_t Exp TO Stmt  \n");}
	| continue_t                       {printf("reduced FROM continue_t TO Stmt  \n");}
	| return_t Exp                     {printf("reduced FROM return_t Exp TO Stmt  \n");} 
	| print_t Exp                      {printf("reduced FROM print_t Exp TO Stmt  \n");}
	| write_t ExpPlus                  {printf("reduced FROM write_t ExpPlus TO Stmt  \n");} 
	| read_t '(' lvalue ')'            {printf("reduced FROM read_t '(' lvalue ')' TO Stmt  \n");}
	|                                  {printf("reduced FROM  TO Stmt  \n");}
	;

valfor:
	to_t                                      {printf("reduced FROM to_t  TO valfor  \n");}
	|down_t to_t                               {printf("reduced FROM down_t to_t   TO valfor  \n");}
	;

Range:
	Exp DOnoghte Exp                               
	;                           

Cases:
	Case                                       {printf("reduced FROM Case TO Cases  \n");}
	| Case Cases                                {printf("reduced FROM Case Cases TO Cases  \n");}
	;

Case:
	case_t Exp ':' Block                      {printf("reduced FROM case_t Exp ':' Block TO Case \n");}
	| case_t Range ':' Block                    {printf("reduced FROM case_t Range ':' Block TO Case \n");}
	;
  
Logic:
	and_t                            {printf("reduced FROM and_t TO Logic \n");}
	| or_t                            {printf("reduced FROM or_t TO Logic \n");}
	| ""                              {printf("reduced FROM TO Logic \n");}
	| '='                             {printf("reduced FROM '=' TO Logic \n");}
	| Qequal_t                        {printf("reduced FROM Qequal_t TO Logic \n");}   
	| Nequal_t                        {printf("reduced FROM Nequal_t TO Logic \n");}
	|lessThan_t                       {printf("reduced FROM lessThan_t TO Logic \n");}
	|greaterThan_t                    {printf("reduced FROM greaterThan_t TO Logic \n");}
	|lessORequalThan_t                {printf("reduced FROM lessORequalThan_t TO Logic \n");}
	|greaterorEqualThan_t             {printf("reduced FROM greaterorEqualThan_t TO Logic \n");}
	;

Aop:
	add_t                            {printf("reduced FROM add_t TO Aop \n");}
    | sub_t                            {printf("reduced FROM sub_t TO Aop \n");}
    | mul_t                            {printf("reduced FROM mul_t TO Aop \n");}
    | mod_t                            {printf("reduced FROM mod_t TO Aop \n");}
    | divide                            {printf("reduced FROM divide TO Aop \n");}
    ;
 
ExpList:
	ExpPlus                        {printf("reduced FROM ExpPlus TO ExpList \n");}
	|                               {printf("reduced FROM  TO ExpList \n");}
	;

ExpPlus:
	Exp                           {printf("reduced FROM Exp TO ExpPlus \n");}
	| Exp ',' ExpPlus              {printf("reduced FROM Exp ',' ExpPlus TO ExpPlus \n");}
	;

IDD:
	ID                               {printf("reduced FROM Exp TO IDD \n");} 
    | IDD '[' Exp ']'                 {printf("reduced FROM IDD '[' Exp ']' TO IDD \n");} 
    ;

lvalue:
	ID                           {printf("reduced FROM ID TO lvalue \n");} 
	| IDD                          {printf("reduced FROM IDD TO lvalue \n");} 
	;

Exp:
	integerNumber                    {printf("reduced FROM integerNumber TO Exp \n");}
    |RealNumbe_t
    | lvalue                          {printf("reduced FROM lvalue TO Exp \n");}
    | CHAR_t                          {printf("reduced FROM CHAR_t TO Exp \n");}
    | true_t                          {printf("reduced FROM true_t TO Exp \n");}
    | false_t                         {printf("reduced FROM false_t TO Exp \n");}
    | Exp Aop Exp                     {printf("reduced FROM Exp Aop Exp TO Exp \n");}
    | Exp Logic Exp                   {printf("reduced FROM Exp Logic Exp TO Exp \n");}
    | '-' Exp                         {printf("reduced FROM '-' Exp  TO Exp \n");}
    | STRING_t                        {printf("reduced FROM STRING_t TO Exp \n");}
    | '('Exp')'                       {printf("reduced FROM '('Exp')' TO Exp \n");}
    | Exp in_t Range                  {printf("reduced FROM Exp in_t Range TO Exp \n");}
    | lvalue '=' Exp                  {printf("reduced FROM lvalue '=' Exp TO Exp \n");}
    | ID'('ExpList')'                 {printf("reduced FROM ID'('ExpList')'  TO Exp \n");}
    ; 

Block:
	'{' SList '}'                 {printf("reduced FROM '{' SList '} TO Block \n");}
	| Stmt                          {printf("reduced FROM Stmt TO Block \n");}
	; 

%%


int main (void) {
	return yyparse ( );
}

void yyerror (char *s) {
	fprintf (stderr, "%s\n", s);
}

void declare_variable(char *id) {	
	char find = 0;

	for(char i = 0; i < var_count; i++)
		if (strcmp(id, variables[i].name) == 0)
			find = 1;
	
	if (find == 0) {
		variables[var_count].type = last_type;
		strcpy(variables[var_count++].name, id);
		printf("create new var %s with type %c\n", id, last_type + 48);
	}
	else
		printf("This name is used\n");
}