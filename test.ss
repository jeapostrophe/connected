#lang scheme
(require "main.ss")

(define-struct graph (adj))

(define (create-graph)
  (make-graph (make-hasheq)))
(define (graph-add*! g start end)
  (hash-update! (graph-adj g)
                start
                (lambda (old)
                  (list* end old))
                empty))
(define (graph-add! g start end)
  (graph-add*! g end start)
  (graph-add*! g start end))
(define g (create-graph))
(define (node->edges n)
  (hash-ref (graph-adj g) n empty))

(graph-add! g 1 2)
(graph-add! g 2 4)
(graph-add! g 3 1)
(graph-add! g 4 3)
(graph-add! g 5 3)
(graph-add! g 5 4)
(graph-add! g 6 7)
(graph-add! g 7 5)

(graph-add! g 8 10)
(graph-add! g 9 8)
(graph-add! g 10 11)
(graph-add! g 11 10)
(graph-add! g 11 13)
(graph-add! g 12 11)

(connected-components
 (build-list 13 add1)
 node->edges
 (lambda (n) n))