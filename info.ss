#lang setup/infotab
(define name "Connected Components")
(define release-notes
  (list '(ul
          (li "Initial release"))))
(define repositories
  (list "4.x"))
(define blurb
  (list "Finds connected components"))
(define scribblings '(("main.scrbl" ())))
(define primary-file "main.ss")
(define categories '(datastructures))
(define compile-omit-paths '("test.ss"))