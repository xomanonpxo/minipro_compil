#ifndef TREE_H
#define TREE_H

enum treetype {operator_node, number_node, variable_node};

typedef struct tree {
  enum treetype nodetype;
  union {
    struct {struct tree *left, *right; char operator;} an_operator;
    int a_number;
    char a_variable;
  } body;
}tree;

static tree *make_operator(tree *l, char o, tree *r);
static tree *make_number(int n);
static tree *make_variable(char v);
static void printTree (tree *t, int level);

#endif
