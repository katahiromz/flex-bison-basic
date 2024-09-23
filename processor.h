#pragma once

#include <memory>
#include <string>
#include <vector>
#include <map>
#include <cstdio>
#include <cassert>

enum AST_TYPE
{
#define DEFINE_AST_TYPE(type) type,
#include "ast_type.h"
#undef DEFINE_AST_TYPE
};

static const  std::map<AST_TYPE, const char *> c_ast_type_strings =
{
#define DEFINE_AST_TYPE(type) { type, #type },
#include "ast_type.h"
#undef DEFINE_AST_TYPE
};

struct VskAst;
typedef std::shared_ptr<VskAst> VskAstPtr;

struct VskAst
{
    AST_TYPE m_type = AST_NONE;
    std::string m_str;
    std::vector<VskAstPtr> m_children;
    unsigned int m_lineno = -1;

    VskAst(AST_TYPE type, const std::string& str)
        : m_type(type)
        , m_str(str)
    {
    }

    VskAst(AST_TYPE type, const std::string& str, std::initializer_list<VskAstPtr> children)
        : m_type(type)
        , m_str(str)
        , m_children(children)
    {
    }

    void print()
    {
        auto it = c_ast_type_strings.find(m_type);
        if (it != c_ast_type_strings.end())
        {
            printf("%s('%s'", it->second, m_str.c_str());
        }
        else
        {
            assert(0);
            printf("%s('%s'", "(invalid)", m_str.c_str());
        }

        for (auto& child : m_children)
        {
            printf(", ");
            child->print();
        }
        printf(")");
    }

    // is it multi-statement?
    bool is_multi_stmt() const { return m_type == AST_MULTI_STMT; }

    void push_back(VskAstPtr ptr) { m_children.push_back(ptr); }
    size_t size() const { return m_children.size(); }

    VskAstPtr& at(size_t index)
    {
        assert(index < size());
        return data().at(index);
    }
    const VskAstPtr& at(size_t index) const
    {
        assert(index < size());
        return data().at(index);
    }

          std::vector<VskAstPtr>& data()       { return m_children; }
    const std::vector<VskAstPtr>& data() const { return m_children; }
};

typedef VskAstPtr parse_result_t;

#include "parser.h"

inline VskAstPtr
vsk_ast(AST_TYPE type, const std::string& str)
{
    return std::make_shared<VskAst>(type, str);
}
inline VskAstPtr
vsk_ast(AST_TYPE type, const std::string& str, std::initializer_list<VskAstPtr> children)
{
    return std::make_shared<VskAst>(type, str, children);
}

int yylex(void);
void yyerror(parse_result_t& result, const char *s);
int vsk_token_from_text(const char *text);
