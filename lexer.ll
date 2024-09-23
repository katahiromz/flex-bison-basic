%top {
    // VeySicK Lexer by katahiromz
    // Copyright (C) 2024 Katayama Hirofumi MZ <katayama.hirofumi.mz@gmail.com>
    // License: MIT
    #include "processor.h"
    #include "parser.h"
}

%option noyywrap

NEWLINE     (\r?\n|\r)
STRING      \"[^\"\r\n]*\"?
IDENTIFIER  [A-Za-z][A-Za-z0-9_\.]*[\$\#\!\%\?]?@?
OCTAL       (&O|&o|&)[0-7]+
HEX         (&H|&h)[0-9A-Fa-f]+
DIGITS      [0-9]+
REAL        ([0-9]+\.[0-9]*|\.[0-9]+)
EXPONENT    ({DIGITS}|{REAL})[eEdD][\-\+][0-9]+
NUMERIC     ({DIGITS}|{HEX}|{OCTAL}|{REAL}|{EXPONENT})[!#%&]?

%%

REM([ \t]|:).* {
    // Line comment as REM statement
    yylval = std::make_shared<VskAst>(AST_COMMENT, yytext);
    return TK_REM;
}
'.* {
    // Line comment by apostrophe
    yylval = std::make_shared<VskAst>(AST_COMMENT, yytext);
    return TK_REM;
}
{NEWLINE} {
    // Newline for old computers
    return TK_NEWLINE;
}
{STRING} {
    // String literal
    yylval = std::make_shared<VskAst>(AST_STRING, yytext);
    return TK_STRING;
}
{IDENTIFIER} {
    // Identifier or keyword
    int token = vsk_token_from_text(yytext);
    if (token == TK_IDENTIFIER)
        yylval = std::make_shared<VskAst>(AST_IDENTIFIER, yytext);
    else
        yylval = std::make_shared<VskAst>(AST_KEYWORD, yytext);
    return token;
}
{DIGITS} {
    // Digits only
    yylval = std::make_shared<VskAst>(AST_NUMBER, yytext);
    return TK_DIGITS;
}
{NUMERIC} {
    // Numeric
    yylval = std::make_shared<VskAst>(AST_NUMBER, yytext);
    return TK_NUMERIC;
}

"[" { return TK_L_BRACKET; }
"]" { return TK_R_BRACKET; }
"{" { return TK_L_BRACE; }
"}" { return TK_R_BRACE; }
"(" { return TK_L_PAREN; }
")" { return TK_R_PAREN; }
"+" { return TK_PLUS; }
"-" { return TK_MINUS; }
"*" { return TK_ASTERISK; }
"/" { return TK_SLASH; }
"^" { return TK_HAT; }
"#" { return TK_SHARP; }
"$" { return TK_DOLLAR; }
"%" { return TK_PERCENT; }
"~" { return TK_TILDA; }
"|" { return TK_VBAR; }
"\\" { return TK_BACKSLASH; }
";" { return TK_SEMICOLON; }
":" { return TK_COLON; }
"," { return TK_COMMA; }
"?" { return TK_QUESTION; }
"_" { return TK_UNDERLINE; }
"=" { return TK_EQUAL; }
"<>" { return TK_NE; }
"><" { return TK_NE; }
"<=" { return TK_LE; }
"=<" { return TK_LE; }
">=" { return TK_GE; }
"=>" { return TK_GE; }
"<" { return TK_LT; }
">" { return TK_GT; }
"." { return TK_PERIOD; }

[ \t] { }
