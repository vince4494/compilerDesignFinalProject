%{
//  finalLang.y
//  $ bison --verbose -d --debug finalLang.y
//  $ gcc finalLang.tab.c -c
#include  "finalLang.h"
%}

%union
{
  Statement*	statePtr_;
  char*		charPtr_;
  double	const_;
  std::string*	stringPtr_;
}

%start			expr
%token			BEGIN_P END_P END
%token			PRINT READ IF DO WHILE PRINTLN
%token			PLUS_EQUAL MINUS_EQUAL MULT_EQUAL DIV_EQUAL PLUS_PLUS MINUS_MINUS
%nonassoc		IF_SIMPLE
%nonassoc		ELSE
%right			EQUAL NOT_EQUAL NOT VAR_ASSIGN 
%left			LESS GREATER
%left			PLUS MINUS
%left			STAR SLASH
%nonassoc		UMINUS
%token			BEGIN_C END_C
%token	<charPtr_>	VARIABLE
%token	<const_>	NUMBER
%token	<stringPtr_>	STRING
%type	<statePtr_>	expr
//%type	<statePtr_>	state
%type	<statePtr_>	list
%nonassoc		ERROR

%%

list	: list expr
	  {
	    ((BlockStatement*)$1)->add($2);
	    $$ = $1;
	  }
	|
	  {
	    // lambda production
	    $$ = new BlockStatement;
	  };

expr	: BEGIN_P PRINTLN expr END_P
	  { 
	    resultPtr = $$ = new PrintLnStatement($3);
	  }
	| BEGIN_P PRINT expr END_P
	  {
	    resultPtr = $$ = new PrintStatement($3);
	  }
	| BEGIN_P PRINT STRING END_P
	  {
	    resultPtr = $$ = new PrintStatement($3);
	  }
	| BEGIN_P PRINTLN STRING END_P
	  {
	    resultPtr = $$ = new PrintLnStatement($3);
	  }
	| BEGIN_P IF expr expr END_P
	  {
	    resultPtr = $$ = new IfStatement($3,$4);
	  }
	| BEGIN_P IF expr expr expr END_P
	  {
	    resultPtr = $$ = new IfStatement($3,$4,$5);
	  }
	| BEGIN_P WHILE expr expr END_P
	  {
	    resultPtr = $$ = new WhileStatement($3,$4);
	  }
	| BEGIN_P BEGIN_C list END_C END_P
	  {
	    resultPtr = $$ = $3;
	  }
	| BEGIN_P DO list expr END_P
	  {
	    //$$ = new BlockStatement;
	    ((BlockStatement*)$3)->add($4);
	    resultPtr = $$ = $3;
	     
	  }

	| BEGIN_P VAR_ASSIGN VARIABLE expr END_P
	  {
	    resultPtr = $$ = new AssignStatement($3,$4);
	  }
	| BEGIN_P LESS expr expr END_P
	  {
	    resultPtr = $$ = new BinaryOpStatement('<',$3,$4);
	  }
	| BEGIN_P GREATER expr expr END_P
	  {
	    resultPtr = $$ = new BinaryOpStatement('>',$3,$4);
	  }
	| BEGIN_P PLUS expr expr END_P
	  {
	    resultPtr = $$ = new BinaryOpStatement('+',$3,$4);
	  }
	| BEGIN_P MINUS expr expr END_P
	  {
	    resultPtr = $$ = new BinaryOpStatement('-',$3,$4);
	  }
	| BEGIN_P STAR expr expr END_P
	  {
	    resultPtr = $$ = new BinaryOpStatement('*',$3,$4);
	  }
	| BEGIN_P SLASH expr expr END_P
	  {
	    resultPtr = $$ = new BinaryOpStatement('/',$3,$4);
	  }
	| BEGIN_P EQUAL expr expr END_P
	  {
	    resultPtr = $$ = new BinaryOpStatement('=', $3, $4);
	  }
	| BEGIN_P NOT_EQUAL expr expr END_P
	  {
	    resultPtr = $$ = new BinaryOpStatement('!', $3, $4);
	  }	    
	| BEGIN_P NOT expr END_P
	  {
	    resultPtr = $$ = new UnaryOpStatement('!',$3);
	  }
	| BEGIN_P MINUS expr END_P 
	  {
	    resultPtr = $$ = new UnaryOpStatement('-',$3);
	  }
	| NUMBER
	  {
	    resultPtr = $$ = new ConstantStatement($1);
	  }
	| VARIABLE
	  {
	    resultPtr = $$ = new RValVarNameStatement($1);
	  }
	| BEGIN_P READ END_P
	  {
	    resultPtr = $$ = new ReadStatement();
	  }
	| BEGIN_P PLUS_EQUAL VARIABLE expr END_P
	  {
	     resultPtr = $$ = new AssignStatement(strdup($3), new BinaryOpStatement('+', new RValVarNameStatement($3),$4));
	  }
	| BEGIN_P MINUS_EQUAL VARIABLE expr END_P
	  {
	    resultPtr = $$ = new AssignStatement(strdup($3), new BinaryOpStatement('-', new RValVarNameStatement($3),$4));
	  }
	| BEGIN_P MULT_EQUAL VARIABLE expr END_P
	  {
             resultPtr = $$ = new AssignStatement(strdup($3), new BinaryOpStatement('*', new RValVarNameStatement($3),$4));
	  }
	| BEGIN_P DIV_EQUAL VARIABLE expr END_P
	  {
             resultPtr = $$ = new AssignStatement(strdup($3), new BinaryOpStatement('/', new RValVarNameStatement($3),$4));
	  }
	| BEGIN_P PLUS_PLUS VARIABLE END_P
	  {
	     resultPtr = $$ = new AssignStatement(strdup($3), new BinaryOpStatement('+', new RValVarNameStatement($3), new ConstantStatement(1)));
	  }
	| BEGIN_P MINUS_MINUS VARIABLE END_P
	  {
             resultPtr = $$ = new AssignStatement(strdup($3), new BinaryOpStatement('-', new RValVarNameStatement($3), new ConstantStatement(1)));
	  }
	 	
%%
