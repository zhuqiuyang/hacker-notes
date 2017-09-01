## 8B: Logic Programming, Part 2

Hal Abelson

### Part 1:

All right, well, we've seen how the query language works. Now, let's talk abouthow it's implemented.

At the bottom ofit, there's a pattern matcher.

```lisp
                         ;; Sample Pattern
(a ?x c)
(job ?x (computer ?y)    ;; one element in ?y
(job ?x (computer . ?y)  ;; arbitrary number of elements after in ?y
(a ?x ?x)
(?x ?y ?y ?x)
(a . ?x)
```

Example:

```lisp
(MATCH pat data dictionary)
;; The dictionary is initially empty but can be populated by data provided by the user.

;; Example of input:

pat = (?x ?y ?y ?x)
data = (a b b a)
dict = {x: a}
;; Ouput:
extended dictionary = {x: a, y: b}

If dict = { y: a} => Fail
```



#### Primitive query

```lisp
(job ?x (?D . ?Y))

```

![8B_1_query](./png/8B_1_query.png)

input stream of frames is `previous restrictions`

empty framesays try matching all ways - - query against something inthe database subject to no previous restrictions.

Well, **why** is that so complicated? You probably can think of a lot simpler ways to arrange this match for a primitive query rather than having all of these streams floating around.

The **answer** is this thing extends elegantly to implementthe means of combination.

e.g.:

```lisp
AND can be implement just connect one out-stream to another input stream.
```

#### And query

![8B_1_And](./png/8B_1_And.png)

#### Or query:

![8B_1_Or](./png/8B_1_Or.png)

#### Not:

From the stream-of-frames viewpoint, the `not` of some query acts as a filter that removes all frames for which the query can be satisfied. 

The major point to notice here, and it's a major point we've looked at before, is this idea of **closure**. The things that we build as a means of combination have the same overall structure asthe primitive things that we're combining.

QA:

1. Where does the dictionary come from?

   > The dictionary comes initially from what you type in. So when you start this up,the first thing it does is set up this whole structure. It puts in one `empty dictionary`. And if all youhave is one primitive query, then what will come out is a bunch of `dictionaries` with things filled in.

2. It appears that the AND performs some redundant searches of the database.

> This one is meant to be--was mainly meant to be very simple so you can see how they fit together.  (老师只是展示了实现方式.)

### Part 2:

