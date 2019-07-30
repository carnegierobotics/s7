(define size 500000)

(define (f1 x)
  (let ((y x))
    (do ((j 0 (+ j 1)))
	((= j 1))
      (do ((i 0 (+ i 1)))
	  ((= i size))
	(let-temporarily ((y 32))
	  (if (not (= y 32))
	      (format *stderr* "temp y: ~A~%" y)))
	(if (not (= y x))
	    (format *stderr* "y: ~A~%" y))))))

(f1 1)


(define-macro (m2 a b) `(+ ,a ,@b 1))
(define (f2)
  (let ((x 2)
	(y 0))
    (do ((j 0 (+ j 1)))
	((= j 1))
      (do ((i 0 (+ i 1)))
	  ((= i size))
	(set! y (m2 x (x x)))
	(if (not (= y (+ (* 3 x) 1)))
	    (format *stderr* "y: ~A~%" y))))))

(f2)


(define-expansion (m3 a b) `(+ ,a ,@b 1))
(define (f3)
  (let ((x 2)
	(y 0))
    (do ((j 0 (+ j 1)))
	((= j 1))
      (do ((i 0 (+ i 1)))
	  ((= i size))
	(set! y (m3 x (x x)))
	(if (not (= y (+ (* 3 x) 1)))
	    (format *stderr* "y: ~A~%" y))))))
(f3)


(exit)
