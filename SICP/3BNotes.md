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