## 4A: Pattern Matching and Rule-based Substitution

Gerald Jay Sussman

### Part 1

is there some other way of writing this program that's more clear?

3B写的deriv，能不能表达的更clear.

```markdown
           Rule
  Patter -----------> Skeleton(骨架)
    |                    |
    |                    |
    | mactch             | instantiation
    |                    |
    v                    v
Expression |------>  Expression
  Source               target
```

>  And what we're going to do is instead of bringing the rules to the level of the computer by writing aprogram that is those rules in the computer's language-- at the moment, in a Lisp-- we're goingto bring the computer to the level of us by writing a way by which the computer can understandrules of this sort.

