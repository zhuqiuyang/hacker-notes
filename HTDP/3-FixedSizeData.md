#### 1.  Arithmetic
The rest of this chapter introduces four forms of atomic data of BSL: numbers, strings, images, and Boolean values.
The sections of this chapter introduce some of these functions, also called `primitive operations` or pre-defined operations.



Generally speaking, it is critical for a programmer to know how the chosen language calculates because ...

1.1 The Arithmetic of Numbers

- `e`:“Euler’s constant.”

1.2 The Arithmetic of Strings
1.3 Mixing It Up
1.4 The Arithmetic of Images
1.5 The Arithmetic of Booleans
1.6 Mixing It Up with Booleans
1.7 Predicates:  Know Thy Data

- `(sqrt -1)`: complex number
- `number?`

#### 2. Functions and Programs
**programming** is concerned, **“arithmetic”** and **“algebra” **

Specifically, the **algebra notions** needed are `variable`, `function definition`, `function application`, and `function composition`.

2.1 Functions

- Programs are **functions**.
- programs consume **inputs** and **produce** outputs. 
- programs work with **a variety of data**: numbers, strings, images, mixtures of all these, and so on. 
- programs are **triggered** by events in the real world, and the outputs of programs affect the real world.
- a program may **not consume** all of its input data at once

2.2 Computing

- stepper 调试
- substitution model` ?

2.3 Composing Functions

- `main function` and `help function`
- batch` 2.5会提及

2.4 Global Constants

- UPPERCASE

2.5 Programs

From a coding perspective:

- function & constant definition

From the perspective of launching a program:

- **Batch** program: consumes all of its inputs at once and computes its result.
- **interactive** program: `event-driven,` eg : GUI

##### big-bang ( 2htdp/universe)

- keeps track of the state of the program.
- `event-handler?`: a function that consumes the current state and a string that describes the key event and then returns a new state

#### 3. How to design program

A good program need good docs.

3.1 Function Design

##### Infomartion & Data

All this **information** comes from a part of the real world—often called the program’s domain.

For a program to process information, it must turn it into some form of **data** in the programming language

(page 29 1117)