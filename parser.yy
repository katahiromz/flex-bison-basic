// VeySicK Parser by katahiromz
// Copyright (C) 2024 Katayama Hirofumi MZ <katayama.hirofumi.mz@gmail.com>
// License: MIT

%code top {
    #include "processor.h"
}

%define api.value.type {VskAstPtr}      // Node pointer
%parse-param {parse_result_t& result}   // Result

%token TK_ABS
%token TK_AKCNV_dollar
%token TK_ALLOC
%token TK_AND
%token TK_ASC
%token TK_ASTERISK
%token TK_ATN
%token TK_ATTR_dollar
%token TK_AUTO
%token TK_BACKSLASH
%token TK_BEEP
%token TK_BLOAD
%token TK_BSAVE
%token TK_CALL
%token TK_CDBL
%token TK_CHAIN
%token TK_CHDIR
%token TK_CHR_dollar
%token TK_CINT
%token TK_CIRCLE
%token TK_CLEAR
%token TK_CLOSE
%token TK_CLS
%token TK_CMD
%token TK_COLON
%token TK_COLOR
%token TK_COLOR_at
%token TK_COM
%token TK_COMMA
%token TK_COMMENT
%token TK_COMMON
%token TK_CONSOLE
%token TK_CONT
%token TK_COPY
%token TK_COS
%token TK_CSNG
%token TK_CSRLIN
%token TK_CVD
%token TK_CVI
%token TK_CVS
%token TK_DATA
%token TK_DATE_dollar
%token TK_DEF
%token TK_DEFDBL
%token TK_DEFINT
%token TK_DEFSNG
%token TK_DEFSTR
%token TK_DELETE
%token TK_DELIM
%token TK_DIM
%token TK_DIGITS
%token TK_DOLLAR
%token TK_DRAW
%token TK_DSKF
%token TK_DSKI_dollar
%token TK_DSKO_dollar
%token TK_EDIT
%token TK_ELSE
%token TK_END
%token TK_EOF
%token TK_EQUAL
%token TK_EQV
%token TK_ERASE
%token TK_ERL
%token TK_ERR
%token TK_ERROR
%token TK_EXP
%token TK_FIELD
%token TK_FILES
%token TK_FIX
%token TK_FN
%token TK_FOR
%token TK_FPOS
%token TK_FRE
%token TK_GE
%token TK_GET
%token TK_GET_at
%token TK_GO
%token TK_GOSUB
%token TK_GOTO
%token TK_GT
%token TK_HAT
%token TK_HELP
%token TK_HEX_dollar
%token TK_IDENTIFIER
%token TK_IEEE
%token TK_IF
%token TK_IFC
%token TK_IMP
%token TK_INKEY_dollar
%token TK_INP
%token TK_INPUT
%token TK_INPUT_dollar
%token TK_INSTR
%token TK_INT
%token TK_IRESET
%token TK_ISET
%token TK_JIS_dollar
%token TK_KACNV_dollar
%token TK_KANJI
%token TK_KEXT_dollar
%token TK_KEY
%token TK_KILL
%token TK_KINPUT
%token TK_KINSTR
%token TK_KLEN
%token TK_KMID_dollar
%token TK_KNJ_dollar
%token TK_KPLOAD
%token TK_KPOS
%token TK_KTYPE
%token TK_LE
%token TK_LEFT_dollar
%token TK_LEN
%token TK_LET
%token TK_LFILES
%token TK_LINE
%token TK_LIST
%token TK_LLIST
%token TK_LOAD
%token TK_LOAD_que
%token TK_LOC
%token TK_LOCATE
%token TK_LOF
%token TK_LOG
%token TK_LPOS
%token TK_LPRINT
%token TK_LSET
%token TK_LT
%token TK_L_BRACE
%token TK_L_BRACKET
%token TK_L_PAREN
%token TK_MAIL
%token TK_MAP
%token TK_MERGE
%token TK_MINUS
%token TK_MID_dollar
%token TK_MKD_dollar
%token TK_MKI_dollar
%token TK_MKS_dollar
%token TK_MOD
%token TK_MON
%token TK_MOTOR
%token TK_NAME
%token TK_NE
%token TK_NEW
%token TK_NEWLINE
%token TK_NEXT
%token TK_NOT
%token TK_NUMERIC
%token TK_OCT_dollar
%token TK_OFF
%token TK_ON
%token TK_OPEN
%token TK_OPTION
%token TK_OR
%token TK_OUT
%token TK_PAINT
%token TK_PEEK
%token TK_PEN
%token TK_PERCENT
%token TK_PERIOD
%token TK_PLAY
%token TK_PLUS
%token TK_POINT
%token TK_POKE
%token TK_POLL
%token TK_POS
%token TK_PRESET
%token TK_PRINT
%token TK_PSET
%token TK_PUT
%token TK_PUT_at
%token TK_QUESTION
%token TK_RANDOMIZE
%token TK_RBYTE
%token TK_READ
%token TK_REM
%token TK_RENUM
%token TK_RESTORE
%token TK_RESUME
%token TK_RETURN
%token TK_RIGHT_dollar
%token TK_RND
%token TK_ROLL
%token TK_RSET
%token TK_RUN
%token TK_R_BRACE
%token TK_R_BRACKET
%token TK_R_PAREN
%token TK_SAVE
%token TK_SCREEN
%token TK_SEARCH
%token TK_SEG
%token TK_SEMICOLON
%token TK_SET
%token TK_SGN
%token TK_SHARP
%token TK_SIN
%token TK_SLASH
%token TK_SPACE_dollar
%token TK_SPC
%token TK_SQR
%token TK_SRQ
%token TK_STATUS
%token TK_STEP
%token TK_STOP
%token TK_STRING
%token TK_STRING_dollar
%token TK_STR_dollar
%token TK_SUB
%token TK_SWAP
%token TK_TAB
%token TK_TAN
%token TK_TERM
%token TK_THEN
%token TK_TILDA
%token TK_TIMEOUT
%token TK_TIME_dollar
%token TK_TO
%token TK_TROFF
%token TK_TRON
%token TK_UNDERLINE
%token TK_USING
%token TK_USR
%token TK_VAL
%token TK_VARPTR
%token TK_VBAR
%token TK_VIEW
%token TK_WAIT
%token TK_WBYTE
%token TK_WEND
%token TK_WHILE
%token TK_WIDTH
%token TK_WINDOW
%token TK_WRITE
%token TK_XOR

