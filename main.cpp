#include <cstdio>
#include <string>
#include <map>
#include "processor.h"
#include "lexer.h"
#include "parser.h"

void yyerror(parse_result_t& result, const char *s)
{
    printf("ERROR: %s\n", s);
}

std::map<std::string, int> g_keyword_map =
{
    { "ABS", TK_ABS },
    { "AKCNV$", TK_AKCNV_dollar },
    { "ALLOC", TK_ALLOC },
    { "AND", TK_AND },
    { "ASC", TK_ASC },
    { "ATN", TK_ATN },
    { "ATTR$", TK_ATTR_dollar },
    { "AUTO", TK_AUTO },
    { "BEEP", TK_BEEP },
    { "BLOAD", TK_BLOAD },
    { "BSAVE", TK_BSAVE },
    { "CALL", TK_CALL },
    { "CDBL", TK_CDBL },
    { "CHAIN", TK_CHAIN },
    { "CHDIR", TK_CHDIR },
    { "CHR$", TK_CHR_dollar },
    { "CINT", TK_CINT },
    { "CIRCLE", TK_CIRCLE },
    { "CLEAR", TK_CLEAR },
    { "CLOSE", TK_CLOSE },
    { "CLS", TK_CLS },
    { "CMD", TK_CMD },
    { "COLOR", TK_COLOR },
    { "COLOR@", TK_COLOR_at },
    { "COM", TK_COM },
    { "COMMON", TK_COMMON },
    { "CONSOLE", TK_CONSOLE },
    { "CONT", TK_CONT },
    { "COPY", TK_COPY },
    { "COS", TK_COS },
    { "CSNG", TK_CSNG },
    { "CSRLIN", TK_CSRLIN },
    { "CVD", TK_CVD },
    { "CVI", TK_CVI },
    { "CVS", TK_CVS },
    { "DATA", TK_DATA },
    { "DATE$", TK_DATE_dollar },
    { "DEF", TK_DEF },
    { "DEFDBL", TK_DEFDBL },
    { "DEFINT", TK_DEFINT },
    { "DEFSNG", TK_DEFSNG },
    { "DEFSTR", TK_DEFSTR },
    { "DELETE", TK_DELETE },
    { "DELIM", TK_DELIM },
    { "DIM", TK_DIM },
    { "DRAW", TK_DRAW },
    { "DSKF", TK_DSKF },
    { "DSKI$", TK_DSKI_dollar },
    { "DSKO$", TK_DSKO_dollar },
    { "EDIT", TK_EDIT },
    { "ELSE", TK_ELSE },
    { "END", TK_END },
    { "EOF", TK_EOF },
    { "EQV", TK_EQV },
    { "ERASE", TK_ERASE },
    { "ERL", TK_ERL },
    { "ERR", TK_ERR },
    { "ERROR", TK_ERROR },
    { "EXP", TK_EXP },
    { "FIELD", TK_FIELD },
    { "FILES", TK_FILES },
    { "FIX", TK_FIX },
    //{ "FN...", TK_FN }, // special handling
    { "FOR", TK_FOR },
    { "FPOS", TK_FPOS },
    { "FRE", TK_FRE },
    { "GET", TK_GET },
    { "GET@", TK_GET_at },
    { "GO", TK_GO },
    { "GOSUB", TK_GOSUB },
    { "GOTO", TK_GOTO },
    { "HELP", TK_HELP },
    { "HEX$", TK_HEX_dollar },
    { "IEEE", TK_IEEE },
    { "IF", TK_IF },
    { "IFC", TK_IFC },
    { "IMP", TK_IMP },
    { "INKEY$", TK_INKEY_dollar },
    { "INP", TK_INP },
    { "INPUT", TK_INPUT },
    { "INPUT$", TK_INPUT_dollar },
    { "INSTR", TK_INSTR },
    { "INT", TK_INT },
    { "IRESET", TK_IRESET },
    { "ISET", TK_ISET },
    { "JIS$", TK_JIS_dollar },
    { "KACNV$", TK_KACNV_dollar },
    { "KANJI", TK_KANJI },
    { "KEXT$", TK_KEXT_dollar },
    { "KEY", TK_KEY },
    { "KILL", TK_KILL },
    { "KINPUT", TK_KINPUT },
    { "KINSTR", TK_KINSTR },
    { "KLEN", TK_KLEN },
    { "KMID$", TK_KMID_dollar },
    { "KNJ$", TK_KNJ_dollar },
    { "KPLOAD", TK_KPLOAD },
    { "KPOS", TK_KPOS },
    { "KTYPE", TK_KTYPE },
    { "LEFT$", TK_LEFT_dollar },
    { "LEN", TK_LEN },
    { "LET", TK_LET },
    { "LFILES", TK_LFILES },
    { "LINE", TK_LINE },
    { "LIST", TK_LIST },
    { "LLIST", TK_LLIST },
    { "LOAD", TK_LOAD },
    { "LOAD?", TK_LOAD_que },
    { "LOC", TK_LOC },
    { "LOCATE", TK_LOCATE },
    { "LOF", TK_LOF },
    { "LOG", TK_LOG },
    { "LPOS", TK_LPOS },
    { "LPRINT", TK_LPRINT },
    { "LSET", TK_LSET },
    { "MAIL", TK_MAIL },
    { "MAP", TK_MAP },
    { "MERGE", TK_MERGE },
    { "MID$", TK_MID_dollar },
    { "MKD$", TK_MKD_dollar },
    { "MKI$", TK_MKI_dollar },
    { "MKS$", TK_MKS_dollar },
    { "MOD", TK_MOD },
    { "MON", TK_MON },
    { "MOTOR", TK_MOTOR },
    { "NAME", TK_NAME },
    { "NEW", TK_NEW },
    { "NEXT", TK_NEXT },
    { "NOT", TK_NOT },
    { "OCT$", TK_OCT_dollar },
    { "OFF", TK_OFF },
    { "ON", TK_ON },
    { "OPEN", TK_OPEN },
    { "OPTION", TK_OPTION },
    { "OR", TK_OR },
    { "OUT", TK_OUT },
    { "PAINT", TK_PAINT },
    { "PEEK", TK_PEEK },
    { "PEN", TK_PEN },
    { "PLAY", TK_PLAY },
    { "POINT", TK_POINT },
    { "POKE", TK_POKE },
    { "POLL", TK_POLL },
    { "POS", TK_POS },
    { "PRESET", TK_PRESET },
    { "PRINT", TK_PRINT },
    { "PSET", TK_PSET },
    { "PUT", TK_PUT },
    { "PUT@", TK_PUT_at },
    { "RANDOMIZE", TK_RANDOMIZE },
    { "RBYTE", TK_RBYTE },
    { "READ", TK_READ },
    { "REM", TK_REM },
    { "RENUM", TK_RENUM },
    { "RESTORE", TK_RESTORE },
    { "RESUME", TK_RESUME },
    { "RETURN", TK_RETURN },
    { "RIGHT$", TK_RIGHT_dollar },
    { "RND", TK_RND },
    { "ROLL", TK_ROLL },
    { "RSET", TK_RSET },
    { "RUN", TK_RUN },
    { "SAVE", TK_SAVE },
    { "SCREEN", TK_SCREEN },
    { "SEARCH", TK_SEARCH },
    { "SEG", TK_SEG },
    { "SET", TK_SET },
    { "SGN", TK_SGN },
    { "SIN", TK_SIN },
    { "SPACE$", TK_SPACE_dollar },
    { "SPC", TK_SPC },
    { "SQR", TK_SQR },
    { "SRQ", TK_SRQ },
    { "STATUS", TK_STATUS },
    { "STEP", TK_STEP },
    { "STOP", TK_STOP },
    { "STR$", TK_STR_dollar },
    { "STRING$", TK_STRING_dollar },
    { "SUB", TK_SUB },
    { "SWAP", TK_SWAP },
    { "TAB", TK_TAB },
    { "TAN", TK_TAN },
    { "TERM", TK_TERM },
    { "THEN", TK_THEN },
    { "TIME$", TK_TIME_dollar },
    { "TIMEOUT", TK_TIMEOUT },
    { "TO", TK_TO },
    { "TROFF", TK_TROFF },
    { "TRON", TK_TRON },
    { "USING", TK_USING },
    //{ "USR...", TK_USR }, // special handling
    { "VAL", TK_VAL },
    { "VARPTR", TK_VARPTR },
    { "VIEW", TK_VIEW },
    { "WAIT", TK_WAIT },
    { "WBYTE", TK_WBYTE },
    { "WEND", TK_WEND },
    { "WHILE", TK_WHILE },
    { "WIDTH", TK_WIDTH },
    { "WINDOW", TK_WINDOW },
    { "WRITE", TK_WRITE },
    { "XOR", TK_XOR },
};

void vsk_upper(std::string& str)
{
    for (auto& ch : str)
    {
        if ('a' <= ch && ch <= 'z')
            ch += 'A' - 'a';
    }
}

int vsk_token_from_text(const char *text)
{
    std::string str = text;
    vsk_upper(str);

    if (str.find("FN") == 0)
        return TK_FN;

    if (str.find("USR") == 0)
        return TK_USR;

    auto it = g_keyword_map.find(str);
    return (it != g_keyword_map.end()) ? it->second : TK_IDENTIFIER;
}

int main(void)
{
    for (;;)
    {
        fflush(stdin);

        char line[256];
        if (!fgets(line, sizeof(line), stdin))
            continue;

        if (memcmp(line, "quit", 4) == 0)
            break;

        YY_BUFFER_STATE state = yy_scan_bytes(line, strcspn(line, "\n"));
        if (!state)
        {
            puts("!state");
            continue;
        }

        parse_result_t result;
        if (yyparse(result) == 0)
        {
            if (result)
            {
                result->print();
                puts("");
            }
            else
            {
                puts("result was null");
            }
        }
        else
        {
            printf("yyparse failed\n");
        }

        yy_delete_buffer(state);
    }

    return 0;
}
