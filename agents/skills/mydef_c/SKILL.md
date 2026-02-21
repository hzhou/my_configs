---
name: mydef_c
description: Write C code in MyDef.
---

## Overview
* MyDef is a template format for source code. To convert from e.g. "prog.def" to "prog.c", use `mydef_page`:
```bash
mydef_page prog.def
```

### Basics
* use '#' for comments. That is, replace '//' with '#'
* Do not break long lines
* The semicolon at the end of a statement is optional

### write C function in MyDef
Use the following to define a C function:
```
fncode: funcname(int n) : int
    [normal C code]
```

### print
Regular C statement such as using printf works. But MyDef provides short cut using "$print":
```
    $print "Hello, %s", name
```
"$print" omits the parenthesis and end-of-line "\n".

For integers, "$print" can do inline interpolation:
```
    $print "n = $n"
```

### if-statements
We can omit the parenthesis around condition and the curly braces using `$if`, `$elif`, `$else`. For example,
```
    $if cond_A
        printf("cond_A is true\n");
    $elif cond_B
        printf("cond_B is true\n");
    $else
        printf("Neither cond_A nor cond B is true\n");
```        

However, normal C code with C syntax, as long as it is properly indented, are valid in MyDef.

### for-loop
Regular C syntax works. But MyDef allows the "$for" syntax:
```
    $for i = 0:n
         $print i = $n

```
