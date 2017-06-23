## Compound Data

### Part1

### Divorce the task of building things from the task of implementing the parts.

We have individual numbers , But we don't have what a rational number is.

Wishful thinking we have these clouds.(rational number 有理数)

Imagine we have three procedure:

```lisp
; cloud is represented a rational number
(MAKE-RAT N D) -> cloud

(NUMER cloud) -> N

(DENOM cloud) -> D
```

```lisp
(DEFINE (+RAT X Y)
	(MEKE-RAT
    	(+ (* (NUMER X) (DENOM Y))
           (* (NUMER Y) (DENOM X))
        )
    	(* (DENOM X) (DENOM Y))
    )
)

(DEFINE (*RAT X Y)
	(MAKE-RAT
    	(* (NUMER X) (NUMER Y))
     	(* (DENUM X) (DENUM Y))
    )        
)
```

### why do we want a procedure like +RAT that takes in two rational numbers and returns a rational number?

### Part 2

We need a kind of glue for data object to put things together.

In Lisp , the glue is called `list structure`

Pairs.

> - *car* (short for "**C**ontents of the **A**ddress part of **R**egister number"),
> - *cdr* ("**C**ontents of the **D**ecrement part of **R**egister number"),

```lisp
(cons x y)
;; constructs a pair whose first part is x and whose second part is y

(car p)
;; selects the first part of the pair p

(cdr p)
;; selects the second part of the pair p
```



```lisp
(DEFINE (MAKE-RAT N D)
	(CONS N D)
)
(DEFINE (NUMER X) (CAR X))
(DEFINE (DENOM X) (CDR X))
```



> great common divisor 最大公约数

```lisp
(define (make-rat n d)
  (let (
        (g (gcd nd))
        (cons (/ n g)
              (/ d g)
        )
       )
  )
)
```



### DATA ABSTRACTION

> This methodology has a name, data abstraction.

`Use`     +RAT   * RAT   -RAT

---

MAKE-RAT/NUMER/DENOM   (constructor & selector )              `ABSTRACTION LAYER`

---

`REPRESENTATION`   PAIRS