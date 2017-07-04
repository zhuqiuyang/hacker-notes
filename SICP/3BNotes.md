## 3B: Symbolic Differentiation; Quotation

Gerald Jay Sussman

### Part 1

回顾Abel 讲的 embedding of languages

The Power of embedding languages partly comes from procedures like this one (example):

```lisp
(define deriv
  (lambda (f)
          (lambda (x)
                  (/ (- (f (+ x dx))
                        (f x))
                     dx))))
```

```markdown
1. dc/dx = 0
2. dx/dx = 1
3. dcu/dx = c du/dx
4. d(u+v)/dx = du/dx + dv/dx
5. duv/dx = u*dv/dx + v*du/dx
6. d(u/v)/dx = (v*du/dx - u*dv/dx)/v*v
7. 
```

write the program that encapsulates these rules independent of the representation of the algebraic expressions.

- This is a different thing than the derivative of the function.
- **syntactic phenomenon**. And so a lot of what we're goingto be doing today is worrying about syntax, syntax of expressions and things like that.

```lisp
(DEFINE (DERIV EXP VAR)
        (COND ((CONSTANT? EXP VAR) 0)
              ((SAME-VAR EXP VAR) 1)
              ((SUM? EXP) 
               (MAKE-SUM (DERIV (A1 EXP) VAR)
                         (DERIV (A2 EXP) VAR)))
              ((PRODUCT? EXP)
               (MAKE-SUM (* (M1 EXP)
                            (DERIV (M2 EXP) VAR))
                         (* (M2 EXP)
                            (DERIV (M1 EXP) VAR))))
              ))
```

> 定义predicate, 用`?`结尾, 便于阅读 eg:`SUM?`

```lisp
(+ (* a (* x x))
   (+ (* b x)
      c))
```

> This is list structure. And the reason why this is nice, is because any one of these objects has a property. I know where the car is. The car is the operator. And the operands are the successive cdrs the successive cars of the cdrs of the list that this is. It makes it very convenient.

let's start using list structure to write down the representation that I'm implicitly assuming here.(Like `CONSTANGE?`)

```lisp
; It's just that I'm going to look at the primitive constants in this way.
(DEFINE (CONTANT? EXP VAR)
        (AND (ATOM? EXP)
             (NOT (EQ? EXP VAR))))

(DEFINE (SAME-VAR? EXP VAR)
        (AND (ATOM? EXP)
             (EQ? EXP VAR)))

(DEFINE (SUM? EXP)
        (AND (NOT (ATOM? EXP))
             (EQ (CAR (EXP) '+))))
```

The expression is `atomic`, meaning it cannot be brokeninto parts. It doesn't have a car and a cdr.

`quote` example:

```markdown
; 两种意思:
Say your name.

Say "your name".
```

> However, this way I'm asking, is this the **symbolic object plus**, which normally stands for the addition operator?

**quotation** is a very complex concept, and adding it to a language causes a great deal of troubles.

defuction(推论)

```markdown
Alyssa is smart.
Alyssa is George's mother.
---
George's mother is smart.


"Chicago" has seven letters.
Chicago is the biggest city in Illinois.
---
"The biggest city in Illinois" has seven letters. (False)
```

We can't substitute into what's called referentially **opaque contexts**, of which a quotation is the prototypical type of referentially opaque context.