## 10A: Compilation

Last time, we took a look at an explicit control evaluator for Lisp, and that bridged the gap between all these high-level languages like Lisp and the query language and all of that stuff, bridged the gap between that and a conventional register machine.

### Part 1:

#### general strategy of interpretation

![10A_Lisp_Inter](./png/10A_Lisp_Inter.png)

So that's what an **interpreter** is. It configures itself to emulate a machine whose description you read in.

Now, inside the Lisp interpreter, what's that? Well, that might be your general **register language interpreter** that configures itself to behave like a Lisp interpreter, because you put in a whole bunch of instructions in register language.

This is the **explicit control evaluator**. (Lisp Interprter 中左下云) And then it also has some sort of library, a library of primitive operators and Lisp operations and all sorts ofthings like that.

目的:

And the point is, what we're doing is we're writing an **interpreter** to raise the machine to the levelof the programs that we want to write.

#### Compilation

对比:

- In interpretation, we're raising the machine to the level of our language,like Lisp.
- In compilation, we're taking our program and lowering it to the language that's spoken by the machine.

The compiler can produce code that will execute more efficiently.

- The essential reason for that is that if you think about the register operationsthat are running, the interpreter has to produce register operations which, in principle, are goingto be general enough to execute any Lisp procedure. 
- Whereas the compiler only has to worryabout producing a special bunch of register operations for, for doing the particular Lispprocedure that you've compiled.
- Or another way to say that is that the interpreter is a general purpose simulator, that when you read in a Lisp procedure, then those can simulate the program described by that, by that procedure. So the interpreter is worrying about making a general purpose simulator, 
- whereas the compiler, in effect, is configuring the thing to be the machine that the interpreter would have been simulating.

On the other hand, the interpreter is a nicer environment for debugging. 

- we've got the source code actually there. We're interpreting it.That's what we're working with. 
- And we also have the library around. See, the interpreter--the library sitting there is part ofthe interpreter.

Dual Advantages:(各有千秋)

- The compiler will produce code that executes faster.
- The interpreter is a better environment for debugging.

Well, the idea of a compiler is very much like the idea of an interpreter or evaluator. (interpreter and evaluator are same thing.)

Well, the compiler essentially would like to walk over the code and produce the register operations that the evaluator would have done were it evaluating the thing. And that gives us a model for how to implement a **zeroth-order** compiler, a very bad **compiler** but essentially a compiler. A model for doing that is you **just take the evaluator, you run it over the code**, but instead of executing the actual operations, you just save them away. And that's your compiled code.

Eg:

```lisp
; Register Operations in interpreting (F X)

(assign unev (operands (fetch exp)))   ; unev is unevaluate?
(assign exp (operator (fetch exp))) ; no need (13:25), F is above
(save continue)
(save env)
(save unev)
(assign continue eval-args)
(assign val (lookup-val-val (fetch exp) (fetch env)))
(restore unev)
(restore env)
(assign fun (fetch val))
(save fun)
(assign argl '())
(save argl)
```



 There's only one little lie in that.

> So you can't say which one the evaluator would have done. So all you do there is very simple. You compile both branches.

```lisp
(IF P A B)
---
<code for P - Result in VAL>
Branch IF VAL is TRUE To Label1
<code for B>
GOTO NEXT-THING
LABEL1 <code for A>
      GOTO  NEXT-THING
```

So that's how you treat a conditional. You generate a little block like that.

And other than that,this **zeroth-order compiler** is the same as the **evaluator**. It's just stashing away the instructions instead of executing them.



That seems pretty simple, but we've gained something by that. See, already that's going to be more efficient than the evaluator. Because, if you watch the evaluator run, it's not only generating the register operations we wrote down, it's also doing things to decide which ones to generate.

> In other words,what the **evaluator's** doing is simultaneously analyzing the code to see what to do, and running these operations. And when you-- if you run the evaluator a million times, that analysis phase happens **a million times**, whereas in the **compiler**, it's happened **once**, and then you just have the register operations themselves.



分析上述Register: 

- you don't want unev and exp at all. those aren't registers of the actual machine that's supposed to run. Those are registers that have to do with arranging the thing that can simulate that machine.
- So they're always going to hold expressions which, from the compiler's point of view, are justconstants, so can be put right into the code. So you can forget about all the operations worrying about exp and unev and just use those constants.

