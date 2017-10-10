## 9B: Explicit-control Evaluator

### Part 1:

- the magic of building languages, we have looked at:
  -  Escher picture language
  -  digital logic language (数字电路)
  -  query language.

And the thing you should realize is, even though these were toy examples, they really are the kernels of really useful things.

they're all based on LISP. 

#### A lot of people ask what particular problems is LISP good for solving for?

> The answer is LISP is not good for solving any particular problems. What LISP is good for is constructing within it the right language to solve the problems you want to solve, and that's how you should think about it.

 We looked at the meta-circular evaluator and said well, **LISP is based on LISP.**

> `Y operators`, and `fixed points`, and the idea that what this meansis that LISP is somehow the fixed-point equation for this funny set of things which are defined interms of themselves. Now, it's real magic.

![9B_Register](./png/9B_Register.png)

So, if we implement LISP in terms of a **register machine**, then everything ought to become, atthis point, completely concrete.

All right, how are we going to do this? We already have all the ingredients.

> all we have to do is take the particular procedures that are the **meta-circular evaluator** and hand-translate them for a register machine.(把Meta-circular evaluator 转换成 register machine, 这样所有lisp都将被translate.)

that's going to be our final most explicit model of LISP in this cours

#### Instance

1. takes space that grows:

```lisp
(define (fact-rec n)
  (if (= n 0)
      1
      (* n (fact-rec (- n 1)))))
```

2.  syntactically recursive, called fact-iter, somehow doesn't take space:

```lisp
(define (fact-iter n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))
```



 We justify that it doesn't need to take space by showing the substitution model. But we didn't really say how it happens that the machine manages to dothat, that that has to do with the details of how arguments are passed to procedures.

![9B_Lisp_Sys](./png/9B_Lisp_Sys.png)

 the reader transforms these into pointers to stuff in this memory, and that's what the evaluator sees

```
      characters           list struct
User ------------> Reader ------------> Evaluator ----------> Printer
 ^                   |                      |                   |
 |                   V                      V                   |
 |             List Structure           Primitive               |
 |                Memory                Operators               |
 |                                                              |
 +--------------------------------------------------------------+
```



####  today, what we're going to talk about is this evaluator.

- The list structure memory, we'll talk about next time.

#### evaluator

```markdown
We will focus on the evaluator, it has 7 registers:

EXP, expression to to be evaluated (pointer to List Structure Memory)
ENV, evaluation environment (pointer to List Structure Memory)

FUN, procedure to be applied
ARGL, list of evaluated argument

(eval/apply loop)

CONTINUE, place to go to next

VAL, result of evaluation

UNEV, temporary register for expressions
```



```lisp
;; Sample evaluator-machine operations

(assign val (fetch exp))

(branch
(conditional? (fetch exp))
 ev-cond)

; first-clause is some selector,
(assign exp (first-clause (fetch exp)))

(assign val
        (lookup-variable-value (fetch exp)
                               (fetch env)))
```



here's a piece of the **meta-circular evaluator**. This is the one using abstract syntax that's in the book. It's a little bit different from the one that Jerry shows you. And the main thing to remember about the evaluator is that it's doing some sort of case analysis on the **kinds of expressions**: so if it's either self-evaluated, or quoted, orwhatever else. And then, in the **general case** where the expression it's looking at is anapplication, there's some tricky recursions going on.

```lisp
(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp)
         (make-procedure (lambda-parameters exp)
                         (lambda-body exp)
                         env))
        ((begin? exp) 
         (eval-sequence (begin-actions exp) env))
        ((cond? exp) (eval (cond->if exp) env))
        ((application? exp)
         (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else
         (error "Unknown expression type - EVAL" exp))))
```

#### apply

```lisp
(define (apply procedure arguments)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure procedure arguments))
        ((compound-procedure? procedure)
         (eval-sequence
           (procedure-body procedure)
           (extend-environment
             (procedure-parameters procedure)
             arguments
             (procedure-environment procedure))))
        (else
         (error
          "Unknown procedure type - APPLY" procedure))))
```

#### The Eval/Apply cycle