%start translation_unit

%%

// Grammar rules

file_number
    : TK_SHARP TK_DIGITS                { $$ = vsk_ast(AST_FILE_NUMBER, "#FILE", { $2 }); }
    | TK_SHARP TK_IDENTIFIER            { $$ = vsk_ast(AST_FILE_NUMBER, "#FILE", { $2 }); }
    ;

primary_expression
    : TK_IDENTIFIER                     { $$ = $1; }
    | TK_NUMERIC                        { $$ = $1; }
    | TK_DIGITS                         { $$ = $1; }
    | TK_STRING                         { $$ = $1; }
    | file_number                       { $$ = $1; }
    | TK_L_PAREN expression TK_R_PAREN  { $$ = $2; }
    | TK_IDENTIFIER TK_L_PAREN   TK_R_PAREN                  { $$ = vsk_ast(AST_ARRAY, $1->m_str); }
    | TK_IDENTIFIER TK_L_BRACKET TK_R_BRACKET                { $$ = vsk_ast(AST_ARRAY, $1->m_str); }
    | TK_IDENTIFIER TK_L_PAREN   parameter_list TK_R_PAREN   { $$ = vsk_ast(AST_ARRAY, $1->m_str); $$->data() = std::move($3->data()); }
    | TK_IDENTIFIER TK_L_BRACKET parameter_list TK_R_BRACKET { $$ = vsk_ast(AST_ARRAY, $1->m_str); $$->data() = std::move($3->data()); }
    | function_name                                          { $$ = vsk_ast(AST_FUNCTION, $1->m_str); }
    | function_name TK_L_PAREN TK_R_PAREN                    { $$ = vsk_ast(AST_FUNCTION, $1->m_str); }
    | function_name TK_L_PAREN parameter_list TK_R_PAREN     { $$ = vsk_ast(AST_FUNCTION, $1->m_str); $$->data() = std::move($3->data()); }
    ;

parameter_list
    : expression                         { $$ = vsk_ast(AST_OP, "()", { $1 }); }
    | parameter_list TK_COMMA expression { $$ = $1; $$->push_back($3); }
    ;

function_name
    : TK_ABS              { $$ = $1; }
    | TK_AKCNV_dollar     { $$ = $1; }
    | TK_ASC              { $$ = $1; }
    | TK_ATN              { $$ = $1; }
    | TK_ATTR_dollar      { $$ = $1; }
    | TK_CDBL             { $$ = $1; }
    | TK_CHR_dollar       { $$ = $1; }
    | TK_CINT             { $$ = $1; }
    | TK_COS              { $$ = $1; }
    | TK_CSNG             { $$ = $1; }
    | TK_CSRLIN           { $$ = $1; }
    | TK_CVD              { $$ = $1; }
    | TK_CVI              { $$ = $1; }
    | TK_CVS              { $$ = $1; }
    | TK_DATE_dollar      { $$ = $1; }
    | TK_DSKF             { $$ = $1; }
    | TK_DSKI_dollar      { $$ = $1; }
    | TK_EOF              { $$ = $1; }
    | TK_ERL              { $$ = $1; }
    | TK_ERR              { $$ = $1; }
    | TK_EXP              { $$ = $1; }
    | TK_FIX              { $$ = $1; }
    | TK_FN               { $$ = $1; }
    | TK_FPOS             { $$ = $1; }
    | TK_FRE              { $$ = $1; }
    | TK_HEX_dollar       { $$ = $1; }
    | TK_INKEY_dollar     { $$ = $1; }
    | TK_INP              { $$ = $1; }
    | TK_INPUT_dollar     { $$ = $1; }
    | TK_INSTR            { $$ = $1; }
    | TK_INT              { $$ = $1; }
    | TK_JIS_dollar       { $$ = $1; }
    | TK_KACNV_dollar     { $$ = $1; }
    | TK_KEXT_dollar      { $$ = $1; }
    | TK_KINSTR           { $$ = $1; }
    | TK_KLEN             { $$ = $1; }
    | TK_KMID_dollar      { $$ = $1; }
    | TK_KNJ_dollar       { $$ = $1; }
    | TK_KPOS             { $$ = $1; }
    | TK_KTYPE            { $$ = $1; }
    | TK_LEFT_dollar      { $$ = $1; }
    | TK_LEN              { $$ = $1; }
    | TK_LOC              { $$ = $1; }
    | TK_LOF              { $$ = $1; }
    | TK_LOG              { $$ = $1; }
    | TK_LPOS             { $$ = $1; }
    | TK_MAP              { $$ = $1; }
    | TK_MID_dollar       { $$ = $1; }
    | TK_MKD_dollar       { $$ = $1; }
    | TK_MKI_dollar       { $$ = $1; }
    | TK_MKS_dollar       { $$ = $1; }
    | TK_OCT_dollar       { $$ = $1; }
    | TK_PEEK             { $$ = $1; }
    | TK_PEN              { $$ = $1; }
    | TK_POINT            { $$ = $1; }
    | TK_POS              { $$ = $1; }
    | TK_RIGHT_dollar     { $$ = $1; }
    | TK_RND              { $$ = $1; }
    | TK_SEARCH           { $$ = $1; }
    | TK_SGN              { $$ = $1; }
    | TK_SIN              { $$ = $1; }
    | TK_SPACE_dollar     { $$ = $1; }
    | TK_SQR              { $$ = $1; }
    | TK_STRING_dollar    { $$ = $1; }
    | TK_STR_dollar       { $$ = $1; }
    | TK_TAN              { $$ = $1; }
    | TK_TIME_dollar      { $$ = $1; }
    | TK_USR              { $$ = $1; }
    | TK_VAL              { $$ = $1; }
    | TK_VARPTR           { $$ = $1; }
    | TK_VIEW             { $$ = $1; }
    | TK_WINDOW           { $$ = $1; }
    ;

