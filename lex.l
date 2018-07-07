%{
#include "y.tab.h"
#include <string.h>
%}
digit [0-9]
lower [a-z]
upper [A-Z]
letter {lower}|{upper}|[_]
onlineComment "//".*
moreLineComment "/*"
%%
<<<<<<< HEAD
"print"         {return print_t;}
"in"            {return in_t;}
"false"         {return false_t;}
"true"          {return true_t;}
"end"           {return end_t;}
"case"          {return case_t;}
"write"         {return write_t;}
"read"          {return read_t;}
"return"        {return return_t;}
"continue"      {return continue_t;}
"until"         {return until_t;}
"repeat"        {return repeat_t;}
"break"         {return break_t;}
"of"            {return of_t;}
"switch"        {return switch_t;}
"else"          {return else_t;}
"then"          {return then_t;}
"if"            {return if_t;}
"while"         {return while_t;}
"do"            {return do_t;}
"down"          {return down_t;}
"to"            {return to_t;}
"for"           {return for_t;}
"int"           {return integer;}
"double"        {return Double;}
"char"          {return character;}
"bool"          {return Boolean;}
["].["]         {return STRING_t;}
['].[']         {return CHAR_t;}
"program"       {return program;}
[0-9]+                 {yylval.num = atoi(yytext); return integerNumber;}
=======
"print"                            {return print_t;}
"in"                            {return in_t;}
"false"                            {return false_t;}
"true"                             {return true_t;}
"end"                             {return end_t;}
"case"                             {return case_t;}
"write"                            {return write_t;}
"read"                             {return read_t;}
"return"                           {return return_t;}
"continue"                         {return continue_t;}
"until"                            {return until_t;}
"repeat"                           {return repeat_t;}
"break"                            {return break_t;}
"of"                               {return of_t;}
"switch"                           {return switch_t;}
"else"                             {return else_t;}
"then"                             {return then_t;}
"if"                               {return if_t;}
"while"                            {return while_t;}
"do"                               {return do_t;}
"down"                             {return down_t;}
"to"                               {return to_t;}
"for"                              {return for_t;}
"int"                              {return integer;}
"double"                           {return Double;}
"char"                             {return character;}
"bool"                          {return Boolean;}
["].["]                            {return STRING_t;}
['].[']                            {return CHAR_t;}
"program"                          {return program;}
[0-9]+                 {yylval.num = atoi(yytext); return IntNumber;}
>>>>>>> multiVaribleUse
{letter}({letter}|{digit})*        {yylval.id = strdup(yytext); return ID;}
[ \t\n]                ;
{onlineComment}        ;
{moreLineComment}          {
{int c;
while( ( c = input() ) != EOF ){
if ( c == '\n' ){}
else if ( c == '*' )
{
if ( ( c = input() ) == '/' )
break ;
else
unput(c) ;
}
}
}

}
([-|+]?{digit}+)?"."{digit}+|([-|+]?{digit}+)?"."{digit}+([e|E][-+]?{digit}+) {yylval.doub = atof(yytext); return RealNumbe_t;}
[+]                                {return add_t;}
[-]                                {return sub_t;}
[*]                                {return mul_t;}
[%]                               {return mod_t;} 
"/"                               {return divide;} 
[=;:{}.,()]             	   {return yytext[0];}
"["|"]"                            {return yytext[0];}
"=="                               {return Qequal_t;}
".."                               {return DOnoghte;}
"!="                               {return Nequal_t;}
"&&"                               {return and_t;}
"||"                               {return or_t;}
"<"                                {return lessThan_t;}
">"                                {return greaterThan_t;}
"<="                               {return lessORequalThan_t;}
">="                               {return greaterorEqualThan_t;}
.                      {}

%%
int yywrap (void) {return 1;}

