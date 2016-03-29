@noanno
suppressWarnings("unusedDeclaration")
class SmallInteger(shared small Integer intp) {
    small variable Integer inta = intp;
    small Integer intad;
    this.intad = 1;
    
    // TODO setters!
    // TODO captured variables
    shared small Integer intgs => 1;
    assign intgs {}
    
    void intAssignmentOps() {
        variable Integer long = 1000*1000*1000*1000;
        inta = long;
        this.inta = 1;
        this.inta = long;
        intgs = long;
        long = inta;
        inta = 2147483647;
        inta = -2147483648;
        inta = 2147483648;
        inta = -2147483649;
        
        small value localintgs => 1;
        assign localintgs {
            
        }
        localintgs = long;
        long = localintgs;
        
        long = inta = 2147483647;
        inta = long = 2147483647;
    }
    
    shared small Integer intCalc(small Integer intp) {
        small value intl = this.intp;
        inta = intp * this.inta * intl;
        return inta;
    }
    
    shared void intSmallArithmeticOperators() {
        // These should all be transformed as int expressions
        inta = inta + intp;
        inta = inta - intp;
        inta = inta * intp;
        inta = inta / intp;
        inta = inta % intp;
        inta = inta ^ intp;
        
        inta += intp;
        inta -= intp;
        inta *= intp;
        inta /= intp;
        inta %= intp;
        
        inta++;
        inta--;
        ++inta;
        --inta;
    }
    shared void intMixedArithmeticOperators() {
        // These should all be transformed as long expressions
        value long = 0;
        inta = inta + long;
        inta = inta - long;
        inta = inta * long;
        inta = inta / long;
        inta = inta % long;
        inta = inta ^ long;
        
        inta += long;
        inta -= long;
        inta *= long;
        inta /= long;
        inta %= long;
    }
    
    shared void intComparisonOps() {
        
        variable value c = inta == intp;
        c = inta != intp;
        c = inta < intp;
        c = inta <= intp;
        c = inta > intp;
        c = inta >= intp;
        c = 0 < inta < intp;
        c = 0 <= inta <= intp;
        
        variable value cmp = inta <=> intp;
    }
    
    
    void intParamDefault(p1=1, small Integer p2=p1) {
        small Integer p1;
    }
    
    void powerMethodIsNotSmall(small Integer x, small Integer y) {
        small variable value addition = x+y;
        addition = x.plus(y);
        small variable value exponentiation = x^y;
        // because we're calling it as a *method* the following should 
        // dispatch to Integer.power(long, long), not Integer.power(int, int)
        exponentiation = x.power(y);
        exponentiation = x.power{other=y;};
        value exp2 = x.power{other=y;};
    }
    
    void argumentConversion() {
        powerMethodIsNotSmall(1, 1);
        powerMethodIsNotSmall{
            x=1; 
            y=1;
        };
        powerMethodIsNotSmall{
            x=1; 
            y=>1;
        };
    }
    
    
    shared void intRangeOps() {
        // not optimizable because : means measure() whose first parameter is a type parameter
        // so gets boxed
        variable value range = inta:intp;
        for (i in inta:intp) {
            
        }
        value long = 0;
        for (i in long:intp) {
            
        }
        for (i in 0:10) {
            
        }
        // not optimizable because .. means span() whose parameters are a type parameter
        // so gets boxed
        range = inta..intp;
        for (i in inta..intp) {
            
        }
    }
    
    /*
    shared void intMethods() {
        // TODO plus bitshifting and bit masking
    }
    shared void otherIntTerms() {
        small value x = if (1==1) then 1 else inta;
        small value y = switch(x) case (1) 1 case(2) inta else intp;
        small value z = let(a = x, b=y) a+b;
        small value c = (1==1) then 1 else 2;
    }
    
    
    
    shared void range() {
        for (x in 0:10) {
            
        }
        //value y = {for (x in 0:10) if (x%2==0) x*2 };
        /* TODO for (x in 0..10) {
            
        }*/
        
    }
     */
    // TODO test every kind of function and value declaration
    // functional parameters!
    
    // TODO stop setting the underlying type directly in the model loader, set the 
    // small bit of the model instead
    
    
     
}
