%{
#include <stdio.h>
#include <string.h>
 
void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
}
 
int yywrap()
{
        return 1;
} 
  
main()
{
        yyparse();
} 

%}

%start number

%token ZERO ONE DOT WS

%%
number: bits rest WS ;
bits: bit | bits bit ;
bit: ZERO | ONE ;
rest: | DOT bits ;
