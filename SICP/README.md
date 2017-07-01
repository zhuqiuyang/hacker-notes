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



