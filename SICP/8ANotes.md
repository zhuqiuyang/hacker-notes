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
- And we'll build an implementation in LISP and see how that works.

And you should be drawing lessons on two levels.

- The first is to realize just how different a language can be.
- And secondly, you'll see that even with such a very different language, which will turn out to not have procedures at all and not talk about functions at all, there will still be this **basic cycle** of **eval and apply** that's unwinds the means of combination and the means an abstraction.
- And then thirdly, as kind of a minor but elegant technical point, you'll see a nice use of **streams** to avoid backtracking.



#### This language is very different

> To explain that, let's go back to the very first idea that we talked about in this course, and that was the idea of the distinction between the **declarative** knowledge of mathematics-- the definition of a square root as a mathematical truth-- and the idea that computer science talks about the **how to** knowledge-- contrast that definition of square root with a program to compute a square root.

Well, wouldn't it be great if you could somehow bridge this **gap** and make a programming language which sort of did things, but you talked about it in terms of truth, in declarative terms?