exponential_expression
    : primary_expression                                 { $$ = $1; }
    | exponential_expression TK_HAT primary_expression   { $$ = vsk_ast(AST_OP, "^", { $1, $3 }); }

unary_expression
    : exponential_expression           { $$ = $1; }
    | TK_MINUS exponential_expression  { $$ = vsk_ast(AST_OP, "-", { $2 }); }
    ;

multiplicative_expression
    : unary_expression                                       { $$ = $1; }
    | multiplicative_expression TK_ASTERISK unary_expression { $$ = vsk_ast(AST_OP, "*", { $1, $3 }); }
    | multiplicative_expression TK_SLASH unary_expression    { $$ = vsk_ast(AST_OP, "/", { $1, $3 }); }
    ;

backslash_expression
    : multiplicative_expression                                     { $$ = $1; }
    | backslash_expression TK_BACKSLASH multiplicative_expression   { $$ = vsk_ast(AST_OP, "\\", { $1, $3 }); }
    ;

mod_expression
    : backslash_expression                             { $$ = $1; }
    | mod_expression TK_MOD backslash_expression       { $$ = vsk_ast(AST_OP, "MOD", { $1, $3 }); }
    ;

additive_expression
    : mod_expression                                 { $$ = $1; }
    | additive_expression TK_PLUS mod_expression     { $$ = vsk_ast(AST_OP, "+", { $1, $3 }); }
    | additive_expression TK_MINUS mod_expression    { $$ = vsk_ast(AST_OP, "-", { $1, $3 }); }
    ;

relational_expression
    : additive_expression                                   { $$ = $1; }
    | relational_expression TK_LT additive_expression       { $$ = vsk_ast(AST_OP, "<", { $1, $3 }); }
    | relational_expression TK_LE additive_expression       { $$ = vsk_ast(AST_OP, "<=", { $1, $3 }); }
    | relational_expression TK_GT additive_expression       { $$ = vsk_ast(AST_OP, ">", { $1, $3 }); }
    | relational_expression TK_GE additive_expression       { $$ = vsk_ast(AST_OP, ">=", { $1, $3 }); }
    | relational_expression TK_EQUAL additive_expression    { $$ = vsk_ast(AST_OP, "==", { $1, $3 }); }
    | relational_expression TK_NE additive_expression       { $$ = vsk_ast(AST_OP, "<>", { $1, $3 }); }
    ;

not_expression
    : relational_expression                      { $$ = $1; }
    | TK_NOT relational_expression               { $$ = vsk_ast(AST_OP, "NOT", { $2 });}
    ;

and_expression
    : not_expression                                    { $$ = $1; }
    | and_expression TK_AND not_expression              { $$ = vsk_ast(AST_OP, "AND", { $1, $3 }); }
    ;

or_expression
    : and_expression                                    { $$ = $1; }
    | or_expression TK_OR and_expression                { $$ = vsk_ast(AST_OP, "OR", { $1, $3 }); }
    ;

xor_expression
    : or_expression                                     { $$ = $1; }
    | xor_expression TK_XOR or_expression               { $$ = vsk_ast(AST_OP, "XOR", { $1, $3 }); }
    ;

imp_expression
    : xor_expression                                    { $$ = $1; }
    | imp_expression TK_IMP xor_expression              { $$ = vsk_ast(AST_OP, "IMP", { $1, $3 }); }
    ;

eqv_expression
    : imp_expression                                    { $$ = $1; }
    | eqv_expression TK_EQV imp_expression              { $$ = vsk_ast(AST_OP, "EQV", { $1, $3 }); }
    ;

expression
    : eqv_expression                                    { $$ = $1; }
    ;

