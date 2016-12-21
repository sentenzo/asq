module asq;

import std.variant;
import asq.op;

class Asq {
    private Variant[] _initArgs;
    this(T...)(T initArgs) {
        _initArgs = variantArray(initArgs);
    }
    override string toString() const {
        string ret = "";
        ret ~= "_initArgs:";
        foreach(Variant v; _initArgs) {
            ret ~= "\n\t" ~ v.type.toString;
            ret ~= "\n\t\t" ~ v.toString;
        }
        return ret;
    }
    private class _TR_Asq {
        private Asq _q;
        private Op[] _opSeq;
        this (Asq q, Op[] opSeq) { 
            _q = q; 
            _opSeq = opSeq;
        }
        Op[] accumulate() {
            return _opSeq;
        }
        Variant eval() {
            string ret = "Operators:";
            foreach(Op op; _opSeq) {
                ret ~= "\n::" ~ op.toString();
            }
            return Variant(ret);
        }
        _TR_Asq opDispatch(string m)() {
            _opSeq ~= new Op(m);
            return this;
        }
    }
    auto opDispatch(string m)() {
        return new _TR_Asq(this, [new Op(m)]);
    }
}