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

