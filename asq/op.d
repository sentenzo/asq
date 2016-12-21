module asq.op;
import asq.spy;

class Op {
    string name;
    this(string name) {
        this.name = name;
    }
    override string toString() const {
        return name;
    }
}