primary_statement
    : TK_COMMENT { $$ = $1; }
    | TK_LET TK_IDENTIFIER TK_EQUAL expression          { $$ = vsk_ast(AST_STMT, "LET", { $2, $4 }); }
    |        TK_IDENTIFIER TK_EQUAL expression          { $$ = vsk_ast(AST_STMT, "LET", { $1, $3 }); }
    | print file_number TK_COMMA TK_USING expression TK_SEMICOLON printing_list
    {
        $$ = vsk_ast(AST_STMT, "PRINT#-USING", { $2, $5, $7 });
    }
    | print file_number TK_COMMA printing_list
    {
        $$ = vsk_ast(AST_STMT, "PRINT#", { $2, $4 });
    }
    | print TK_USING expression TK_SEMICOLON printing_list
    {
        $$ = vsk_ast(AST_STMT, "PRINT-USING", { $3, $5 });
    }
    | TK_LPRINT TK_USING expression TK_SEMICOLON printing_list
    {
        $$ = vsk_ast(AST_STMT, "PRINT-USING", { $3, $5 });
    }
    | print printing_list
    {
        $$ = vsk_ast(AST_STMT, "PRINT", { $2 });
    }
    | TK_LPRINT printing_list
    {
        $$ = vsk_ast(AST_STMT, "LPRINT", { $2 });
    }
    | TK_ASTERISK TK_IDENTIFIER
    {
        $$ = vsk_ast(AST_STMT, "LABEL", { $2 });
    }
    | TK_FOR TK_IDENTIFIER TK_EQUAL expression TK_TO expression TK_STEP expression
    {
        $$ = vsk_ast(AST_STMT, "FOR-STEP", { $2, $4, $6, $8 });
    }
    | TK_FOR TK_IDENTIFIER TK_EQUAL expression TK_TO expression
    {
        $$ = vsk_ast(AST_STMT, "FOR", { $2, $4, $6 });
    }
    | TK_OPEN expression TK_FOR TK_IDENTIFIER TK_IDENTIFIER expression
    {
        $$ = vsk_ast(AST_STMT, "OPEN", { $2, $4, $6 });
    }
    | TK_OPEN expression TK_IDENTIFIER expression
    {
        $$ = vsk_ast(AST_STMT, "OPEN", { $2, vsk_ast(AST_IDENTIFIER, ""), $4 });
    }
    | TK_LINE TK_INPUT expression TK_SEMICOLON TK_IDENTIFIER
    {
        $$ = vsk_ast(AST_STMT, "LINE-INPUT", { $3, $5 });
    }
    | TK_LINE TK_INPUT TK_IDENTIFIER
    {
        $$ = vsk_ast(AST_STMT, "LINE-INPUT", { $3 });
    }
    | TK_LINE TK_INPUT file_number TK_COMMA TK_IDENTIFIER
    {
        $$ = vsk_ast(AST_STMT, "LINE-INPUT#", { $3, $5 });
    }
    | TK_DIM TK_IDENTIFIER TK_L_PAREN parameter_list TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "DIM", { $2, $4 });
    }
    | TK_DEF TK_SEG TK_EQUAL expression           { $$ = vsk_ast(AST_STMT, "DEF-SEG", { $4 }); }
    | TK_DEF TK_USR TK_EQUAL expression           { $$ = vsk_ast(AST_STMT, "DEF-USR", { $2, $4 }); }
    | lead_statement_name parameter_list          { $$ = $1; $$->data().insert($$->data().end(), $2->data().begin(), $2->data().end()); }
    | lead_statement_name                         { $$ = $1; }
    | TK_LSET TK_IDENTIFIER TK_EQUAL expression   { $$ = vsk_ast(AST_STMT, "LSET", { $2, $4 }); }
    | TK_RSET TK_IDENTIFIER TK_EQUAL expression   { $$ = vsk_ast(AST_STMT, "LSET", { $2, $4 }); }
    | TK_TIME_dollar TK_EQUAL expression          { $$ = vsk_ast(AST_STMT, "TIME$", { $3 }); }
    | TK_DATE_dollar TK_EQUAL expression          { $$ = vsk_ast(AST_STMT, "DATE$", { $3 }); }
    | TK_DELETE line_range                        { $$ = vsk_ast(AST_STMT, "DELETE", { $2 });}
    | TK_CHAIN TK_MERGE expression TK_COMMA line_number TK_COMMA TK_IDENTIFIER TK_COMMA TK_DELETE line_range
    {
        $$ = vsk_ast(AST_STMT, "CHAIN-MERGE-ALL-DELETE", { $3, $5, $10 });
    }
    | TK_CHAIN TK_MERGE expression TK_COMMA line_number TK_COMMA TK_IDENTIFIER
    {
        $$ = vsk_ast(AST_STMT, "CHAIN-MERGE-ALL", { $3, $5 });
    }
    | TK_CHAIN TK_MERGE expression TK_COMMA line_number TK_COMMA TK_DELETE line_range
    {
        $$ = vsk_ast(AST_STMT, "CHAIN-MERGE-DELETE", { $3, $5 });
    }
    | TK_CHAIN TK_MERGE expression TK_COMMA line_number
    {
        $$ = vsk_ast(AST_STMT, "CHAIN-MERGE", { $3, $5 });
    }
    | TK_CHAIN TK_MERGE expression
    {
        $$ = vsk_ast(AST_STMT, "CHAIN-MERGE", { $3 });
    }
    | TK_CHAIN expression TK_COMMA line_number TK_COMMA TK_IDENTIFIER TK_COMMA TK_DELETE line_range
    {
        $$ = vsk_ast(AST_STMT, "CHAIN-ALL-DELETE", { $2, $4, $9 });
    }
    | TK_CHAIN expression TK_COMMA line_number TK_COMMA TK_IDENTIFIER
    {
        $$ = vsk_ast(AST_STMT, "CHAIN-ALL", { $2, $4 });
    }
    | TK_CHAIN expression TK_COMMA line_number TK_COMMA TK_DELETE line_range
    {
        $$ = vsk_ast(AST_STMT, "CHAIN-DELETE", { $2, $4 });
    }
    | TK_CHAIN expression TK_COMMA line_number
    {
        $$ = vsk_ast(AST_STMT, "CHAIN", { $2, $4 });
    }
    | TK_CHAIN expression
    {
        $$ = vsk_ast(AST_STMT, "CHAIN", { $2 });
    }
    ;

print
    : TK_PRINT              { $$ = $1; }
    | TK_QUESTION           { $$ = $1; }
    ;

printing_list
    : printing_expression                { $$ = vsk_ast(AST_OP, "PRINTING", { $1 }); }
    | printing_list TK_COMMA             { $$ = $1; $$->push_back($2); }
    | printing_list TK_SEMICOLON         { $$ = $1; $$->push_back($2); }
    | printing_list printing_expression  { $$ = $1; $$->push_back($2); }
    ;

go_to
    : TK_GOTO               { $$ = $1; }
    | TK_GO TK_TO           { $$ = $2; }
    ;

