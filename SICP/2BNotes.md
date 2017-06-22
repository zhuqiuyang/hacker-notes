## Compound Data

### Part1

### Divorce the task of building things from the task of implementing the parts.

We have individual numbers , But we don't have what a rational number is.

Wishful thinking we have these clouds.(rational number 有理数)

Imagine we have three procedure:

```lisp
; cloud is represented a rational number
(MAKE-RAT N D) -> cloud

(NUMER cloud) -> N

(DENOM cloud) -> D
```

```lisp
(DEFINE (+RAT X Y)
	(MEKE-RAT
    	(+ (* (NUMER X) (DENOM Y))
           (* (NUMER Y) (DENOM X))
        )
    	(* (DENOM X) (DENOM Y))
    )
)
```

