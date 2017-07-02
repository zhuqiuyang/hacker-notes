# 1B: Procedures and Processes; Substitution Model

## Part 1

### 回顾1A (spells procedure process)

> the way in which a programmer does this is by constructing **spells**, which are constructed out of procedures and expressions. And that these spells are somehow direct a **process** to accomplish the goal that was intended by the programmer. In order for the programmer to do this effectively, he has to understand the **relationship** between the particular things that he writes, these particular **spells**,and the **behavior of the process** that he's attempting to control.

programmer就是组织咒语(spells)，组织出来的东西称为 procedure 和 expression.

为了do this effectively，programmer需要了解他们所写的`spells`和`如何控制process的行为`之间的关系。

### Prodedure & Process

So what we're doing this lecture is attempt to establish that connection in as clear a way aspossible. What we will particularly do is **understand** how **particular patterns of procedures and expressions** cause **particular patterns of execution, particular behaviors from the processes**.

example:

```lisp
(DEFINE (SOS X Y)
        (+ (SQ X) (SQ Y)))

(DEFINE (SQ X) (* X X))
```
我们需要一种mapping

 If we're going to understand processes and how we control them,then we have to have a **mapping** from the **mechanisms of this procedure** into **the way in which these processes behave**.What we're going to have is a formal, or semi-formal, mechanical model whereby you understand how a machine could, in fact, **in principle**, do this. Whether or not the actual machine really does what I'm about to tell you is completely **irrelevant** at this moment. (理论上machine是如何工作的，是否真正如此，不在此考虑范围内)

### substitution model

And that `substitution model` will be accurate for most of the things we'll be dealing with in the next few days. But eventually, it will become impossible to sustain the illusion that that's the way the machine works, and we'll go to other **more specific and particular models that will show more detail.**

> **substitution model 可以处理mostly things，但最终它将不能满足我们的假设(the way machine work)，那时我们将介绍其他model。**

1. 通过square root求和讲解substitution 第一种rule
   - operator -> procedure
   - old body -> new body

**Warn**：

>**And I warn you that this is not a perfect description of what the computer does.**
>
>只是对this problem，这样描述足够了。以后会go more details.

2. 第二种rule `normal order evaluation` (简单提及)
   - operands for the formal parameters inside the body first.

### The rule of conditon 



## Part 2

How particular programs **evolve** particular **processes**.

###  通过Peano求和引出Process的两种shape

There's a very important, very important **pair of** programs for understanding what's going on in the **evolution of a process by the execution of a program**.

```lisp
;;Peano Arithmetic
;;Two ways to add whole numbers

;; 1. Iteration
(define (+ x y)
  (if (= x 0)
      y
      (+ (-1+ x) (1+ y))))

;; 2. Recursion
(define (+ x y)
  (if (= x 0)
      y
      (1+ (+ (-1+ x) y))
      ))
```

Those processes have very different **shape**:

- straight
- deferred

### 几种角度看待process

1. machine time/space complexity
   - 两种都是`recursive definitionsn`
2. Bureaucracy Model (从官僚主义模型看)
3. 从State存储角度
   - Iteration保存了所有state
   - Recursion 会丢失
     - 举了微分方程draw a circle的例子



## Part 3

How to program represents itself as the rule for the evolution of a process.

### Fibonacci 

### Hanoi

