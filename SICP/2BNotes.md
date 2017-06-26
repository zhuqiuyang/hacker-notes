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

### QA:

1. computer science 中好的部分like magic, 不好的部分 like religion. In general,好的设计师并不会， 在实现之前设计好所有的事情。
   - 真的值得称道的是，假设你已经做出决定，之后在figure out which one is right。
   - 当你掌握了它，你拥有了两个世界的精华。



### Part 3

```lisp
; representing vectors in the plane
(define (marke-vector x y) (cons x y))

(define (xcor p) (car p))

(define (ycor p) (cdr p))

; representing line segments
; p, q are two points
(define (make-seg p q) (cons p q))

(define (seg-start s) (car s))

(define (seg-end s) (cdr s))

; midpoint of s
(define (midpoint s)
  (let ((a (seg-start s))
        (b (seg-end s)))
       (make-vertor
        (average (xcor a) (xcor b))
        (average (ycor a) (ycor b))
        )
       )
  )
; length of s (勾股定理)
(define (length s)
  (let 
   ((dx (- (xcor (seg-end s))
           (xcor (seg-start s))))
	(dy (- (ycor (seg-end s))
           (ycor (seg-start s)))))
   (sqrt (+ (square dx)
            (square dy)))))
```



#### build a layer system

```markdown
SEGMENTS

---
MAKE-SEG/SEG-START/SEG-END
---

VECTORS

---
MAKE-VECTOR/X-COR/Y-COR
---

PAIRS

```



### Closure

combination运算的是封闭的. 

> So I can have not only a pair of numbers, but I can have a pair of pairs.

```lisp
; redifined lengh
(DEFINE (LENGTH S)
	(LET ((DX (- (CAR (CAR S)) (CAR (CDR S))))
          (DY (- (CDR (CAR S)) (CDR (CDR S))))
          ))
)
```

> So again, the way we've gotten out of that is we've named that **spirit**. We built a system where there is a thing, which is the representation choice for how you're going to talk about vectors.And choices about that representation are localized right there. They don't have their guts spilling over into things like how you compute the length and how you compute the midpoint.

通过 a thing，我们构建一个系统, which 代表了我们决定如何和vector进行沟通。

而这种决定(representation的实现方式)内化了，我们不需要关心起内部实现。

### Part 4

we've just gone off and done a couple of simple examples of data abstraction. Now We're going to talk about what it means.

what suitable might mean is if I have to assume something like this:

```markdown
IF X = (MAKE-RAT N D)

THEN

(NUMBER X)/(DENOM X) = N/D
```