go_sub
    : TK_GOSUB              { $$ = $1; }
    | TK_GO TK_SUB          { $$ = $2; }
    ;

printing_expression
    : expression                                { $$ = $1; }
    | TK_SPC TK_L_PAREN expression TK_R_PAREN   { $$ = vsk_ast(AST_FUNCTION, "SPC", { $2 });}
    | TK_TAB TK_L_PAREN expression TK_R_PAREN   { $$ = vsk_ast(AST_FUNCTION, "TAB", { $2 });}
    ;

lead_statement_name
    : TK_AUTO                                           { $$ = vsk_ast(AST_STMT, "AUTO"); }
    | TK_BEEP                                           { $$ = vsk_ast(AST_STMT, "BEEP"); }
    | TK_BLOAD                                          { $$ = vsk_ast(AST_STMT, "BLOAD"); }
    | TK_BSAVE                                          { $$ = vsk_ast(AST_STMT, "BSAVE"); }
    | TK_CALL                                           { $$ = vsk_ast(AST_STMT, "CALL"); }
    | TK_CHDIR                                          { $$ = vsk_ast(AST_STMT, "CHDIR"); }
    | TK_CLEAR                                          { $$ = vsk_ast(AST_STMT, "CLEAR"); }
    | TK_CLOSE                                          { $$ = vsk_ast(AST_STMT, "CLOSE"); }
    | TK_CLS                                            { $$ = vsk_ast(AST_STMT, "CLS"); }
    | TK_CMD TK_CLS                                     { $$ = vsk_ast(AST_STMT, "CMD-CLS"); }
    | TK_CMD TK_IDENTIFIER                              { $$ = vsk_ast(AST_STMT, "CMD-IDENT"); }
    | TK_CMD TK_IDENTIFIER TK_COPY                      { $$ = vsk_ast(AST_STMT, "CMD-IDENT-COPY"); }
    | TK_CMD TK_IDENTIFIER TK_IDENTIFIER                { $$ = vsk_ast(AST_STMT, "CMD-IDENT-IDENT"); }
    | TK_CMD TK_IDENTIFIER TK_OFF                       { $$ = vsk_ast(AST_STMT, "CMD-IDENT-OFF"); }
    | TK_CMD TK_IDENTIFIER TK_ON                        { $$ = vsk_ast(AST_STMT, "CMD-IDENT-ON"); }
    | TK_CMD TK_PLAY                                    { $$ = vsk_ast(AST_STMT, "CMD-PLAY"); }
    | TK_COLOR                                          { $$ = vsk_ast(AST_STMT, "COLOR"); }
    | TK_COM TK_OFF                                     { $$ = vsk_ast(AST_STMT, "COM-OFF"); }
    | TK_COM TK_ON                                      { $$ = vsk_ast(AST_STMT, "COM-ON"); }
    | TK_COM TK_STOP                                    { $$ = vsk_ast(AST_STMT, "COM-STOP"); }
    | TK_COMMON                                         { $$ = vsk_ast(AST_STMT, "COMMON"); }
    | TK_CONSOLE                                        { $$ = vsk_ast(AST_STMT, "CONSOLE"); }
    | TK_CONT                                           { $$ = vsk_ast(AST_STMT, "CONT"); }
    | TK_COPY                                           { $$ = vsk_ast(AST_STMT, "COPY"); }
    | TK_DATA                                           { $$ = vsk_ast(AST_STMT, "DATA"); }
    | TK_DEFDBL                                         { $$ = vsk_ast(AST_STMT, "DEFDBL"); }
    | TK_DEFINT                                         { $$ = vsk_ast(AST_STMT, "DEFINT"); }
    | TK_DEFSNG                                         { $$ = vsk_ast(AST_STMT, "DEFSNG"); }
    | TK_DEFSTR                                         { $$ = vsk_ast(AST_STMT, "DEFSTR"); }
    | TK_DRAW                                           { $$ = vsk_ast(AST_STMT, "DRAW"); }
    | TK_DSKO_dollar                                    { $$ = vsk_ast(AST_STMT, "DSKO$"); }
    | TK_EDIT                                           { $$ = vsk_ast(AST_STMT, "EDIT"); }
    | TK_END                                            { $$ = vsk_ast(AST_STMT, "END"); }
    | TK_ERASE                                          { $$ = vsk_ast(AST_STMT, "ERASE"); }
    | TK_ERROR                                          { $$ = vsk_ast(AST_STMT, "ERROR"); }
    | TK_FIELD                                          { $$ = vsk_ast(AST_STMT, "FIELD"); }
    | TK_FILES                                          { $$ = vsk_ast(AST_STMT, "FILES"); }
    | TK_GET expression                                 { $$ = vsk_ast(AST_STMT, "GET#", { $2 });}
    | go_sub                                            { $$ = vsk_ast(AST_STMT, "GOSUB"); }
    | go_to                                             { $$ = vsk_ast(AST_STMT, "GOTO"); }
    | TK_HELP TK_OFF                                    { $$ = vsk_ast(AST_STMT, "HELP-OFF"); }
    | TK_HELP TK_ON                                     { $$ = vsk_ast(AST_STMT, "HELP-ON"); }
    | TK_HELP TK_STOP                                   { $$ = vsk_ast(AST_STMT, "HELP-STOP"); }
    | TK_INPUT file_number                              { $$ = vsk_ast(AST_STMT, "INPUT#", { $2 });}
    | TK_INPUT expression TK_SEMICOLON expression       { $$ = vsk_ast(AST_STMT, "INPUT;", { $2, $4 }); }
    | TK_INPUT expression TK_COMMA expression           { $$ = vsk_ast(AST_STMT, "INPUT", { $2, $4 }); }
    | TK_INPUT TK_WAIT                                  { $$ = vsk_ast(AST_STMT, "INPUT-WAIT"); }
    | TK_KANJI                                          { $$ = vsk_ast(AST_STMT, "KANJI"); }
    | TK_KEY                                            { $$ = vsk_ast(AST_STMT, "KEY"); }
    | TK_KEY TK_LIST                                    { $$ = vsk_ast(AST_STMT, "KEY-LIST"); }
    | TK_KEY TK_OFF                                     { $$ = vsk_ast(AST_STMT, "KEY-OFF"); }
    | TK_KEY TK_ON                                      { $$ = vsk_ast(AST_STMT, "KEY-ON"); }
    | TK_KEY TK_STOP                                    { $$ = vsk_ast(AST_STMT, "KEY-STOP"); }
    | TK_KILL                                           { $$ = vsk_ast(AST_STMT, "KILL"); }
    | TK_KINPUT                                         { $$ = vsk_ast(AST_STMT, "KINPUT"); }
    | TK_KPLOAD                                         { $$ = vsk_ast(AST_STMT, "KPLOAD"); }
    | TK_LFILES                                         { $$ = vsk_ast(AST_STMT, "LFILES"); }
    | TK_LIST line_range                                { $$ = vsk_ast(AST_STMT, "LIST", { $2 });}
    | TK_LIST                                           { $$ = vsk_ast(AST_STMT, "LIST"); }
    | TK_LLIST line_range                               { $$ = vsk_ast(AST_STMT, "LLIST", { $2 });}
    | TK_LLIST                                          { $$ = vsk_ast(AST_STMT, "LLIST"); }
    | TK_LOAD                                           { $$ = vsk_ast(AST_STMT, "LOAD"); }
    | TK_LOAD TK_QUESTION                               { $$ = vsk_ast(AST_STMT, "LOAD?"); }
    | TK_LOAD_que                                       { $$ = vsk_ast(AST_STMT, "LOAD?"); }
    | TK_LOCATE                                         { $$ = vsk_ast(AST_STMT, "LOCATE"); }
    | TK_LPRINT                                         { $$ = vsk_ast(AST_STMT, "LPRINT"); }
    | TK_MERGE                                          { $$ = vsk_ast(AST_STMT, "MERGE"); }
    | TK_MON                                            { $$ = vsk_ast(AST_STMT, "MON"); }
    | TK_MOTOR                                          { $$ = vsk_ast(AST_STMT, "MOTOR"); }
    | TK_NAME                                           { $$ = vsk_ast(AST_STMT, "NAME"); }
    | TK_NEW                                            { $$ = vsk_ast(AST_STMT, "NEW"); }
    | TK_NEW TK_CMD                                     { $$ = vsk_ast(AST_STMT, "NEW-CMD"); }
    | TK_NEW TK_ON                                      { $$ = vsk_ast(AST_STMT, "NEW-ON"); }
    | TK_NEXT                                           { $$ = vsk_ast(AST_STMT, "NEXT"); }
    | TK_ON TK_COM go_sub                               { $$ = vsk_ast(AST_STMT, "ON-COM-GOSUB"); }
    | TK_ON TK_ERROR go_to                              { $$ = vsk_ast(AST_STMT, "ON-ERROR-GOTO"); }
    | TK_ON expression go_to                            { $$ = vsk_ast(AST_STMT, "ON-EXPR-GOTO", { $2 });}
    | TK_ON expression go_sub                           { $$ = vsk_ast(AST_STMT, "ON-EXPR-GOSUB", { $2 });}
    | TK_ON TK_HELP go_sub                              { $$ = vsk_ast(AST_STMT, "ON-HELP-GOSUB"); }
    | TK_ON TK_KEY go_sub                               { $$ = vsk_ast(AST_STMT, "ON-KEY-GOSUB"); }
    | TK_ON TK_PEN go_sub                               { $$ = vsk_ast(AST_STMT, "ON-PEN-GOSUB"); }
    | TK_ON TK_PLAY go_sub                              { $$ = vsk_ast(AST_STMT, "ON-PLAY-GOSUB"); }
    | TK_ON TK_STOP go_sub                              { $$ = vsk_ast(AST_STMT, "ON-STOP-GOSUB"); }
    | TK_ON TK_TIME_dollar go_sub                       { $$ = vsk_ast(AST_STMT, "ON-TIME$-GOSUB"); }
    | TK_OPTION TK_IDENTIFIER                           { $$ = vsk_ast(AST_STMT, "OPTION-BASE"); }
    | TK_OUT                                            { $$ = vsk_ast(AST_STMT, "OUT"); }
    | TK_PEN TK_OFF                                     { $$ = vsk_ast(AST_STMT, "PEN-OFF"); }
    | TK_PEN TK_ON                                      { $$ = vsk_ast(AST_STMT, "PEN-ON"); }
    | TK_PEN TK_STOP                                    { $$ = vsk_ast(AST_STMT, "PEN-STOP"); }
    | TK_PLAY                                           { $$ = vsk_ast(AST_STMT, "PLAY"); }
    | TK_PLAY TK_ALLOC                                  { $$ = vsk_ast(AST_STMT, "PLAY-ALLOC"); }
    | TK_PLAY TK_OFF                                    { $$ = vsk_ast(AST_STMT, "PLAY-OFF"); }
    | TK_PLAY TK_ON                                     { $$ = vsk_ast(AST_STMT, "PLAY-ON"); }
    | TK_PLAY TK_STOP                                   { $$ = vsk_ast(AST_STMT, "PLAY-STOP"); }
    | TK_POKE                                           { $$ = vsk_ast(AST_STMT, "POKE"); }
    | TK_PUT expression                                 { $$ = vsk_ast(AST_STMT, "PUT#", { $2 });}
    | TK_RANDOMIZE                                      { $$ = vsk_ast(AST_STMT, "RANDOMIZE"); }
    | TK_RESUME TK_NEXT                                 { $$ = vsk_ast(AST_STMT, "RESUME", { $2 });}
    | TK_RESUME line_number                             { $$ = vsk_ast(AST_STMT, "RESUME", { $2 });}
    | TK_RETURN                                         { $$ = vsk_ast(AST_STMT, "RETURN"); }
    | TK_RUN                                            { $$ = vsk_ast(AST_STMT, "RUN"); }
    | TK_READ                                           { $$ = vsk_ast(AST_STMT, "READ"); }
    | TK_RENUM                                          { $$ = vsk_ast(AST_STMT, "RENUM"); }
    | TK_RESTORE                                        { $$ = vsk_ast(AST_STMT, "RESTORE"); }
    | TK_ROLL                                           { $$ = vsk_ast(AST_STMT, "ROLL"); }
    | TK_SAVE                                           { $$ = vsk_ast(AST_STMT, "SAVE"); }
    | TK_SCREEN                                         { $$ = vsk_ast(AST_STMT, "SCREEN"); }
    | TK_SET                                            { $$ = vsk_ast(AST_STMT, "SET"); }
    | TK_STOP                                           { $$ = vsk_ast(AST_STMT, "STOP"); }
    | TK_STOP TK_OFF                                    { $$ = vsk_ast(AST_STMT, "STOP-OFF"); }
    | TK_STOP TK_ON                                     { $$ = vsk_ast(AST_STMT, "STOP-ON"); }
    | TK_STOP TK_STOP                                   { $$ = vsk_ast(AST_STMT, "STOP-STOP"); }
    | TK_SWAP                                           { $$ = vsk_ast(AST_STMT, "SWAP"); }
    | TK_TERM                                           { $$ = vsk_ast(AST_STMT, "TERM"); }
    | TK_TIME_dollar TK_OFF                             { $$ = vsk_ast(AST_STMT, "TIME$-OFF"); }
    | TK_TIME_dollar TK_ON                              { $$ = vsk_ast(AST_STMT, "TIME$-ON"); }
    | TK_TIME_dollar TK_STOP                            { $$ = vsk_ast(AST_STMT, "TIME$-STOP"); }
    | TK_TROFF                                          { $$ = vsk_ast(AST_STMT, "TROFF"); }
    | TK_TRON                                           { $$ = vsk_ast(AST_STMT, "TRON"); }
    | TK_WAIT                                           { $$ = vsk_ast(AST_STMT, "WAIT"); }
    | TK_WEND                                           { $$ = vsk_ast(AST_STMT, "WEND"); }
    | TK_WHILE                                          { $$ = vsk_ast(AST_STMT, "WHILE"); }
    | TK_WIDTH                                          { $$ = vsk_ast(AST_STMT, "WIDTH"); }
    | TK_WIDTH TK_LPRINT                                { $$ = vsk_ast(AST_STMT, "WIDTH-LPRINT"); }
    | TK_WRITE file_number                              { $$ = vsk_ast(AST_STMT, "WRITE#", { $2 });}
    | TK_WRITE                                          { $$ = vsk_ast(AST_STMT, "WRITE"); }
    | TK_GET TK_L_PAREN expression TK_COMMA expression TK_R_PAREN TK_MINUS TK_STEP TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "GET@-STEP", { $3, $5, $10, $12 });
    }
    | TK_GET TK_L_PAREN expression TK_COMMA expression TK_R_PAREN TK_MINUS         TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "GET@", { $3, $5, $9, $11 });
    }
    | TK_GET_at TK_L_PAREN expression TK_COMMA expression TK_R_PAREN TK_MINUS TK_STEP TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "GET@-STEP", { $3, $5, $10, $12 });
    }
    | TK_GET_at TK_L_PAREN expression TK_COMMA expression TK_R_PAREN TK_MINUS         TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "GET@", { $3, $5, $9, $11 });
    }
    | TK_LINE TK_L_PAREN expression TK_COMMA expression TK_R_PAREN TK_MINUS TK_STEP TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "LINE-STEP", { $3, $5, $10, $12 });
    }
    | TK_LINE TK_L_PAREN expression TK_COMMA expression TK_R_PAREN TK_MINUS TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "LINE", { $3, $5, $9, $11 });
    }
    | TK_CIRCLE TK_L_PAREN expression TK_COMMA expression TK_R_PAREN expression
    {
        $$ = vsk_ast(AST_STMT, "CIRCLE", { $3, $5, $7 });
    }
    | TK_COLOR_at TK_L_PAREN expression TK_COMMA expression TK_R_PAREN TK_MINUS
                  TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "COLOR@", { $3, $5, $9, $11 });
    }
    | TK_DEF TK_FN TK_EQUAL expression
    {
        $$ = vsk_ast(AST_STMT, "FN", { $2, vsk_ast(AST_OP, "()"), $4 });
    }
    | TK_DEF TK_FN TK_L_PAREN TK_R_PAREN TK_EQUAL expression
    {
        $$ = vsk_ast(AST_STMT, "FN", { $2, vsk_ast(AST_OP, "()"), $6 });
    }
    | TK_DEF TK_FN TK_L_PAREN parameter_list TK_R_PAREN TK_EQUAL expression
    {
        $$ = vsk_ast(AST_STMT, "FN", { $2, $4, $7 });
    }
    | TK_MID_dollar TK_L_PAREN TK_IDENTIFIER TK_COMMA expression TK_COMMA expression TK_R_PAREN TK_EQUAL expression
    {
        $$ = vsk_ast(AST_STMT, "MID$", { $3, $5, $7, $10 });
    }
    | TK_MID_dollar TK_L_PAREN TK_IDENTIFIER TK_COMMA expression TK_R_PAREN TK_EQUAL expression
    {
        $$ = vsk_ast(AST_STMT, "MID$", { $3, $5, $8 });
    }
    | TK_PAINT TK_STEP TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "PAINT-STEP", { $4, $6 });
    }
    | TK_PAINT         TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "PAINT", { $3, $5 });
    }
    | TK_POINT TK_STEP TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "POINT-STEP", { $4, $6 });
    }
    | TK_POINT         TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "POINT", { $3, $5 });
    }
    | TK_PSET         TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "PSET", { $3, $5 });
    }
    | TK_PSET TK_STEP TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "PSET-STEP", { $4, $6 });
    }
    | TK_PRESET TK_STEP TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "PRESET-STEP", { $4, $6 });
    }
    | TK_PRESET         TK_L_PAREN expression TK_COMMA expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "PRESET", { $3, $5 });
    }
    | TK_PUT TK_L_PAREN expression TK_COMMA expression TK_R_PAREN TK_COMMA expression
    {
        $$ = vsk_ast(AST_STMT, "PUT@", { $3, $5, $8 });
    }
    | TK_PUT TK_L_PAREN expression TK_COMMA expression TK_R_PAREN TK_COMMA TK_KANJI TK_L_PAREN expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "PUT@-KANJI", { $3, $5, $10 });
    }
    | TK_PUT_at TK_L_PAREN expression TK_COMMA expression TK_R_PAREN TK_COMMA expression
    {
        $$ = vsk_ast(AST_STMT, "PUT@", { $3, $5, $8 });
    }
    | TK_PUT_at TK_L_PAREN expression TK_COMMA expression TK_R_PAREN TK_COMMA TK_KANJI TK_L_PAREN expression TK_R_PAREN
    {
        $$ = vsk_ast(AST_STMT, "PUT@-KANJI", { $3, $5, $10 });
    }
    | TK_VIEW TK_L_PAREN expression TK_COMMA expression TK_R_PAREN TK_MINUS TK_L_PAREN expression TK_COMMA expression
    {
        $$ = vsk_ast(AST_STMT, "VIEW", { $3, $5, $9, $11 });
    }
    | TK_WINDOW TK_L_PAREN expression TK_COMMA expression TK_R_PAREN TK_MINUS TK_L_PAREN expression TK_COMMA expression
    {
        $$ = vsk_ast(AST_STMT, "WINDOW", { $3, $5, $9, $11 });
    }
    ;

