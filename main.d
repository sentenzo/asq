import std.stdio;

import std.variant;

import asq;
import asq.op;
import asq.tree;

void main() {
    //Asq b = new Asq("123", 123);
    //auto c = b.hello.world;
    //writeln(b.hello.world.eval);
    //writeln(b.silk.demise.eval);
    
    {
        import asq.spy;
        Spy a = new Spy();
        Spy b = new Spy();
        Spy s = -(1 - (a.length + 1)) * cast(int)b / 1;
        writeln(s.tree);
    }
}

class SuperVariantContainer {
    Variant[string] vars;

    ref Variant opDispatch(string m)() {
        if( m !in vars) {
            vars[m] = null;
        }
        return vars[m];
    }
    
}
