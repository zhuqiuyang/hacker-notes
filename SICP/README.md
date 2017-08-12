## Structure & Interpretation of Computer Programs

### 1A: Overview and Introduction to Lisp

> Don't confused of the essence of things what you are doing with the tools that you use.
>
> CS is about **how-to Imperative** knowledge. Formalize intuitions of process.

#### Three Topic

- black-box abstraction
- conventional Interface
- metalinguitic abstraction (make new language)

### 1B: Procedures and Processes; Substitution Model

- Subtitution Rule
- Iteration and Recursion
- Space & Time Complexity
- Fibnacci (Recursion)
- Hanoi (Recursion)
  - Q: How to implement using Iteration
- Else
  - `And the reason why people think of programming as being hard, of course, is because you're writing down a general rule, which is going to be used for lots of instances`

### 2A: Higher-order Procedures

- 抽离出 sum procedure. sigma .累加
- 求SQRT. 以(Heron of Alexandria)为例。讲解了 average damp is a high-order procedure。(用lambda 定义anonymous procedure.)
- 以Newton Method 为例。进一步解释HOP。谈到了Wishful thinking，First-class citizens。


### 2B: Compund Data

#### 大纲:

- the system has primitive data.
- There's glue that allows you to put primitive data together to make more complicated, kind of compound data
- And then we're going to see a methodology for **abstraction** that's a very good thing to use when you start building up data in terms of simpler data.
- And again, the key idea is that you're going to build the system **in layers**


- Part 1: 通过Rational number 引入**data abstraction**.
- Part 2: `list structure`, Lisp 中构建compound data的方法.
  - constructor & selector (abstract layer)
- Part 3: Use segment & vector. To show use data abstraction can control complexity.
- Part 4: What's data abstraction really mean?
  - 满足公理的procedure
  - what's pair.
    - we can do things abstractly
    - blue the line between what's procedure and what's data.


### 3A: Herderson Escher Example

#### Part 1

- 回顾data abstraction, pairs

  > as amathematician might say, the set of data objects in List is closed under the operation of forming pairs.

- 引出 **List** (List just a abbr for this nested of cons)

- Map

  - thinking about opertation on **aggregate** (整体)
  - stream processing

- ForEach

#### Part 2

- 回顾到现在所讲的一切内容
- 提示`you will be complete confused about what's the difference between procedures and data are.` At the end of this morining.
- 介绍这门语言
  - only one primitive `picture`
  - means of combination and the operation
    - Rotate
    - Beside
    - Flip
  - 之所以能快速变化，`because operations are **closed**.`
- 实现Picture
  - build rectangle，coordinate-map，draw this image
  - a picture is a procedure that takes a rectangle as argument.

#### Part 3

- 把Picture定义成procedure 最nice的地方就是，Combination 只要去计算出Rectangle即可。

  > the means of combination just fall out by implementing procedures
  >
  > The only computation it has to do is figure out what these rectangles are
  >
  > So implementing pictures as procedures makes these means of combination, you know, both pretty simple and also, I think, elegant.

- List 赋予我们进行操作的procedure，同样适用于Picture Language

  - The language is nicely embedded in List

- Language Level

  > viewing the engineering design process as one of creating language **or** rather one of creating a sort of sequence of layers of language

  - Each level has a full rang of linguistic Power.


### 3B: Symbolic Differentiation; Quotation

`07: xx`: And so a lot of what we're goingto be doing today is worrying about syntax

- 通过嵌入规则(不同的rules)来进行 **Symbolic Differentiation**
- 简单提到了 Quotation

### 4A: Pattern Matching and Rule-based Substitution

- Part 1:
  - 通过Pattern (match) -> skeleton(instantiation) 来使3B中第一的`deriv`更清晰一些。
    - write those rules in the computer's language -- at the moment, in a Lisp-- we're going to bring the computer to the level of us. (把Lisp提升到和我们一个level)
- Part 2: matching and instantiation
- Part 3: 理解control structure，which rule should be used to the exp.

### 4B: Generic Operators

- Part 1:looked at a strategy for implementing generic operators.
  - And the idea is that you break your system into a bunch of pieces. There's George and Martha, who are making representations,
  - and then there's the manager. Looks at the types on the data and then dispatches them to the right person.
- Part 2: looked at **data-directed programming** as a way of implementing a system that does **arithmetic** on **complex numbers**.
- Part 3: embedding this in some more complex system.
  - 前面只实现了 complex 的 `+c -c`
  - 把complex 的操作添加到 **generic operator**中.
  - 添加 ordinary numbers
  - 添加 polynomials
  - 添加 rational objects


### 5A: Assignment, State & Side Effect

- Part 1: Assignment
  - 举了`fact`(阶乘的例子),functional version & imperative version
- Part 2: Env Model
  - procedure object: `body code` & `env defined`
  - evaluation new rules
- Part 3: Action & Identity
  - why introduce assignment?
  - 举了`Cesaro Method` use `Monte Carlo` 来计算Pi.


### 5B: Computational Objects

- Part 1: event-driven simulation (digital circuit)
  - `And what I want to make is a correspondence between the objects in the world and the objects in the computer,`
- Part 2: Agenda
  - implement agenda
  - queue
    - set-car!
    - set-cdr!
- Part 3: Identity & Share
  - 重定义了`CONS`举例
    - set-car! & set-cdr!


### 6A: Stream, Part 1:

- Part 1: 提出**Stream Process**
  - change View
  - 举了 `acc` `odd-tree`和`odd-fib`的例子

- Part 2: Nest Loop
  - 介绍了 ` 1≤j<i≤n`, such that `i+j`is prime 的例子
    - 引出了flatmap和 collect(语法糖)
    - 并用collect 解决了 `8 Queen`问题.

- Part 3: **Streams Are Delayed Lists**

  > Streams are a clever idea that allows one to use sequence manipulations without incurring the costs of manipulating sequences as lists.
  >
  > (避免了List Huge时, 还没消费到, 就需要提前计算的问题.)
  >
  > With streams we can achieve the best of both worlds.
  >
  > On the surface, streams are just lists with different names for the procedures that manipulate them. (2nd 3.5.1)

  - Promise, delay, force

  > We **de-couple** the **apparent order** of events in our programs from the **actual order** of events inthe computer.

  - memo-proc (消除re-compute)


补充:

在Lisp中, `sequence`is constructed by nested `cons` operations, is called `list`.

### 6B: Stream, Part 2:

- Part 1: Inifine Stream

- Part 2: implicitly Stream and Delayed Evaluation

  - `ones`
  - all at once

- Part 3:

  - Normal Order and its price


- 用bank-account 举例:
    - message-passing
    - purely function language

### 7A: Metacircular Evaluator

An evaluator that is written in the same language that it evaluates is said to be *metacircular*.

- Part 1:
  - write `eval` and `apply`
- Part 2:
  - Use a simple example 展示了eval&apply的每一个步骤. (最后给出 eval&apply loop)
- Part 3:
  - Fixed point
  - Y operator
  - Lisp is the Fixed point of process