matched_statement
    : TK_IF expression TK_THEN matched_statement TK_ELSE matched_statement  { $$ = vsk_ast(AST_STMT, "IF", { $2, $4, $6 }); }
    | TK_IF expression go_to line_number TK_ELSE matched_statement          { $$ = vsk_ast(AST_STMT, "IF", { $2, vsk_ast(AST_STMT, "GOTO", { $4 }), $6 }); }
    | matched_statement TK_COLON primary_statement {
        if ($1->is_multi_stmt()) {
            $$ = $1;
            $$->push_back($3);
        } else {
            $$ = vsk_ast(AST_MULTI_STMT, ":", { $1, $3 });
        }
    }
    | primary_statement { $$ = $1; }
    ;

unmatched_statement
    : TK_IF expression TK_THEN statement                                     { $$ = vsk_ast(AST_STMT, "IF", { $2, $4 }); }
    | TK_IF expression go_to line_number                                     { $$ = vsk_ast(AST_STMT, "IF", { $2, vsk_ast(AST_STMT, "GOTO", { $4 }) }); }
    | TK_IF expression TK_THEN matched_statement TK_ELSE unmatched_statement { $$ = vsk_ast(AST_STMT, "IF", { $2, $4, $6 }); }
    ;

line_number
    : TK_DIGITS                 { $$ = vsk_ast(AST_LINE_NUMBER, "DIGITS", { $1 }); }
    | TK_PERIOD                 { $$ = vsk_ast(AST_LINE_NUMBER, ".", { $1 }); }
    | TK_ASTERISK TK_IDENTIFIER { $$ = vsk_ast(AST_LINE_NUMBER, "LABEL", { $2 });}
    ;

