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

