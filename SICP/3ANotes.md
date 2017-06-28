## Henderson Escher Example

### Part 1

#### Review : compound data

1. isolate the way that data object are used from the way that they're represented
2. Lisp pairs.

#### reivew: vectors

```lisp
; Using Vector

(define (+vect v1 v1)
  (make-verctor
   (+ (xcor v1) (xcor v2))
   (+ (ycor v1) (ycor v2))))

(define (scale s v)
  (make-vector (* s (xcor v))
               (* s (ycor v))))

; slight different before
(define (make-vector cons))
(define (xcor car))
(define (ycor cdr))
```

procedure can be objects, and that you can name them.

作一条线段，起点(2,3)，终点 (5,1)

```lisp
; Representing line segment

(define make-seg cons)
(define segment-start car)
(define segment-end cdr)

(make-seg (make-vect 2 3)
          (make-vect 5 1))
```

#### a notion of closure

> closure was the thing that allow us to build up complexity.
>
> Or as a mathematician might say, the set of data objects in List is closed under the operation of forming pairs. (数学家的说法，List中的数据集合在pairs操作下是封闭的。)

#### For example ，glue four things:  1，2，3，4,  there are a lot of ways.

#### List

> List is essentially, just a convention for representing sequence.

![List](/Users/Ace/Documents/Workspace/hacker-notes/SICP/png/List.png)

`List` primitive just a abbreviation(缩写) for nested cons.

```lisp
(DEFINE 1-TO-4 (List 1 2 3 4))

(CAR (CDR 1-To-4)) -> 2
```



```lisp
(SCALE-LIST 10 1-TO-4) -> (10 20 30 40)
(MAP SQUARE 1-To-4) -> (1 4 9 16)
(MAP (LAMBDA (X) (+ X 10)) 1-TO-4) -> (11 12 13 14)

; CDR-ing down a list 
(define (scale-list s l)
  (if (null? l)
      nil
      (cons (* (car l) s)
            (scale-list s (cdr l)))))
```

### map

> take a list l , and take a procedure p, apply p to each element in l. and return a new list.

```lisp
; general procedure called map
(define (map p l)
  (if (null? l)
      nil
      (cons (p (car l))
            (map (cdr l)))))

(define (scale-list s l)
  (map (lambda (item) (* item s))
       l))
```



#### Really really import : stop thinking about control structure, start thinking about operations on aggregates.we'll see when we talk about something called **stream processing**.

some thing like map is called for-each

```lisp
(define (for-each proc list)
  (cond ((null? list) *done*)
    (else (proc (car list))
          (for-each proc
                    (cdr list)))))
```

