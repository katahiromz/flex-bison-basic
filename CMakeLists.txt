cmake_minimum_required(VERSION 3.5)

project(flex-bison-basic VERSION 0.0 LANGUAGES CXX)

##############################################################################
## Flex + Bison

find_package(FLEX 2.6 REQUIRED)
find_package(BISON 3.0 REQUIRED)

set(PARSER_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(LEXER_OUT "${PARSER_DIR}/lexer.cpp")
set(PARSER_OUT "${PARSER_DIR}/parser.cpp")

set(ADDITIONAL_FLEX_FLAGS "")
set(ADDITIONAL_BISON_FLAGS "-d -v -Wall -t -r all")
#set(ADDITIONAL_BISON_FLAGS "-d -v -Wall")

flex_target(LEXER lexer.ll "${LEXER_OUT}" DEFINES_FILE "${PARSER_DIR}/lexer.h" COMPILE_FLAGS ${ADDITIONAL_FLEX_FLAGS})
bison_target(PARSER parser.yy "${PARSER_OUT}" DEFINES_FILE "${PARSER_DIR}/parser.h" COMPILE_FLAGS ${ADDITIONAL_BISON_FLAGS})
add_flex_bison_dependency(LEXER PARSER)

##############################################################################

add_executable(flex-bison-basic main.cpp "${LEXER_OUT}" "${PARSER_OUT}")
target_include_directories(flex-bison-basic PRIVATE "${PARSER_DIR}")
