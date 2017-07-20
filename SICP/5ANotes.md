## 5A: Assignment, State, and Side-effects

Gerald Jay Sussman

### Part 1

We're going to add an assignment statement.

why should we add it?

Let me quick begin by reviewing the kind of language that we have now.

```lisp
; Functional programs
; encode mathematical truths

(define (fact n)
  (cond ((= n 1) 1)
    (else (* n (fact (- n 1))))))
```

![5A_factorial](./png/5A_factorial.png)

```lisp
; Processes evolved by sunch programs
; can be understood by substitution:

(fact 4)
(* 4 (fact 3))
(* 4 (* 3 (fact 2)))
(* 4 (* 3 (* 2 (fact 1))))
(* 4 (* 3 (* 2 1)))
(* 4 (* 3 2))
(* 4 6)
24
```

