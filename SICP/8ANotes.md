## 8A: Logic Programming, Part 1

Hal Abelson

### Part 1:

Eval & Apply

there's this whole **big circle** where things go around and around and around until you get either to some very **primitive data** or to a **primitive procedure**.

See, what this cycle has to do with is **unwinding**(解开) the means of **combination** and the means of **abstraction** in the language.

#### 课程概要

Well, today we're going to apply this framework to build a new language.

Instead of that, we'll spend today building a really different language, a language that encourages you to think about programming not in terms of procedures, but in a really different way.

two levels simultaneously.:

-  On the one hand, I'm going to show you what this language looks like, and on the other hand, I'll show you how it's implemented. 
-  And we'll build an implementation in LISP and see how that works.

And you should be drawing lessons on two levels.

- The first is to realize just how different a language can be.
- And secondly, you'll see that even with such a very different language, which will turn out to not have procedures at all and not talk about functions at all, there will still be this **basic cycle** of **eval and apply** that's unwinds the means of combination and the means an abstraction.
- And then thirdly, as kind of a minor but elegant technical point, you'll see a nice use of **streams** to avoid backtracking.



#### This language is very different

> To explain that, let's go back to the very first idea that we talked about in this course, and that was the idea of the distinction between the **declarative** knowledge of mathematics-- the definition of a square root as a mathematical truth-- and the idea that computer science talks about the **how to** knowledge-- contrast that definition of square root with a program to compute a square root.

Well, wouldn't it be great if you could somehow bridge this **gap** and make a programming language which sort of did things, but you talked about it in terms of truth, in declarative terms?

given our language some sort of facts:

```markdown
SON-OF    ADAM     ABEL
SON-OF    ABEL     CAIN
SON-OF    CAIN     ENOCH
SON-OF    ENOCH    IRAD
```

Those are different questions being run by different traditional procedures all based on the same fact.

And that's going to be the **essence** of the power of this programming style, that one piece of **declarative** knowledge can be used as the **basis** for a lot of different kinds of **how-to** knowledge

give it some rules of inference:

```markdown
IF (SON-OF ?x ?y) AND
(SON-OF ?y ?z)
THEN (GRANDSON ?x ?z)
```

A Concrete Example:(Here's a procedure that merges two sorted lists)

```lisp
(define (merge x y)
  (cond
    ((null? x) y)
    ((null? y) x)
    (else
     (let ((a (car x)) (b (car y)))
          (if (< a b)
              (cons a
                    (merge (cdr x) y))
              (cons b
                    (merge x (cdr y))))))))
```

Let's forget about the program and look at the logic on which that procedure is based.

```lisp
(let ((a (car x)) (b (car y)))
     (if (< a b)
         (cons a (merge (cdr x) y))

; if you know that some list, that we'll call `cdr of x`, and `y merged to form z`
If
   (CDR-X and Y merge-to-form Z)
; you know that `a` is less than the `first thing in y`
and
   A < (car Y)
then
   ((cons A CDR-X) and Y
                   merge-to-form (cons A Z))

         ))

;Another clause
If (X and CDR-Y merge-to-form Z)
and B < (car X)
then (X and (cons B CDR-Y)
        merge-to-form (cons B Z))

For all X, (X and () merge-to-form X)

For all Y, (() and Y merge-to-form Y)
```

OK, so there's a piece of procedure and the logic on which it's based.And notice a big difference:

- **procedure** looked like this: it said there was a **box**-- and all the things we've been doing have the characteristic we have boxes and things going in and things going out
- These **rules** talk about a **relation**.

The answer is a function of x and y, and here what I have is a relation between three things. 

we could use exactly those same logic rules to answer a lot of different questions.



#### Logic Programming

- The first is, we're not going to be computing functions. We're not going to be talking about things that take input and output. We're going to be talking about relations.
- And the second issue is that since we're talking about relations, these relations don't necessarily have one answer.

And people who do **logic programming** say that-- they have this little phrase-- they say the point of logic programming is that you use logic to express `what is true`, you use logic to check whether something is true, and you use logic to find out what is true. The best known logic programming language, as you probably know, is called **Prolog**.

### Part 2:

- 回顾: The first thing you might notice, when I put up that little biblical database, is that it's nice to be able to ask this language questions in relation to some collection of facts.
- Next: So let's start off and make a little collection of facts.

```lisp
(job (Bitdiddle Ben) (computer wizard))

(salary (Bitdiddle Ben) 40000)

(supervisor (Bitdiddle Ben)
            (Warbucks))

(address (Bitdiddle Ben)
         (Slunerville (Ridge Road) 10))
```

...

Let me just write up here, for probably the last time, what I said is the very most important thing you should get out of this course, and that is, when somebody tells you about a language, 

老师在次强调我们应该学习到

```markdown
Primitive

Means of Combination (how do you put the primitives together)

Means of Abstraction (how do you abstract the compound pieces so you can use them as pieces to make something more complicated?)
```

#### Primitive 

only one primitive, and the primitive in this language is called a `query`.

