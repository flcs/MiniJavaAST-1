grammar msb5_las3;

program: mainclass (classDeclaration)* EOF;

mainclass: 'class' Identifier '{' 'public' 'static' 'void' 'main' '(' 'string' '[' ']';

classDeclaration : 'class' Identifier ( 'extends' Identifier )? '{' ( varDecl )* ( methodDecl )* '}';

varDecl : Type Identifier ';';

methodDecl : 'public' Type Identifier '(' ( Type Identifier ( ',' Type Identifier )* )? ')' '{' ( varDecl )* ( statement )* 'return' exp ';' '}';

Type : 'int' '[' ']'
| 'boolean'
| 'int'
| Identifier;

statement : '{' ( statement )* '}'
| 'if' '(' exp ')' statement 'else' statement
| 'while' '(' exp ')' statement
| 'system.out.println' '(' exp ')' ';'
| Identifier '=' exp ';'
| Identifier '[' exp ']' '=' exp ';';

exp : exp ( '&&' | '<' | '+' | '-' | '*' ) exp
| exp '[' exp ']'
| exp '.' 'length'
| exp '.' Identifier '(' ( exp ( ',' exp )* )? ')'
| IntegerLiteral
| 'true'
| 'false'
| Identifier
| 'this'
| 'new' 'int' '[' exp ']'
| 'new' Identifier '(' ')'
| '!' exp
| '(' exp ')';

Identifier : [Aa-Zz]+[Aa-Zz|0-9]*;

IntegerLiteral : [0-9]+;