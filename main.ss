#lang scheme

; connected-components : (listof node) (node -> (listof edge)) (edge -> node) -> (listof (listof node))
(define (connected-components ns node->edges edge->node)
  (define seen? (make-hash))
  (define component (make-hash))
  (define (visit! component-root n)
    (unless (hash-ref seen? n #f)
      (hash-set! seen? n #t)
      (hash-update! 
       component component-root 
       (lambda (old) (list* n old))
       empty)
      (map (compose (lambda (n) (visit! component-root n))
                    edge->node)
           (node->edges n))))      
  (for ([n ns])
    (visit! n n))
  (hash-map 
   component
   (lambda (k v) v)))

(provide/contract
 [connected-components 
  ((listof any/c)
   (any/c . -> . (listof any/c))
   (any/c . -> . any/c)
   . -> .
   (listof (listof any/c)))])