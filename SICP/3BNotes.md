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