```markdown
                           Eval
    ---------------------------------------------------
    |                                                 |
    |                                                 v
Expression                                        Procedure
Enviroment                                        Arguments
    ^                                                 |
    |                                                 |
    ---------------------------------------------------
                          Apply
```



two big pieces of this evaluator correspond to eval and apply.

Contract that `eval-dispatch` fulfills:

- the `exp` register holds an expression to be evaluated
- the `env` register holds the environment in which the expression is to be evaluated
- the `continue` register holds a place to go next
- the result will be left in the `val` register. Contents of all other registers may be destroyed

Contract that `apply-dispatch` fulfills:

- the `argl` register contains a list of arguments
- the `fun` register contains a procedure to be applied
- the *top of the stack* holds a place to go next
- the result will be left in the `val` register. The stack will be popped. Contents of all other registers may be destroyed.

### Part 2:

#### Real example

```markdown
EXP: 1/x/ (+ x y)
ENV: <E0> -> [x=3, y=4]
FUN: 
```



25:54 (两位老师一起演示全过程)

```lisp
; EXP: (+ x y)
EXP: +
ENV: <E0>


UNEV: (X Y)
```



## Evaluator (Partial)

```lisp
eval-dispatch
  (branch (self-evaluating? (fetch exp)) ev-self-eval) ; eg: exp is 1
  (branch (variable? (fetch exp)) ev-variable) ; eg: exp is x
  ; ...

; <... more special forms ...>
  (branch (application? (fetch exp)) ev-application) ; eg: exp is (+ x y)
  (goto unknown-expression-error)

ev-self-eval
  (assign val (fetch exp))
  (goto (fetch continue))

ev-variable
  (assign val (lookup-variable-value (fetch env)))
  (goto (fetch continue))

ev-application
  (assign unev (operands (fetch exp)))
  (assign exp (operator (fetch exp)))  ; replace the expression by the operation to apply
  (save continue)
  (save env)
  (save unev)
  (assign continue eval-args)
  (goto eval-dispatch)                 ; recursive call

eval-args
  (restore unev)
  (restore env)
  (assign fun (fetch val))
  (save fun)
  (assign argl '())
  (goto eval-arg-loop)

eval-arg-loop
  (save argl)
  (assign exp (first-operand (fetch unev)))
  (branch (last-operand? (fetch unev)) eval-last-arg)
  (save env)
  (save unev)
  (assign continue accumulate-arg)
  (goto eval-dispatch)

accumulate-arg
  (restore unev)
  (restore env)
  (restore argl)
  (assign argl (cons val) (fetch argl))
  (assign unev (rest-operands (fetch unev)))
  (goot eval-arg-loop)

eval-last-arg
  (assign continue accumulate-last-arg)
  (goto eval-dispatch)

accumulate-last-arg
  (restore argl)
  (assign argl (cons (fetch val) (fetch argl)))
  (restore fun)
  (goto apply-dispatch)
```

## Applicator

```lisp
apply-dispatch
  (branch (primitive-proc? (fetch fun)) primitive-apply)
  (branch (compound-proc? (fetch fun)) compound-apply)
  (goto unknown-proc-type-error)

primitive-apply
  (assign val (apply-primitive-proc (fetch fun) (fetch argl)))
  (restore continue)
  (goto (fetch continue))

compound-apply
  (assign exp (procedure-body (fetch fun)))
  (assign env (make-bindings (fetch fun) (fetch argl)))
  (restore continue)     ; this is where tail recursion happens
  (goto eval-dispatch)
```



 This whole thing, we used a stack and the evaluator was recursive.

> The reason that you need recursion in the evaluator is because the evaluation process, itself, is recursive, all right? 
>
> It's notbecause the procedure that you might be evaluating in LISP is a recursive procedure.
>
> So that's an important thing that people get confused about a lot.

QA:

2.  Why is it that the order of the arguments in the arg list got reversed?
   - just a convention.



### Part 3:

That's the thing we haven't seen, really. We haven't seen any compound procedures where applying a procedure reduces to evaluating the body of the procedure.

```lisp
(DEFINE (F A B)
        (+ A B))
;;
(F X Y)

E0: [ X=3, y=4, F=procedure, Args: a b , body: + a b]
```

apply-dispatch