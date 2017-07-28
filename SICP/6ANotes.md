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

