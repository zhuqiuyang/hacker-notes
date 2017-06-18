### See some eg that cannot be implement by other language.

1. sum int

   ``` lis
   (DEFINE (SUM-INT A B)
   	(IF (> a b)
   		0
   		(+ a (SUM-INT (1+ a) b))
   	)
   )
   ```

2. Sum square

   ```lis
   (DEFINE (SUM-SQUARE A B)
   	(IF (> a b)
   		0
   		(+ )
   	)
   )
   ```

3. common pattern

   ```lis
   (define (<name> a b)
   	(if (> a b)
   		0
   		(+ (<term> a)
   		(<name> (<next> a) b))
   		)
   )
   ```

4. sigma notation

   ```lisp
   (define (SUM TERM A NEXT B)
     (IF (> A B)
     	0
       (+ (TERM A)
          (SUM TERM
               (NEXT A)
               NEXT
               B
          )
       )
     )
   )
   ```

5. sum-int use sigma

   ```lis
   (define (sum-int a b)
   	(define (identity x) x)
   	(SUM identity a 1+ b)
   )
   ```

6. sum-sq 

   ```lisp
   (DEFINE (SUM-SQ A B)
   	(SUM SQUARE A 1+ B) 
   )
   ```

7. pi-sum

   ```lisp
   (DEFINE (PI-SUM A B)
   (SUM (lamda (i) (/ 1 (* i (+ i 2)))) 
        a
        (lamda (i) (+ i 4))
        b
        )        
   )
   ```

### Iterative implementation of sum 

```lis
(define (sum term a next b)
	(define (iter j ans)
		(if (> j b)
			ans
			(iter (next j)
				(+ (term j) ans)
			)
		)
	)
	(iter a 0)
)
```

