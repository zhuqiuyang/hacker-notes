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
  (lambda (exp env)
          (cond ((number? exp) exp)
            ((symbol? exp) (lookup exp env))
            ((eq? (car exp) 'quote) (cadr exp))
            ((eq? (car exp) 'lambda) (list 'CLOSURE (cdr exp) env))
            ; ...
            )
          ))
```

Now the **environment** is a dictionary which maps the symbol names to their values. And that's all it is.(`env`就是一个 symbol -> value的 map)