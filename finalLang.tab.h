/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     BEGIN_P = 258,
     END_P = 259,
     END = 260,
     PRINT = 261,
     READ = 262,
     IF = 263,
     DO = 264,
     WHILE = 265,
     PRINTLN = 266,
     PLUS_EQUAL = 267,
     MINUS_EQUAL = 268,
     MULT_EQUAL = 269,
     DIV_EQUAL = 270,
     PLUS_PLUS = 271,
     MINUS_MINUS = 272,
     IF_SIMPLE = 273,
     ELSE = 274,
     VAR_ASSIGN = 275,
     NOT = 276,
     NOT_EQUAL = 277,
     EQUAL = 278,
     GREATER = 279,
     LESS = 280,
     MINUS = 281,
     PLUS = 282,
     SLASH = 283,
     STAR = 284,
     UMINUS = 285,
     BEGIN_C = 286,
     END_C = 287,
     VARIABLE = 288,
     NUMBER = 289,
     STRING = 290,
     ERROR = 291
   };
#endif
/* Tokens.  */
#define BEGIN_P 258
#define END_P 259
#define END 260
#define PRINT 261
#define READ 262
#define IF 263
#define DO 264
#define WHILE 265
#define PRINTLN 266
#define PLUS_EQUAL 267
#define MINUS_EQUAL 268
#define MULT_EQUAL 269
#define DIV_EQUAL 270
#define PLUS_PLUS 271
#define MINUS_MINUS 272
#define IF_SIMPLE 273
#define ELSE 274
#define VAR_ASSIGN 275
#define NOT 276
#define NOT_EQUAL 277
#define EQUAL 278
#define GREATER 279
#define LESS 280
#define MINUS 281
#define PLUS 282
#define SLASH 283
#define STAR 284
#define UMINUS 285
#define BEGIN_C 286
#define END_C 287
#define VARIABLE 288
#define NUMBER 289
#define STRING 290
#define ERROR 291




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 9 "finalLang.y"
{
  Statement*	statePtr_;
  char*		charPtr_;
  double	const_;
  std::string*	stringPtr_;
}
/* Line 1529 of yacc.c.  */
#line 128 "finalLang.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

