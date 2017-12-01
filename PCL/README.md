## Practial Common Lisp

### 1. Introduction: Why Lisp?
- Perl motto: "There's more than one way to do it."1
> Perl is also worth learning as "the duct tape of the Internet."

- Python: "There's only one way to do it."
- The nearest thing Common Lisp has to a motto is: "the programmable programming language."
> Common Lisp follows the philosophy that what's good for the language's designer is good for the language's users.
> clisp provide a much clearer mapping between your ideas about how the program works and the code you actually write. 
> Lisp, in addition to incorporating small changes that make particular programs easier to write

http://www.norvig.com/java-lisp.html

### 7. macros-standard-control-constructs
http://www.gigamonkeys.com/book/macros-standard-control-constructs.html

#### Do
basic template:
```lisp
(do (variable-definition*)
    (end-test-form result-form*)
  statement*)
```
variable-define
```lisp
(var init-form step-form)
```

```lisp
;;; 定义3个变量
;;; 当 (= 10 n), 返回result为cur的值
(do ((n 0 (1+ n))
     (cur 0 next)
     (next 1 (+ cur next)))
    ((= 10 n) cur))
```

#### The Mighty LOOP