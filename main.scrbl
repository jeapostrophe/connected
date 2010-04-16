#lang scribble/manual
@(require (for-label scheme/base
                     scheme/gui
                     scheme/contract
                     "main.ss"))

@title{Connected Components}
@author{@(author+email "Jay McCarthy" "jay@plt-scheme.org")}

Finds the connected components of a graph.

@defmodule[(planet jaymccarthy/connected)]

@defproc[(connected-components 
          [nodes (listof any/c)]
          [node->edges (any/c . -> . (listof any/c))]
          [edge->node (any/c . -> . any/c)])
         (listof (listof any/c))]

Returns a list of lists of nodes. Each node list represents a connected component of the graph induced by @scheme[nodes], @scheme[node->edges], and @scheme[edge->node]. These are provided as procedures rather than data structures to be more general.

Refer to @filepath{test.ss} for a short example.