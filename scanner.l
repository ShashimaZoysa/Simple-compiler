%{
    #include <stdio.h>
    int countn = 1; /*keeping track of the line number */
%}

%option noyywrap

/* Regular expressions */
letter      [a-zA-Z]
digit       [0-9]
id          {letter}({letter}|{digit}|_)*
nonzero     [1-9]
intLit      ({nonzero}{digit}*|0)
fraction    (\.{digit}*{nonzero}|\.0)
floatLit    ({intLit}{fraction}([eE][+|-]?{intLit})?)

/* Tokens */
%{
enum TokenType {
    ATTRIBUTE, CLASS, CONSTRUCTOR, ELSE, FLOAT, FUNCTION, IF, INTEGER, ISA, LOCALVAR,
    PRIVATE, PUBLIC, READ, RETURN, SELF, THEN, VOID, WHILE, WRITE, SR, AND, OR, NOT,
    ARROW, ID, INTLIT, FRACTION, FLOATLIT, LPAREN, RPAREN, LBRACE, RBRACE, LBRACKET,
    RBRACKET, SEMICOLON, COMMA, DOT, COLON, ASSIGN, ANGELBRACK, LEQ, GEQ, EQ, NEQ,
    GT, LT, ADD, SUBTRACT, DIVIDE, MULTIPLY
};
%}

%%


"attribute"                        { printf("ATTRIBUTE     %s\t\t\t%d\n", yytext, countn); return ATTRIBUTE; }
"class"                            { printf("CLASS         %s\t\t\t%d\n", yytext, countn); return CLASS; }
"constructor"                      { printf("CONSTRUCTOR   %s\t\t\t%d\n", yytext, countn); return CONSTRUCTOR; }
"else"                             { printf("ELSE          %s\t\t\t%d\n", yytext, countn); return ELSE; }
"float"                            { printf("FLOAT         %s\t\t\t%d\n", yytext, countn); return FLOAT; }
"function"                         { printf("FUNCTION      %s\t\t\t%d\n", yytext, countn); return FUNCTION; }
"if"                               { printf("IF            %s\t\t\t%d\n", yytext, countn); return IF; }
"integer"                          { printf("INTEGER       %s\t\t\t%d\n", yytext, countn); return INTEGER; }
"isa"                              { printf("ISA           %s\t\t\t%d\n", yytext, countn); return ISA; }
"localVar"                         { printf("LOCALVAR      %s\t\t\t%d\n", yytext, countn); return LOCALVAR; }
"private"                          { printf("PRIVATE       %s\t\t\t%d\n", yytext, countn); return PRIVATE; }
"public"                           { printf("PUBLIC        %s\t\t\t%d\n", yytext, countn); return PUBLIC; }
"read"                             { printf("READ          %s\t\t\t%d\n", yytext, countn); return READ; }
"return"                           { printf("RETURN        %s\t\t\t%d\n", yytext, countn); return RETURN; }
"self"                             { printf("SELF          %s\t\t\t%d\n", yytext, countn); return SELF; }
"then"                             { printf("THEN          %s\t\t\t%d\n", yytext, countn); return THEN; }
"void"                             { printf("VOID          %s\t\t\t%d\n", yytext, countn); return VOID; }
"while"                            { printf("WHILE         %s\t\t\t%d\n", yytext, countn); return WHILE; }
"write"                            { printf("WRITE         %s\t\t\t%d\n", yytext, countn); return WRITE; }
"sr"                               { printf("SR            %s\t\t\t%d\n", yytext, countn); return SR; }
"and"                              { printf("AND           %s\t\t\t%d\n", yytext, countn); return AND; }
"or"                               { printf("OR            %s\t\t\t%d\n", yytext, countn); return OR; }
"not"                              { printf("NOT           %s\t\t\t%d\n", yytext, countn); return NOT; }
"->"                               { printf("ARROW         %s\t\t\t\t%d\n", yytext, countn); return ARROW; }
{id}                               { printf("ID            %s\t\t\t%d\n", yytext, countn); return ID; }
{intLit}                           { printf("INTLIT        %s\t\t\t\t%d\n", yytext, countn); return INTLIT;}
{fraction}                         { printf("FRACTION      %s\t\t\t\t%d\n", yytext, countn); return FRACTION; }
{floatLit}                         { printf("FLOATLIT      %s\t\t\t\t%d\n", yytext, countn); return FLOATLIT; }
"("                                { printf("LPAREN        %s\t\t\t\t%d\n", yytext, countn); return LPAREN; }
")"                                { printf("RPAREN        %s\t\t\t\t%d\n", yytext, countn); return RPAREN; }
"{"                                { printf("LBRACE        %s\t\t\t\t%d\n", yytext, countn); return LBRACE; }
"}"                                { printf("RBRACE        %s\t\t\t\t%d\n", yytext, countn); return RBRACE; }
"["                                { printf("LBRACKET      %s\t\t\t\t%d\n", yytext, countn); return LBRACKET; }
"]"                                { printf("RBRACKET      %s\t\t\t\t%d\n", yytext, countn); return RBRACKET; }
";"                                { printf("SEMICOLON     %s\t\t\t\t%d\n", yytext, countn); return SEMICOLON; }
","                                { printf("COMMA         %s\t\t\t\t%d\n", yytext, countn); return COMMA; }
"."                                { printf("DOT           %s\t\t\t\t%d\n", yytext, countn); return DOT; }
":"                                { printf("COLON         %s\t\t\t\t%d\n", yytext, countn); return COLON; }
"="                                { printf("ASSIGN        %s\t\t\t\t%d\n", yytext, countn); return ASSIGN; }
"<>"                               { printf("ANGELBRACK    %s\t\t\t\t%d\n", yytext, countn); return ANGELBRACK; }
"<="                               { printf("LEQ           %s\t\t\t\t%d\n", yytext, countn); return LEQ;}
">="                               { printf("GEQ           %s\t\t\t\t%d\n", yytext, countn); return GEQ; }
"=="                               { printf("EQ            %s\t\t\t\t%d\n", yytext, countn); return EQ; }
"!="                               { printf("NEQ           %s\t\t\t\t%d\n", yytext, countn); return NEQ;}
">"	                           { printf("GT            %s\t\t\t\t%d\n", yytext, countn); return GT; }
"<"	                           { printf("LT            %s\t\t\t\t%d\n", yytext, countn); return LT; }
"+"                                { printf("ADD           %s\t\t\t\t%d\n", yytext, countn); return ADD; }
"-"                                { printf("SUBTRACT      %s\t\t\t\t%d\n", yytext, countn); return SUBTRACT; }
"/"                                { printf("DIVIDE        %s\t\t\t\t%d\n", yytext, countn); return DIVIDE; }
"*"                                { printf("MULTIPLY      %s\t\t\t\t%d\n", yytext, countn); return MULTIPLY; }
\/\/.*                             { ; }
\/\*(.*\n)*.*\*\/                  { ; } 
[ \t]+                             { ; }
\n                                { countn++; }

%%

int main() {

     printf("\n-----------------------------------------------");
     printf("\nTOKEN\t     LEXEME\t\tLINE NUMBER ");
      printf("\n-----------------------------------------------\n\n");

    // Set the input stream for the lexer
    yyin = stdin;

    // Call the lexer to get the next token
    int token;
    do {
        token = yylex();
        // Process the token as needed
    } while (token != 0);

    return 0;
}