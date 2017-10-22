## 10B: Storage Allocation and Garbage Collection

Gerald Jay Sussman

### Part 1:

Memory, the glue that data structures are made of.

举例一种表示方式:

**Gödel** came up with a scheme to encode expressions as numbers.

If objects ar represented by numbers then:

- `(cons x y)` => `2^x 3^y`
- `(car x)` => the number of factors of 2 in `x`
- `(cdr x)`=> the number of factors of 3 in `x`

也可以用`boxes`来表示:

On the other hand, there are other ways of representing these things. We have been thinking in terms of little boxes. 

引出问题:

Now the problem is how are we going to impose on this type of structure, this nice tree structure.

So we're going to have to imagine imposing this complicated tree structure on our nice linear memory.

![10B_1_1](./png/10B_1_1.png)

 What is stored in each of these pigeonholes is a typed object.e `p`, standing for a `pair`. Or `n`,standing for a `number`.Or `e`, standing for an `empty list`.

下一个问题:

So this is the traditional way of representing this kind of binary tree in a linear memory. Now the next question, of course, that we might want to worry about is just a little bit of implementation.

#### Vector

Now of course in order to write that down I'm going to introduce some sort of a structure called a `vector`.

Machine code instructions like `assign` and `fetch` actually access these arrays.

```lisp
;; Accessors
(vector-ref  vector index)
(vector-set! vector index value)

(assign a (car (fetch b)))
====>
(assign a (vector-ref (fetch the-cars) (fetch b)))

(assign a (cdr (fetch b)))
====>
(assign a (vector-ref (fetch the-cdrs) (fetch b)))

(perform (set-car! (fetch a) (fetch b)))
====>
(perform (vector-set! (fetch the-cars) (fetch a) (fetch b)))

(perform (set-cdr! (fetch a) (fetch b)))
====>
(perform (vector-set! (fetch the-cdrs) (fetch a) (fetch b)))
```

