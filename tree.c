 #include <stdio.h>
 #include <stdlib.h>
 #include "tree.h"

static tree *make_operator(tree *l, char o, tree *r) {
  tree *result = (tree*) malloc (sizeof(tree));
  result->nodetype = operator_node;
  result->body.an_operator.left = l;
  result->body.an_operator.operator = o;
  result->body.an_operator.right = r;
  return result;
}

static tree *make_number(int n) {
  tree *result = (tree*) malloc (sizeof(tree));
  result->nodetype  = number_node;
  result->body.a_number = n;
  return result;
}

static tree *make_variable(char v) {
  tree *result = (tree*) malloc (sizeof(tree));
  result->nodetype = variable_node;
  result->body.a_variable = v;
  return result;
}

static void printTree (tree *t, int level) {
#define step 4
  if (t){
    switch (t->nodetype){
      case operator_node:
        printTree (t->body.an_operator.right, level+step);
        printf ("%*c%c\n", level, ' ', t-> body.an_operator.operator);
        printTree (t->body.an_operator.left, level+step);
        break;
      case number_node:
        printf("%*c%d\n", level, ' ', t->body.a_number);
        break;
      case variable_node:
        printf("%*c%c\n", level, ' ', t->body.a_variable);
    }
  }
}
