module asq.tree;



class Tree {
    string lexema;
    Tree[] branches;
    
    this(T ...)(T args)
    in {
        assert(args.length > 0);
        assert(is(typeof(args[0]) == string));
    } body {
        this.lexema = args[0];
        foreach (arg; args[1..$]) {
            r_addBranch(arg);
        }
    }
    
    private void r_addBranch(string br) {
        this.branches ~= new Tree(br);
    }
    private void r_addBranch(Tree br) {
        this.branches ~= br;
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