## Streams, Part 1

Hal Abelson

### Part 1:

```markdown
ASSIGNMENT
STATE
CHANGE
TIME
IDENTITY
OBJECT
SHARING
```

So all of these things enter as soon as we introduce assignment.

Well, how'd we get into this mess? Remember what we did, the reason we got into this is because we were looking to build modular systems.(我们是如何遇到这些问题的, 因为我们在建立`Modularity` System)

we'd like our program to break into natural pieces, pieces that mirror the parts of the system that we see in the real world.(把程序的各个pirces对应到real world中)

#### 我们的view错了?

See, maybe the real reason that we pay such a price to write programs that mirror our view ofreality is that we have the wrong view of reality.

#### Stream Processing

Well, today we're going to look at **another way to decompose systems** that's more like the **signal processing** engineer's view of the world than it is like thinking about objects that communicate sending messages. That's called **stream processing**.

example:

```lisp
(define (sum-odd-squares tree)
  (if (leaf-node? tree)
      (if (odd? tree)
          (square tree)
          0)
      (+ (sum-odd-squares
          (left-branch tree))
         (sum-odd-squares
          (right-branch tree)))))
```

```lisp
(define (odd-fibs n)
  (define (next k)
    (if (> k n)
        '()
        (let ((f (fib k)))
             (if (odd? f)
                 (cons f (next (1+ k)))
                 (next (1+ k))))))
  (next 1))
```

So if I was talking like a signal processing engineer, what I might say is that the first procedure enumerates the leaves of a tree.

```markdown

      +------------------+   +-------------+   +------------+   +------------------------------+
      | enumerate leaves |-->| filter odd? |-->| map square |-->| accumulate + starting from 0 |
      +------------------+   +-------------+   +------------+   +------------------------------+

      +---------------+   +---------+   +-------------+   +----------------------------------+
      | enum interval |-->| map fib |-->| filter odd? |-->| accumulate cons starting from () |
      +---------------+   +---------+   +-------------+   +----------------------------------+
```

#### 问题根源: 

> Going back to this fundamental principle of computer science that in order to control something, you need the name of it, we don't really have control over thinking about things this way because we don't have our hands in them explicitly.

我们没有合理的描述成上图的方式, program 把 `enum` , `acc`等混合在了一起.

Well, let's invent an appropriate language in which we can build these pieces.

The key to the language is `signal`.

data structures called streams.

#### stream

constructor & selector:

```lisp
(cons-stream x y)

; 课程里selector是 (HEAD s) (TAIL s)
(stream-car (cons-stream x y)) = x
(stream-cdr (cons-stream x y)) = y
```

why don't you just pretend that streams really are just a terminology for lists. And we'll see in a little while why we want to keep this extra abstraction layer and not just call them lists.(为什么不直接用list 来表示stream , 一会解释)

```lisp
(define (map-stream proc s)
  (if (empty-stream? s
      the-empty-stream
      (cons-stream
       (proc (head s))
       (map-stream proc (tail s)))))
```

filter box:

```lisp
; predicate
(define (filter pred s)
  (cond
    ((empty-stream? s) the-empty-stream)
    ((pred (head s))
     (cons-stream (head s)
                  (filter pred
                          (tail s))))
    (else (filter pred (tail s)))))
```

accumulate

```lisp
(define (accumulate combiner init-val s)
  (if (empty-stream? s)
      init-val
      (combiner (head s)
                (accumulate combiner
                            init-val
                            (tail s)))))
```

enumerate:

```lisp
(define (enumerate-tree tree)
  (if (leaf-node? tree)
      (cons-stream tree
                   the-empty-stream)
      (append-streams
       (enumerate-tree
        (left-branch tree))
       (enumerate-tree
        (right-branch tree)))))
```

append-stream:

```lisp
(define (append-streams s1 s2)
  (if (empty-stream? s1)
      s2
      (cons-stream
       (head s1)
       (append-streams (tail s1)
                       s2))))
```

enumerate interval

```lisp
(define (enum-interval low high)
  (if (> low high)
      the-empty-streams
      (cons-stream
       low
       (enum-interval (1+ low) high))))
```

用Stream来表示之前original procedure for summing the odd squares in a tree.

```lisp
(define (sum-odd-squares tree)
  (accumulate
   +
   0
   (map
    square
    (filter odd
            (enumerate-tree tree)))))
```

fibs

```lisp
(define (odd-fibs n)
  (accumulate
   cons
   '()
   (filter
    odd
    (map fib (enum-interval 1 n)))))
```

the **advantage** of this stream processing is: we're establishing **conventional interfaces** that allow us to glue things together.

And as an example of that, Richard Waters, who was at MIT when he was a graduate student, as part of his thesis research went and analyzed a large chunk of the IBM scientific subroutine library, and discovered that about **60%** of the programs in it could be expressed exactly in terms using **no more than what we've put here--map, filter, and accumulate**.

QA:

### Part 2:

#### flatten (*tableau* in 2nd book)

So I've got a stream. And each element of the stream is itself a stream.

```lisp
(DEFINE (FLATTERN ST-OF-ST)
        (ACCUMULATE (APPEND-STREAMS
                     THE-EMPTY-STREAM
                     ST-OF-ST)))

; s is a stream of element
; f is a function for each element in stream
(DEFINE (FLAT-MAP F S)
        ; Each time I apply f to an element of s, I get a stream.
        (FLATTEN (MAP F S)))
```

#### Integer Pairs with Prime Sum

Given an integer *n*, find all pairs of integer *0 < j < i <= n* such as *i+j* is prime.

```markdown
n = 6
i    j    i+j
-------------
2    1    3
3    2    5
4    1    5
```

