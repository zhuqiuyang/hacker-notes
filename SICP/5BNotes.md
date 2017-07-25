## 5B: Computational Objects

Gerald Jay Sussman

### Part 1

引子:

And what I want to make is a correspondence betweenthe objects in the world and the objects in the computer,

modularity

Well, let's take the best kind of objects I know. They're completely--they're completely wonderful:`electrical systems`.

![5B_1_Digital](./png/5B_1_Digital.png)

```lisp
; Primitives and Means of Combination

(define a (make-wire))
(define b (make-wire))
(define c (make-wire))
(define d (make-wire))
(define e (make-wire))
(define s (make-wire))

; or-get inputs: a, b; outputs: d.
(or-gate a b d)
(and-gate a b c)
(inverter c e)
(and-gate)
```

So today what I'm going to show you, right now, we're going to build up an invented language in Lisp,

![5B_1_circuit](./png/5B_1_circuit.png)

半加器: S is sum, C is carry(进位).

```lisp
(define (half-adder a b s c)
  (let ((d (make-wire)) (e (make-wire)))
       (or-gate a b d)
       (and-gate a b c)
       (inverter c e)
       (and-gate d e s)
       'ok))
```

And the nice thing about this that I've just shown you is **this language** is hierarchical in the right way. If a language isn't hierarchical in the right way, if it turns out that a compound object doesn't look like a primitive, there's something wrong with the language-- at least the way I feel about that.



 instead of starting with mathematical functions,

we are starting with things that are electrical objects

And the glue we're using is basically the Lisp structure: **lambdas**.

```lisp
(define (full-adder a b c-in sum c-out)
  (let ((c1 (make-wire)) 
        (c2 (make-wire))
        (s  (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok))
```

![5B_1_FullAdder](./png/5B_1_FullAdder.png)

Let's look at the primitives.(只需实现`primitive`) The only problem is we have to implement the primitives. Nothing else has to be implemented, because we're picking up the means of combination and abstraction from Lisp, inheriting them in the **embedding**.

#### Inverter (Primitive)

```lisp
; 非门
(define (inverter input output)
  (define (invert-input)
    (let ((new-value 
           (logical-not (get-signal input))))
         ; 经过一定的延迟(延迟时间是inverter-delay)
      (after-delay 
       inverter-delay
       (lambda ()
         (set-signal! output new-value)))))
  ; 给input wire添加一个action(called invert-input)
  (add-action! input invert-input)
  'ok)

(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else (error "Invalid signal" s))))
```

```lisp
; 与门
(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
           (logical-and (get-signal a1) 
                        (get-signal a2))))
      (after-delay 
       and-gate-delay
       (lambda ()
         (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)
```

Now supposing I were to try to say what's the computational model.

#### Computational Model

