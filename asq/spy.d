module asq.spy;

import std.conv:to;

// (x => -(5 - x/3))

//[-]
//  |
// [-]
//  |--(5)
//  |--[/]
//      |--(x)
//      |--(3)

import asq.tree;

class Spy {
    immutable string varName = "%";
    static int inc = 0;
    private int num;
    Tree tree;
    
    this() {
        num = inc;
        inc += 1;
        tree = new Tree(varName ~ to!string(num));
    }
    
    // + - * / % ^^ & | ^ << >> >>> ~ in
    Spy opBinary(string op)(Spy rhs) {
        Tree oldTree = tree;
        tree = new Tree(op);
        tree.branches = [oldTree, rhs.tree];
        return this;
    }
    Spy opBinary(string op, T)(T rhs) {
        Tree oldTree = tree;
        tree = new Tree(op);
        tree.branches = [oldTree, new Tree(to!string(rhs))];
        return this;
    }
    //Spy opBinaryRight(string op)(Spy lhs) { 
    //    Tree oldTree = tree;
    //    tree = new Tree(op);
    //    tree.branches = [lhs.tree, oldTree];
    //    return this;
    //}
    Spy opBinaryRight(string op, T)(T lhs) { 
        Tree oldTree = tree;
        tree = new Tree(op);
        tree.branches = [new Tree(to!string(lhs)), oldTree];
        return this;
    }
    
    // - + ~ * ++ --
    Spy opUnary(string op)() {
        Tree oldTree = tree;
        tree = new Tree(op);
        tree.branches = [oldTree];
        return this;
    }
    
    // .
    Spy opDispatch(string m)() {
        Tree oldTree = tree;
        tree = new Tree(".");
        tree.branches = [oldTree, new Tree(m)];
        return this;
    }
    
// [TODO] http://dlang.org/spec/operatoroverloading.html
//  == !==
//  < <= >= >
//  f.opCall(args ...); ??
//  [] ????
//  +=	-=	*= ......
//  
}