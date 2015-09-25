import ceylon.language.meta.declaration{...}
import ceylon.language.meta.model{CallableConstructor, TypeApplicationException}


"doc"
class Bug750Init<T>(String s) {
    
}
class Bug750Ctors<T> {
    shared new(String s) {}
    shared new other(String s) {} 
}
class Bug750NoDefault<T> {
    shared new other(String s) {} 
}

@test
shared void bug750() {
    ClassWithInitializerDeclaration bug750Init = `class Bug750Init`;
    ClassWithConstructorsDeclaration bug750Ctors= `class Bug750Ctors`;
    ClassWithConstructorsDeclaration bug750NoDefault= `class Bug750NoDefault`;
    CallableConstructorDeclaration ctor = `new Bug750Ctors`;
    CallableConstructorDeclaration init = bug750Init.defaultConstructor;
    
    assert(1 == bug750Init.parameterDeclarations.size);
    assert(bug750Init.getParameterDeclaration("s") exists);
    assert(!bug750Init.getParameterDeclaration("t") exists);
    
    assert(exists pl = bug750Ctors.parameterDeclarations,
        pl.size == 1);
    assert(bug750Ctors.getParameterDeclaration("s") exists);
    assert(!bug750Ctors.getParameterDeclaration("t") exists);
    assert(exists c= bug750Ctors.defaultConstructor,
        ctor == c);
    
    assert(!bug750NoDefault.parameterDeclarations exists);
    assert(!bug750NoDefault.getParameterDeclaration("s") exists);
    assert(!bug750NoDefault.defaultConstructor exists);
    
    // now test init
    assert(1 == init.parameterDeclarations.size);
    assert(init.getParameterDeclaration("s") exists);
    assert(!init.getParameterDeclaration("t") exists);
    
    assert(!init.abstract);
    assert(init.defaultConstructor);
    assert(!init.annotation);
    assert(!init.actual);
    assert(!init.default);
    assert(!init.formal);
    assert(init.shared);
    assert(!init.toplevel);
    // XXX What are the semantics fo this? In Ceylon-land a ClassWithInitiaizer
    // I guess it should return all those annotations which are permitted on a constructor?
    //assert(!init.annotated<SharedAnnotation>());
    //assert(init.annotated<DocAnnotation>());
    //assert(!init.annotated<FormalAnnotation>());
    //assert(init.annotations<SharedAnnotation>().empty);
    //assert(!init.annotations<DocAnnotation>().empty);
    
    // apply
    CallableConstructor<Bug750Init<String>,[String]> appliedCtor = init.apply<Bug750Init<String>,[String]>(`String`);
    try {
        init.memberApply<Object,Bug750Init<String>,[String]>(`Object`);
        assert(false);
    } catch (TypeApplicationException e) {}
    
    //container
    assert(bug750Init == init.container);
    
    /*// invoke
    assert(is Bug750Init<String> inst= init.invoke([`String`], ""));
    try {
        init.memberInvoke(init, [], "");
        assert(false);
    } catch (TypeApplicationException e) {}
    */
    // type parameters
    assert(!init.typeParameterDeclarations.empty);
    
    // name
    assert("" == init.name);
    
    // qualifiedName
    assert("metamodel::Bug750Init" == init.qualifiedName);
    
    Bug750Outer().bug750();
}

class Bug750Outer() {
    "doc"
    class Bug750Init<T>(String s) {
        
    }
    class Bug750Ctors<T> {
        shared new(String s) {}
        shared new other(String s) {} 
    }
    class Bug750NoDefault<T> {
        shared new other(String s) {} 
    }
    
    shared void bug750() {
        ClassWithInitializerDeclaration bug750Init = `class Bug750Init`;
        ClassWithConstructorsDeclaration bug750Ctors= `class Bug750Ctors`;
        ClassWithConstructorsDeclaration bug750NoDefault= `class Bug750NoDefault`;
        CallableConstructorDeclaration ctor = `new Bug750Ctors`;
        CallableConstructorDeclaration init = bug750Init.defaultConstructor;
        
        assert(1 == bug750Init.parameterDeclarations.size);
        assert(bug750Init.getParameterDeclaration("s") exists);
        assert(!bug750Init.getParameterDeclaration("t") exists);
        
        assert(exists pl = bug750Ctors.parameterDeclarations,
            pl.size == 1);
        assert(bug750Ctors.getParameterDeclaration("s") exists);
        assert(!bug750Ctors.getParameterDeclaration("t") exists);
        assert(exists c= bug750Ctors.defaultConstructor,
            ctor == c);
        
        assert(!bug750NoDefault.parameterDeclarations exists);
        assert(!bug750NoDefault.getParameterDeclaration("s") exists);
        assert(!bug750NoDefault.defaultConstructor exists);
        
        // now test init
        assert(1 == init.parameterDeclarations.size);
        assert(init.getParameterDeclaration("s") exists);
        assert(!init.getParameterDeclaration("t") exists);
        
        assert(!init.abstract);
        assert(init.defaultConstructor);
        assert(!init.annotation);
        assert(!init.actual);
        assert(!init.default);
        assert(!init.formal);
        assert(init.shared);
        assert(!init.toplevel);
        // XXX What are the semantics fo this? In Ceylon-land a ClassWithInitiaizer
        // I guess it should return all those annotations which are permitted on a constructor?
        //assert(!init.annotated<SharedAnnotation>());
        //assert(init.annotated<DocAnnotation>());
        //assert(!init.annotated<FormalAnnotation>());
        //assert(init.annotations<SharedAnnotation>().empty);
        //assert(!init.annotations<DocAnnotation>().empty);
        
        // apply
        try {
            CallableConstructor<Bug750Init<String>,[String]> appliedCtor = init.apply<Bug750Init<String>,[String]>(`String`);
            assert(false);
        } catch (TypeApplicationException e) {}
        
        init.memberApply<Bug750Outer,Bug750Init<String>,[String]>(`Bug750Outer`, `String`);
        
        //container
        assert(bug750Init == init.container);
        
        /*// invoke
         assert(is Bug750Init<String> inst= init.invoke([`String`], ""));
         try {
         init.memberInvoke(init, [], "");
         assert(false);
         } catch (TypeApplicationException e) {}
         */
        // type parameters
        assert(!init.typeParameterDeclarations.empty);
        
        // name
        assert("" == init.name);
        
        // qualifiedName
        print("££££££££££££££££££ ``init.qualifiedName``");
        assert("metamodel::Bug750Outer.Bug750Init" == init.qualifiedName);
    }
}