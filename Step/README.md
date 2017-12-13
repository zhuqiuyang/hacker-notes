## Compiler & interpreter

### 5.4 The Explicit-Control Evaluator
how the behavior of a Scheme interpreter can be described in terms of the procedures eval and apply.

### 5.5 Comilation
> http://sarabander.github.io/sicp/html/5_002e5.xhtml#g_t5_002e5

The explicit-control evaluator of 5.4 is a register machine whose controller interprets Scheme programs.

Two way gap High-level lang and register-machine language:
- interpreter: The explicit-control evaluator illustrates the strategy of interpretation.
- compiler: A compiler for a given source language and machine translates a source program into an equivalent program (called the object program) written in the machine’s native language. 

Lisp interpreters are generally organized so that interpreted procedures and compiled procedures can call each other.