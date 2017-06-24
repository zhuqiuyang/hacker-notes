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

> - cons - constitute
> - car* (short for "**C**ontents of the **A**ddress part of **R**egister number"),
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



> Data abstraction is sort of theprogramming methodology of setting up data objects by postulating constructors and selectors to isolate use from representation

```lisp
; defining +RAT without date abstraction

(define (+rat x y)
  (cons (+ (* (car x) (cdr y))
           (* (car y) (cdr x)))
        (* (cdr x) (cdr y)))
)
; I don't have, in a system like that, the idea of rational number as a conceptual entity.
```

What's the advantage of isolating the idea of rational numbers as a conceptual entity, and really naming it with make-RAT, numerator, and denominator.

> one advantage is you might want to have alternative representations

```lisp
; alternative representation for rational numbers

(define (make-rat n d) (cons n d))

(define (numer x)
  (let ((g (gcd (car x) (cdr x))))
       (/ (car x) g)))

(define (denom x)
  (let ((g (gcd (car x) (cdr x))))
       (/ (cdr x) g)))
```

> 第一种 ans 的入参 6 8 , 存入ans 是约分后的 3 4, numer 取出的分子 直接就是3.
>
> 第二种 ans 的入参 6 8, 存入ans 直接就是 6 8, number 取出的是6/gcd 结果是3.

But the **real issue** is that you might not be able to decide at the moment you're worrying about these rational numbers. See, in general, as systems designers, you're forced with the necessity to make decisions about how you're going to do things, and **in general**, the way **you'd like to retain flexibility is to never make up your mind about anything until you're forced to do it.**

> 为了保持flexibility，“如无必要，勿增实体”。

And in fact, we'll see a couple times from now that **you may never have to choose any particular representation, ever, ever**. Anyway,that's a very powerful **design technique**. It's the key to the reason people use data abstraction.And we're going to see that idea again and again

