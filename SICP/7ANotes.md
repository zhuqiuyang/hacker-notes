## 7A: Metacircular Evaluator, Part 1

Jay Sussman

### Part 1:

#### fact

```lisp
(define (factorial n)
  (if (= n 1)
      1
      (* (factorial (- n 1)) n)))
```

![7A_1_Fact](./png/7A_1_Fact.png)

#### universal machine

![7A_1_UniversalMachine](./png/7A_1_UniversalMachine.png)

For example, if we feed our evaluator the definition of `factorial`, as shown in Figure 4.3, the evaluator will be able to compute factorials.

From this perspective, our evaluator is seen to be a *universal machine*.

#### evaluator for Lisp(老师穿上jacket and 戴上hat) 4.1.1

```lisp
(define eval
  (lambda (exp env)                            ;; env is a dictionary mapping symbols to values
    (cond
      ;; SPECIAL FORMS
      ;; 3 -> 3
      ((number? exp) exp)
      ;; x -> 3 or car -> [procedure]
      ((symbol? exp) (lookup exp env))
      ;; 'foo == (quote foo) -> foo
      ((eq? (car exp) 'quote) (cadr exp))
      ;; (lambda x) (+ x y) -> (closure ((x) (+ x y)) env)  bound variables + body + env
      ((eq? (car exp) 'lambda) (list 'CLOSURE (cdr exp) env))
      ;; (cond (p1 e1) (p2 e2) ...) ->
      ((eq? (car exp) 'cond) (evcond (cdr exp) env))
      ;; (+ x 3) -> default, general application
      ;; DEFAULT COMBINATION
      (else
               ;; operator
        (apply (eval (car exp) env)
               ;; operands
               (evlist (cdr exp) env))))))
```

Now the **environment** is a dictionary which maps the symbol names to their values. And that's all it is.(`env`就是一个 symbol -> value的 map)

The number of **reserve words** that should exist in a language should be no more than a person could remember on his fingers and toes.

#### Apply

**apply's job** is to take a procedure and apply it to its arguments after both have been evaluated

to **come up with** a procedure and the arguments **rather** the operator symbols and the operand symbols,whatever they are-- symbolic expressions.

```lisp
(define apply
  (lambda (proc args)
          (cond
            ((primitive? proc) (apply-primop proc args))
            ((eq? (car proc) 'CLOSURE) 
             ; get the body
             (eval (cadadr proc)
                   (bind caadr proc)
                   args
                   (cadadr proc)))
            ; compiled code ? (可以加在这里)
            (else error)
            )))
```

`BIND` will be interesting later.

#### Evlist

When `eval` processes a procedure application, it uses `list-of-values`to produce the list of arguments to which the procedure is to be applied. `List-of-values` takes as an argument the operands of the combination. It evaluates each operand and returns a list of the corresponding values:(2nd)

```
(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (cons (eval (first-operand exps) env)
            (list-of-values 
             (rest-operands exps) 
             env))))
```

#### Conditionals

```lisp
(define evcond
  (lambda (clauses env)
          (cond ((eq? clauses '()) '())
            ;;each clause is a list. And so the predicate part is the CAAR of the clauses.
            ((eq? (caar clauses) 'ELSE)
             ; So this is the first clause, the second element of it,
             (eval (cadar clauses) env))
            ; first clauses is false, do the next.
            ((false? (eval (caar clauses) env))
             (evcond (cdr clauses) env))
            ; true
            (else
             (eval (cadar clauses) env))
            )))
```

