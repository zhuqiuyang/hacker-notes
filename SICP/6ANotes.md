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

