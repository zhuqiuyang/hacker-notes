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

```lisp
(define deriv-rules
  '(
    ( (dd (?c c) (? v))                0)
    ; since this v appears twice, we're going to want that to mean they have to be the same.
    ( (dd (?v v) (? v))                1)
    ( (dd (?v u) (? v))                0)
    
    ( (dd (+ (? x1) (? x2)) (? v))
     ; colons
      (+ (dd (: x1) (: v))
         (dd (: x2) (: v)))             )
    
    
    ))
```

**Colons** `:` here will stand for **substitution objects**. They're--we'll call them **skeleton evaluations**.

go on for this rule language

#### pattern matching

```markdown
Pattern match

foo --- matches exactly foo
(f a b) --- match any list whose first element is f, 
            whose second element is a, and whose third element is b
            
            
(? x) --- matches anything, call it x
(?c x) --- matches a constant, call it x
(?v x) --- matches a variable, call it x
```

```markdown
Skeletons for instantiation(实例化)

foo  --- instantiates to itself
(f a b) --- instantiates to a 3.list which are the result of instantiating
         each of f, a , and b.
(: x) --- instantiate to the value of x as in the matched pattern
```

