import ceylon.language.metamodel.declaration {
    AttributeDeclaration
}
import ceylon.language.metamodel {
    ClosedType = Type
}

shared interface Value<out Type>
        satisfies Declaration {

    shared formal actual AttributeDeclaration declaration;
    
    shared formal Type get();
    
    shared formal ClosedType type;
}
