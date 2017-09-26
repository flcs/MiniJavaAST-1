grammar msb5_las3;

program: MainClass (ClassDeclaration)* EOF;

MainClass: 'class' Identifier '{' 'public' 'static' 'void' 'main' '(' 'String' '[' ']';

ClassDeclaration : 'class' Identifier ( 'extends' Identifier )? '{' ( VarDecl )* ( MethodDecl )* '}';

VarDecl : Type Identifier ';';

MethodDecl : 'public' Type Identifier '(' ( Type Identifier ( ',' Type Identifier )* )? ')' '{' ( VarDecl )* ( Statement )* 'return' Exp ';' '}';

Type : 'int' '[' ']'
| 'boolean'
| 'int'
| Identifier;

Statement : '{' ( Statement )* '}'
| 'if' '(' Exp ')' Statement 'else' Statement
| 'while' '(' Exp ')' Statement
| 'System.out.println' '(' Exp ')' ';'
| Identifier '=' Exp ';'
| Identifier '[' Exp ']' '=' Exp ';';

Exp : Exp ( '&&' | '<' | '+' | '-' | '*' ) Exp
| Exp '[' Exp ']'
| Exp '.' 'length'
| Exp '.' Identifier '(' ( Exp ( ',' Exp )* )? ')'
| IntegerLiteral
| 'true'
| 'false'
| Identifier
| 'this'
| 'new' 'int' '[' Exp ']'
| 'new' Identifier '(' ')'
| '!' Exp
| '(' Exp ')';

Identifier : [Aa-Zz]+[Aa-Zz|0-9]*;

IntegerLiteral : [0-9]+;