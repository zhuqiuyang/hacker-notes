### 0 What we do:
#### 0.1 OPEN_SOURCE
#### 0.2 About
control complexity
#### 0.3 Learn what
the link between procedure (we write) and process(run in machine).

### 7A: Meta-Circular Evalutor
>But what Lisp is is the fixed point of the process which says, if I knew what Lisp was and substituted it in for eval, and apply,
Both side is Lisp. (理解正确?)

### Eval & Apply (After 8B)

Eval takes as arguments an expression and an environment.

Apply takes two arguments, a procedure and a list of arguments to which the procedure should be applied.

### 1.1 The Elements of Programming(2nd)

#### 1.1.1 Expressions

1. primitive expression:
might be a number
```lisp
486
```

2. compound expression:
`Expressions` representing `numbers` may be combined with an `expression` representing a `primitive procedure` (such as + or *) to form a `compound expression` that represents the application of the procedure to those numbers. For example:

```lisp
(+ 137 349)
486
```

Expressions such as these, formed by delimiting a list of expressions within parentheses in order to denote procedure application, are called `combinations`.
包含 `operator` and `operands`


#### 1.1.2 Naming and the Environment

`define` using names to refer to computational objects.

`env` is a memory that keeps track of the name-object pairs. 

#### 1.1.3 Evaluating Combinations

Notice that the **evaluation rule** given above does not handle `definitions`. For instance, evaluating `(define x 3)` does not apply define to two arguments.

Such exceptions to the general evaluation rule are called **special forms**.

> Each special form has its own evaluation rule. The various kinds of expressions (each with its associated evaluation rule) constitute the syntax of the programming language. 

## Compiler & interpreter
> https://www.youtube.com/watch?v=1OukpDfsuXE
compiler & interpreter Both **transform** `source` -> `machine code`, just in different *time*, because computer just know `machine code`:
- interpreter(flexible): 运行时把`source` -> `machine code`,相当于up machine to high-level.
  - `inter` is between `source` and `machine`
- compiler(fast): `source code` -> `machine code`

Why?
- some rules 确定的时间不一样:
  - 数据类型
  - 语法(macro...)
  - 确定的早fast(compiler), 确定晚flexible(interpreter)
- 两者搭配使用可以兼具flexible & fast.

### 5.1 Designing Register Machines
To design a register machine, we must design its **data paths** (registers and operations) and the **controller** that sequences these operations.

### 5.4 The Explicit-Control Evaluator
how the behavior of a Scheme `interpreter` can be described in terms of the procedures `eval` and `apply`.

### 5.5 Comilation
> http://sarabander.github.io/sicp/html/5_002e5.xhtml#g_t5_002e5

The explicit-control evaluator of 5.4 is a register machine whose controller interprets Scheme programs.

Two way gap High-level lang and register-machine language:
- interpreter: The explicit-control evaluator illustrates the strategy of interpretation.
- compiler: A compiler for a given source language and machine translates a source program into an equivalent program (called the object program) written in the machine’s native language. 

Lisp interpreters are generally organized so that interpreted procedures and compiled procedures can call each other.