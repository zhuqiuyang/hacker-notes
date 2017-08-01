## 6B: Streams, Part 2

Hal Abelson

### Part 1:

回顾:

- **decouple** the apparent order of eventsin our programs from the actual order of events in the computer.
- we can start dealing with very long streams and only having to generate the elements **on demand**.

compute the n-th element in the stream:

```lisp
(define (nth-stream n s)
  (if (= n 0)
      (head s)
      (nth-stream (-1+ n) (tail s))))
```

print stream:

```lisp
(define (print-stream s)
  (cond ((empty-stream? s) *done*)
        (else (print (head s))
              (print-stream (tail s)))))
```

#### Infinite Stream

```lisp
(define (integers-from n)
  (cons-stream n (integers-from (+1 n))))

(define integers (integers-from 1))

(nth-stream integers 20)
; => 21
```