line_range
    : line_number TK_MINUS line_number { $$ = vsk_ast(AST_LINE_RANGE, "LINE", { $1, $3 }); }
    | line_number TK_MINUS             { $$ = vsk_ast(AST_LINE_RANGE, "LINE", { $1, nullptr }); }
    |             TK_MINUS line_number { $$ = vsk_ast(AST_LINE_RANGE, "LINE", { nullptr, $2 });}
    | line_number                      { $$ = vsk_ast(AST_LINE_RANGE, "LINE", { $1, $1 }); }
    ;

statement
    : matched_statement    { if ($1->is_multi_stmt()) $$ = $1; else $$ = vsk_ast(AST_MULTI_STMT, ":", { $1 }); }
    | unmatched_statement  { if ($1->is_multi_stmt()) $$ = $1; else $$ = vsk_ast(AST_MULTI_STMT, ":", { $1 }); }
    ;

line
    : TK_DIGITS statement            { $$ = $2; $$->m_lineno = atoi($1->m_str.c_str()); }
    | TK_DIGITS statement TK_COMMENT { $$ = $2; $$->m_lineno = atoi($1->m_str.c_str()); $$->push_back($3); }
    | statement                      { $$ = $1; }
    | statement TK_COMMENT           { $$ = $1; $$->push_back($2); }
    ;

translation_unit
    : line                             { $$ = vsk_ast(AST_LINES, "LINES"); $$->push_back($1); result = $$; }
    | translation_unit TK_NEWLINE line { $$ = $1; $$->push_back($3); result = $$; }
    | translation_unit TK_NEWLINE      { $$ = $1;                    result = $$; }
    ;
