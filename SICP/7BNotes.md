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
(define nth-power
  (lambda(x)
         (expt x n)))
```

```markdown
; Variation 2: A famous "bug."

Dynamic binding -- a free variable in a procedure has its value defined in the chain of callers, rather than where the procedure is defined.

Easy to implement -- but ....
```

从caller chain(调用链)中需找(类似于js中的`arrow function`?)

In fact, the very **first Lisps** that had any interpretations of the free variables at all, had **dynamic binding interpretations** for the free variables. **APL** has dynamic binding interpretation for the freevariables, not lexical or static binding. So, of course, the change is in eval. And it's really in two places.

```lisp
(define eval
  (lambda (exp env)
          (cond
            ((number? exp) exp)
            ((symbol? exp) (lookup exp env))
            ((eq? (car exp) 'quote) (cadr exp))
            ((eq? (car exp) 'lambda) exp)           ;!
            ((eq? (car exp) 'cond)
             (evcond (cdr exp) env))
            (else
             (apply (eval (car exp) env)
                    (evlist (cdr exp) env)
                    env)))))                        ;!
```

First of all, one thing we see, is that things become a little simpler.

1. we see that the clausefor a lambda expression, which is the way a procedure is defined, does not make up a thingwhich has a type closure and a attached environment structure. It's just the expression itself.And we'll decompose that some other way somewhere else.(lambda 表达式不需要attach 到env了)

2. The other thing we see is the **applicator** must be able to get the **environment of the caller**.

   So all I have to do is pass that environment to the applicator, to apply.

```lisp
(define apply
  (lambda (proc args env)                ; !
          (cond
            ((primitive? proc)           ; magic
             (apply-primop proc args))
            ((eq? (car proc) 'lambda)
             ;; proc = (lambda bvrs body)
             (eval (caddr proc)          ; body
                   (bind (cadr proc)     ; bvrs
                     args
                     env)))              ; env !
            else...)))
```

The reason why the first Lisps were implemented this way, is the sort of the obvious, accidental implementation.

Unfortunately that causes some **serious problems**.

The most important, serious problem in using dynamic binding is there's a **modularity crisis** that's involved it.

If two people are working together on some big system, then an important thing to want is thatthe names used by each one don't interfere with the names of the other.

Eg:

放弃之前的定义, 重新定义.

```lisp
(define pgen
  (lambda(N)
         (lambda (x) (expt x N))))

(define sum-power
  (lambda(a b N)
         (sum (pgen N) a 1+ b)))

(define product-powers
  (lambda(a b N)
         (product (pgen N) a 1+ b)))
```

QA:

The thing is that returning procedures as values cover all of those problems. And so it's the simplest mechanism that gives you the best modularity, gives you all of the known modularity mechanisms.

### Part 3:

#### 回顾Stream

it was the responsibility of the caller and the callee to both agree that an argument was **delayed**, and the callee must **force** the argument if it needs the answer.

That turns out, of course, to be a fairly bad thing, it works all right with streams. But as a general thing, what you want is an **idea** to `have a locus, a decision, a design decision in general, to have a place where it's made, explicitly, and notated in a clear way.` And so it's **not a very good** idea tohave to have an agreement, between the person who writes a procedure and the person whocalls it, about such details as, maybe, the arguments of evaluation, the order of evaluation.

####  args passed by name or by value (按名传参, 按值传参)

ALGOL 60 had two different ways of calling a procedure. The arguments could be passed by name or by value. And what that meant was that a name argument was delayed. That when you passed an argument by name, that its value would only be obtained if you accessed that argument.

增加pass by name

We're going to add the feature of, **by name parameters**, if you will, or delayed parameters. Because, in fact, the default in our Lisp system is by the value of a pointer. A pointer is copied, but the data structure it points at is not.

