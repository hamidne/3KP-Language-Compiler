%{
void yyerror (char *s);
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <string.h>
<<<<<<< HEAD


struct var
{
	char type;
	char name[16];
};


struct func
{
	char *name;
	char args[16];
	char args_count;
};


char var_count = 0;
char last_type = 0;
struct var variables[128];
struct func functions[128];

void declare_variable(char *id);

=======
int cscope = 0;
int declared[26];
int scope[26]; 
int brace = 0;
>>>>>>> multiVaribleUse
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
%token <num> IntNumber


%left add_t sub_t
%left mul_t devide
%%

Program:
<<<<<<< HEAD
	program ID ';' DecList '{'SList  '}' '.' { last_type=10; declare_variable($2);}
=======
	program ID ';' DecList '{' open_b SList  '}' close_b '.' {printf("program ID > program \n");final_end();}
>>>>>>> multiVaribleUse
	;

DecList:
	Dec  DecList {printf("Dec And DecList > DecList \n");}
	|              {printf("No > DecList \n");}
	;

Dec:
	VarDecs ';'      {printf("VarDecs > Dec \n");}
    | FuncDecs         {printf("FuncDecs > Dec \n");}
    ;

FuncDecs:
	FuncDec FuncDecs {printf("FuncDec And FuncDecs > FuncDecs \n");}
	|                  {printf("No > FuncDecs \n");}
	;

VarDecs:
	VarDec           {printf("VarDec > VarDecs \n");}
	| VarDec VarDecs   {printf("VarDec VarDecs > VarDecs \n");}
	;

VarDec:
	Type IDDList      {printf("reduced FROM Type IDDList TO VarDec \n");}/////////////check varible begin from here
	;

Type:
<<<<<<< HEAD
	integer  		{ last_type = 1; }
	| Double   		{ last_type = 2; }
	| Boolean  		{ last_type = 3; }
	| character  	{ last_type = 4; }
	;

IDDim:
	ID                        { declare_variable($1); printf("reduced FROM ID  TO IDDim \n");}
	| IDDim '['integerNumber']' {printf("reduced FROM IDDim '['integerNumber']'  TO IDDim \n");}
=======
	integer          {printf("integer  > Type \n");}
	| Double         {printf("Double  > Type \n");}
	| Boolean        {printf("Boolean  > Type \n");}
	| character      {printf("character  > Type \n");}
	;

IDDim:
	ID                        {printf("ID  > IDDim \n");}
	| IDDim '['IntNumber']' {printf("IDDim '['IntNumber']'  > IDDim \n");}
>>>>>>> multiVaribleUse
	;

IDDList:
	IDDim                  {printf("IDDim  > IDDList \n");}
	| IDDim ',' IDDList      {printf("IDDim  IDDList   > IDDList \n");}
	;

IDList:
<<<<<<< HEAD
	ID                      { declare_variable($1); printf("reduced FROM ID  TO IDList \n");}    
	| ID ',' IDList           { declare_variable($1); printf("reduced FROM ID ',' IDList  TO IDList \n");}
=======
	ID                      {printf("ID  > IDList \n");}    
	| ID ',' IDList           {printf("ID  IDList  > IDList \n");}
>>>>>>> multiVaribleUse
	;

FuncDec:
        Type ID '(' ArgsList ')' '{' open_b SList '}' close_b ';' {printf("Type ID '(' ArgsList ')' '{' SList '}' ';' > FuncDec \n");}
	//Type ID '(' ArgsList ')' '{' open_b SList '}'  ';' {printf("reduced FROM Type ID '(' ArgsList ')' '{' SList '}' ';' TO FuncDec \n");}
	;
open_b:
               {printf("open brace\n");open_brace();}
        ;
close_b:
               {printf("close brace\n");close_brace();}
        ;
ArgsList:
	ArgList {printf("ArgList > ArgsList \n");}
	|        {printf(" > ArgsList \n");}
	;

ArgList:
	Arg               {printf("ArgList > Arg \n");}
	| Arg ';' ArgList   {printf("Arg ';' ArgList > Arg \n");}
	;

Arg:
	Type IDList           {printf("Arg > Type IDList  \n");}
    ;

SList:
	Stmt ';' SList       {printf("Stmt ';' SList > SList  \n");}
	|                     {printf(" > SList  \n");}
	;

Stmt:
<<<<<<< HEAD
	Exp                              					{printf("reduced FROM Exp TO Stmt  \n");}
	| VarDecs                          					{printf("reduced FROM VarDecs TO Stmt  \n");}
	| for_t lvalue '=' Exp '('valfor')' Exp do_t Block	{printf("reduced FROM for_t lvalue '=' Exp '('valfor')' Exp do_t Block TO Stmt  \n");}
	| while_t Exp do_t Block           					{printf("reduced FROM while_t Exp do_t Block TO Stmt  \n");}  
	| if_t Exp then_t Block            					{printf("reduced FROM if_t Exp then_t Block TO Stmt  \n");}
	| if_t Exp then_t Block else_t Block 				{printf("reduced FROM if_t Exp then_t Block else_t Block TO Stmt  \n");} 
	| switch_t Exp of_t '{' Cases '}'  					{printf("reduced FROM switch_t Exp of_t '{' Cases '}' TO Stmt  \n");}
	| break_t                          					{printf("reduced FROM break_t TO Stmt  \n");}
	| repeat_t Block until_t Exp       					{printf("reduced FROM repeat_t Block until_t Exp TO Stmt  \n");}
	| continue_t                       					{printf("reduced FROM continue_t TO Stmt  \n");}
	| return_t Exp                     					{printf("reduced FROM return_t Exp TO Stmt  \n");} 
	| print_t Exp                      					{printf("reduced FROM print_t Exp TO Stmt  \n");}
	| write_t ExpPlus                  					{printf("reduced FROM write_t ExpPlus TO Stmt  \n");} 
	| read_t '(' lvalue ')'            					{printf("reduced FROM read_t '(' lvalue ')' TO Stmt  \n");}
	|                                  					{printf("reduced FROM  TO Stmt  \n");}
=======
	Exp                              {printf("Exp > Stmt  \n");}
	| VarDecs                          {printf("VarDecs > Stmt  \n");}
	| for_t lvalue '=' Exp '('valfor')' Exp do_t Block{printf("for_t lvalue '=' Exp '('valfor')' Exp do_t Block > Stmt  \n");}
	| while_t Exp do_t Block           {printf("while_t Exp do_t Block > Stmt  \n");}  
	| if_t Exp then_t Block            {printf("if_t Exp then_t Block > Stmt  \n");}
	| if_t Exp then_t Block else_t Block {printf("if_t Exp then_t Block else_t Block > Stmt  \n");} 
	| switch_t Exp of_t '{'open_b Cases '}'close_b  {printf("switch_t Exp of_t '{' Cases '}' > Stmt  \n");}
	| break_t                          {printf("break_t > Stmt  \n");}
	| repeat_t Block until_t Exp       {printf("repeat_t Block until_t Exp > Stmt  \n");}
	| continue_t                       {printf("continue_t > Stmt  \n");}
	| return_t Exp                     {printf("return_t Exp > Stmt  \n");} 
	| print_t Exp                      {printf("print_t Exp > Stmt  \n");}
	| write_t ExpPlus                  {printf("write_t ExpPlus > Stmt  \n");} 
	| read_t '(' lvalue ')'            {printf("read_t '(' lvalue ')' > Stmt  \n");}
	|                                  {printf(" > Stmt  \n");}
>>>>>>> multiVaribleUse
	;

valfor:
	to_t                                      {printf("to_t  > valfor  \n");}
	|down_t to_t                               {printf("down_t to_t  > valfor  \n");}
	;

Range:
	Exp DOnoghte Exp                               
	;                           

Cases:
	Case                                       {printf("Case > Cases  \n");}
	| Case Cases                                {printf("Case Cases > Cases  \n");}
	;

Case:
	case_t Exp ':' Block                      {printf("case_t Exp ':' Block > Case \n");}
	| case_t Range ':' Block                    {printf("case_t Range ':' Block > Case \n");}
	;
  
Logic:
	and_t                            {printf("and_t > Logic \n");}
	| or_t                            {printf("or_t > Logic \n");}
	| ""                              {printf("> Logic \n");}
	| '='                             {printf("'=' > Logic \n");}
	| Qequal_t                        {printf("Qequal_t > Logic \n");}   
	| Nequal_t                        {printf("Nequal_t > Logic \n");}
	|lessThan_t                       {printf("lessThan_t > Logic \n");}
	|greaterThan_t                    {printf("greaterThan_t > Logic \n");}
	|lessORequalThan_t                {printf("lessORequalThan_t > Logic \n");}
	|greaterorEqualThan_t             {printf("greaterorEqualThan_t > Logic \n");}
	;

Aop:
	add_t                            {printf("add_t > Aop \n");}
    | sub_t                            {printf("sub_t > Aop \n");}
    | mul_t                            {printf("mul_t > Aop \n");}
    | mod_t                            {printf("mod_t > Aop \n");}
    | divide                            {printf("divide > Aop \n");}
    ;
 
ExpList:
	ExpPlus                        {printf("ExpPlus > ExpList \n");}
	|                               {printf(" > ExpList \n");}
	;

ExpPlus:
	Exp                           {printf("Exp > ExpPlus \n");}
	| Exp ',' ExpPlus              {printf("Exp ',' ExpPlus > ExpPlus \n");}
	;

IDD:
	ID                               {printf("Exp > IDD \n");} 
    | IDD '[' Exp ']'                 {printf("IDD '[' Exp ']' > IDD \n");} 
    ;

lvalue:
	ID                           {printf("ID > lvalue \n");} 
	| IDD                          {printf("IDD > lvalue \n");} 
	;

Exp:
	IntNumber                    {printf("IntNumber > Exp \n");}
    |RealNumbe_t
    | lvalue                          {printf("lvalue > Exp \n");}
    | CHAR_t                          {printf("CHAR_t > Exp \n");}
    | true_t                          {printf("true_t > Exp \n");}
    | false_t                         {printf("false_t > Exp \n");}
    | Exp Aop Exp                     {printf("Exp Aop Exp > Exp \n");}
    | Exp Logic Exp                   {printf("Exp Logic Exp > Exp \n");}
    | '-' Exp                         {printf("'-' Exp  > Exp \n");}
    | STRING_t                        {printf("STRING_t > Exp \n");}
    | '('Exp')'                       {printf("'('Exp')' > Exp \n");}
    | Exp in_t Range                  {printf("Exp in_t Range > Exp \n");}
    | lvalue '=' Exp                  {printf("lvalue '=' Exp > Exp \n");}
    | ID'('ExpList')'                 {printf("ID'('ExpList')'  > Exp \n");}
    ; 

Block:
	'{' open_b SList '}' close_b                {printf("'{' SList '} > Block \n");}
	| Stmt                          {printf("Stmt > Block \n");}
	; 

%%


int main (void) {
	return yyparse ( );
}

void yyerror (char *s) {
<<<<<<< HEAD
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
		printf(" -- create new var #%s# with type %c\n", id, last_type + 48);
	}
	else
		printf(" -- Syntax Error : #%s# is an already declared variable\n", id);
=======
        final_end();
        fprintf (stderr, "%s\n", s);} 

void open_brace(){
        brace++;
}
void close_brace(){
        brace--;
}
void final_end(){
        if(brace!=0){
                printf("Error:Wrong braces");
        }
>>>>>>> multiVaribleUse
}