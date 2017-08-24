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
