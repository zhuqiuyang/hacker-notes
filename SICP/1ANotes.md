# 1A: Overview and Introduction to Lisp

## Part 1 (Most Important)

### declarative knowledge

What the essence of geometry? 

Egyptians, what they were doing, the important stuff they were doing, was to begin to formalize notions about space and time, to start a way of talking about mathematical truths formally. That led to the axiomatic method. That led to sort of all of modern mathematics, figuring out a way to talk precisely about so-called declarative knowledge, what is true. (几何学，declarative knowledge，其发展出的一系列公理，奠定了现代几何学)

而Computer Science 研究的是`how-to`

those primitives in the 20th century were fiddling around with these gadgets called computers, but really what they were doing is starting to learn how to **formalize intuitions about process**,how to do things, starting to develop a way to talk precisely about **how-to** knowledge, as opposed to geometry that talks about what is true.

### imperative knowleage

how-to

**process**: It's kind of hard to say. You can think of it as like a magical spirit that sort of lives in the computer and does something.

**procedure**: And the thing that directs a process is a pattern of rules called a **procedure**.

so in computer-science, we're in business of formalizing this sort of **how-to imperative knowledge**

#### 这套课程的研究内容

> These techniques that are contronlling complexity are what this course is really about

Computer Science deals with idealized components.

There's not all that much difference between what i can build and what i can **imagine**.

The **constranits** imposed in building large software system are **limitations of our own mind**.

### Three Major Topic in This course 

通过 Square Method的例子，先介绍Black-box abstraction.

```markdown
### First Topic: BLACK-BOX ABSTRACTION

- PRIMITIVE OBJECT (represent the simplest entities the language is concerned with)
  PRIMITIVE PROCEDURES
  PRIMITIVE DATA

- MEANS OF COMBINATION(compound elements are built from simpler ones)
  PROCEDURE COMPOSTION
  CONSTRUCTION OF COMPOUND DATA

- MEANS OF ABSTRACTION(compound elements can be named and manipulated as units)
  PROCEDURE DEFINITION
  SIMPLE DATA ABSTRACTION

- CAPTURING COMMON PATTERNS
  HIGH-ORDER PROCEDURES
  DATA AS PROCEDURES
  
  
 ### Second Topic: Conventinal Interface, the way of controlling that kind of complexity
 - genetice operations (like 'plus' that have to work with all different kinds of data)
 - how to put together very large programs that model the kinds of complex systems in real world. Tow metaphors: 
 	- oop(object-oriented programming)
 	- operations on aggregates, called streams.
 	
### Third Topic: Metalinguistic abstraction (Making new languages):
> most magic part of this course. apply & eval
```


## Part 2

### Start Learning Lisp

当有人给你一门新的语言，你应该关注的是 `what are the ways you put those together? What are the means of combination?` … `if the language did not come with matrices built in or with something else built in, how could I then build that thing?` etc.

### Means of Combination

A combination consists, of applying an `operator` to some `operands`.(操作符，操作数)

### Means of abstraction

When you type in a definition in Lisp, it responds with the **symbol** being defined.

> "define", in particular, was that it was the means of abstraction. It was the way that we name things. (Part 3)

define a procedure

`lambda` is Lisp's way of saying make a procedure.

And that's a **key** thing in Lisp, that you do not make arbitrary distinctions **between** things that happen to be primitive in the language **and** things that happen to be built in. (语言自带的和构造的， 使用起来无差别？)



## Part 3

实现开头提到的Heron of Alexandria Method to Square Root.





```markdown
METHOD FOR FINDING A FIXED POIONT OF A FUNCTION F (THAT IS, A VALUE Y SUCH THAT F(Y) = Y)
- START WITH A GUESS FOR Y
- KEEP APPLYING F OVER AND OVER UNTIL THE RESULT DOESN'T CHANGE VERY MUCH.

EXAMPLE
TO COMPUTE $\sqrt{x}$ . FIND A FIXED POINT OF THE FUNCTION Y.   AVERAGE OF Y AND X/Y
```

