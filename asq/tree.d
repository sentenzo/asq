module asq.tree;



class Tree {
    string lexema;
    Tree[] branches;
    
// [TODO] 
//  this(string lexema, args...); 
//  this(string lexema, Tree, Tree); 
//  this(string lexema, Tree, to!string(T));
    this(string lexema) {
        this.lexema = lexema;
        branches = [];
    }
    
    override string toString() const {
        return toStringRec();
    }
    
    string toStringRec(int depth = 0) const {
        string lvl = "";
        for(int i=0; i<depth; i+=1) {
            lvl ~= "  |";
        }
        string ret = lvl ~ "-(" ~ lexema ~ ")\n";
        foreach(ref t; branches) {
            ret ~= t.toStringRec(depth + 1);
        }
        return ret;
    } 
}