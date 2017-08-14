## 7A: Metacircular Evaluator, Part 2

Gerald Jay Sussman

### Part 1:

Metacircular is because they are defined in terms of themselves insuch a way that the language they interpret contains itself.

Such interpreters are a convenient medium for exploring language issues.

Let's start by adding a very simple feature to a Lisp.(给语言添加过多的Feature is not good.)



#### Indefinite numbers of arguments(参数数量不定)

```lisp
(+ (* a x x)
   (* b x)
   c)
```

x required

many args , y will be the list of them.

I've used a **dot** here to indicate that the thing after this is a **list** of all the rest of the arguments.

this (**dot**) happens to be a syntax that's used in the Lisp reader for representing **conses**.

```lisp
(lambda (x . y)
        (map (lambda(u) (* x u))
             y))
```



#### Important !

```lisp
; That's the procedure list.
; `x` matched against a list of arguments
(lambda x x) = list

; `x` matched one argument. 说明lambda的第一个参数接受的是一个`List`
(lambda (x) ...) = list
```

How do we interpret it?

> `pair up` is making a list, `adding a new element to our list of frames`.(7A)

```lisp
(define pair-up
  (lambda (vars vals)
          (cond
            ((eq? vars '())
             (cond ((eq? vals '()) '())
               (else (error TMA))))
            ; have a symbolic tail
            ((symbol? vars)
             (cons (cons vars vals) '()))
            ((eq? vals '()) (error TFA))
            (else
             (cons (cons (car vars)
                         (car vals))
                   (pair-up (cdr vars)
                            (cdr vals)))))))
```

The variables are a symbol-- interesting case-- then, what I should do is say, oh yes, this is the special case that I have a **symbolic tail**.

### Part 2:Dynamic bind of variable

Now, I'm going to tell you about a rather more substantial variation,one that's a famous variation that many early Lisps had. It's called **dynamic binding of variables**.



I'm not going to tell what it is yet, I'm going to show you why you might want it.

```lisp
(define sum
  (lambda (term a next b)
    (cond ((a > b) 0)
            (+ (term a)
               ;pass along (直传)
               (sum term (next a) next b)))))
```

Now, when I use this sum procedure, I can use it, for example, like this.

```lisp
(define sum-powers
  (lambda (a b n)
          (sum (lambda(x) (expt x N))
               a
               1+
               b)))
```



```lisp
(define product-powers
  (lambda (a b n)
          (product (lambda(x) (expt x N))
               a
               1+
               b)))
```

These look the same.Why am I writing this code so many times?

```lisp
(define sum-powers
  (lambda(a b n)
         (sum nth-power a 1+ b)))
```

```lisp
(define product-powers
  (lambda(a b n)
         (product nth-power a 1+ b)))
```

nth-power

```lisp
(define nth-power)
```

