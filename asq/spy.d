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
        tree = new Tree(op, tree, rhs.tree);
        return this;
    }
    Spy opBinary(string op, T)(T rhs) {
        tree = new Tree(op, tree, to!string(rhs));
        return this;
    }
    //Spy opBinaryRight(string op)(Spy lhs) { 
    //    Tree oldTree = tree;
    //    tree = new Tree(op);
    //    tree.branches = [lhs.tree, oldTree];
    //    return this;
    //}
    Spy opBinaryRight(string op, T)(T lhs) { 
        tree = new Tree(op, to!string(lhs), tree);
        return this;
    }
    
    // - + ~ * ++ --
    Spy opUnary(string op)() {
        tree = new Tree(op, tree);
        return this;
    }
    
    // .
    Spy opDispatch(string m)() {
        tree = new Tree(".", tree, m);
        return this;
    }
    //T opCast(T)() {
    //    tree = new Tree("cast (" ~ T.stringof ~ ") ", tree);
    //    return T.init;//this;
    //}
//   Spy opEquals(Object a, Object b) {
//        if (a is b) return true;
//        if (a is null || b is null) return false;
//        if (typeid(a) == typeid(b)) return a.opEquals(b);
//        return a.opEquals(b) && b.opEquals(a);
//    }
    
// [TODO] http://dlang.org/spec/operatoroverloading.html
//  == !==
//  < <= >= >
//  f.opCall(args ...); ??
//  [] ????
//  +=	-=	*= ......
//  
}