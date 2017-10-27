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

```markdown
2nd: To model computer memory, we use a new kind of data structure called a vector. (http://sarabander.github.io/sicp/html/5_002e3.xhtml#g_t5_002e3)

In order to describe memory operations, we use two primitive Scheme procedures for manipulating vectors:

- (vector-ref ⟨vector⟩ ⟨n⟩) returns the nthnth element of the vector.
- (vector-set! ⟨vector⟩ ⟨n⟩ ⟨value⟩) sets the nthnth element of the vector to the designated value.

We can use vectors to implement the basic pair structures required for a list-structured memory. Let us imagine that computer memory is divided into two vectors: the-cars and the-cdrs.

to extending the notion of “pointer” to include information on data type.
eg: A pointer to a number, such as n4, might consist of a type indicating numeric data together with the actual representation of the number 4.
```

Now the problem is how are we going to impose on this type of structure, this nice tree structure.

So we're going to have to imagine imposing this complicated tree structure on our nice linear memory.

![10B_1_1](./png/10B_1_1.png)

 What is stored in each of these pigeonholes is a typed object.e `p`, standing for a `pair`. Or `n`,standing for a `number`.Or `e`, standing for an `empty list`.

下一个问题:

So this is the traditional way of representing this kind of binary tree in a linear memory. Now the next question, of course, that we might want to worry about is just a little bit of implementation.

#### Vector

Now of course in order to write that down I'm going to introduce some sort of a structure called a `vector`. (I don't think that name is the right word.)

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



#### free list

2nd:

> We presume that there is a special register, `free`, that always holds a pair pointer containing the next available index, and that we can increment the index part of that pointer to find the next free location.

eg: Here we have the free list starting in 6.

```lisp
; With freelist method of allocation

(assign a (cons (fetch b) (fetch c)))
===>

(assign a (fetch free))
(assign free
        (vector-ref (fetch the cdrs)
                    (fetch free)))
(perform (vector-set! (fetch the-cars)
                      (fetch a)
                      (fetch b)))
(perform (vector-set! (fetch the-cdrs)
                      (fetch a)
                      (fetch b)))
```

