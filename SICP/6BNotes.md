## 6B: Streams, Part 2

Hal Abelson

### Part 1: Infinite Streams

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

; 2nd
(define (divisible? x y) (= (remainder x y) 0))
(define no-sevens
  (stream-filter (lambda (x) 
                   (not (divisible? x 7)))
                 integers))

; 等同于 nth-stream
(stream-ref no-sevens 100)
; => 117
```





#### sieve of Eratosthenes

For a look at a more exciting infinite stream, we can generalize the `no-sevens` example to construct the infinite stream of prime numbers, using a method known as the *sieve of Eratosthenes*.

(没找到一个prime, 就把能被它整除的数, 从rest stream中去除.)

```lisp
(define (sieve stream)
  (cons-stream
   (stream-car stream)
   (sieve (stream-filter
           ; 把能被(stream-car stream)整除的元素从
           ; rest stream中filter
           (lambda (x)
             (not (divisible? 
                   x (stream-car stream))))
           (stream-cdr stream)))))

(define primes 
  (sieve (integers-starting-from 2)))

(stream-ref primes 50)
; => 233
```

shown in the “Henderson diagram”

![6B_1_sieve](./png/6B_1_sieve.png)

not only is the stream infinite, but the **signal processor** is also **infinite**, because the sieve contains a sieve within it.

QA: No Ques.

### Part 2:



