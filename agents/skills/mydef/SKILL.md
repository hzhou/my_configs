---
name: mydef
description: Write MyDef code
---

## Overview
This skill teaches AI how to write or convert code in MyDef.
MyDef is a template format for text. It is mainly used for writing source code.

## Basic
- MyDef files use extension .def
- MyDef files use whitespace indentation similar to Python

###  page
Indented text below a "page: name" converts to a file named "name" with the indented text. For example:

    page: t.sh
        echo "Hello World!"

If the file is t.def, on command line, run "mydef_page t.def" will generate file t.sh with its context:

    echo "Hello World!"

A single .def file may contain multiple pages for generate several output files.

### macros
"macros:" defines macros with syntax such as "key:value". For example:

    macros:
        project: startrek

    page: t.txt
        The project is $(project).

This will output the file "t.txt" with text:

    The project is startrek.

Thus, $(macroname) gets replaced with the named macro.

#### macro with parameter
Define macro with place holders $1, $2, ..., up to $9 and the place holders will be replaced with parameters. For example:

    macros:
        add_one: $1 + 1

Then "$(add_one:10)" will be expanded as "10 + 1". Multiple parameters are used as $(A:p1, p2).

### subcode
"subcode: fname" defines a multiple line template that can be invoked via "$call fname". For example:

    subcode: run_startrek(n)
        for i in range($(n)):
            print i

    page: t.py
        $call run_startrek, 10

This will output t.py:

    for i in range(10):
        print i

Note: even though the subcode appears similar to a python function, it is simply a multiple-line macros and don't need be a whole function. We can directly define python function as part of the text:

    page: t.py
        def F(a):
            return a+1
        $call run_startrek, F(10)    
