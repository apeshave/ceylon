package com.redhat.ceylon.model.typechecker.model;

public class InterfaceAlias extends Interface {
    
    @Override
    public boolean isAlias() {
        return true;
    }
    
    @Override
    public Interface getExtendedTypeDeclaration() {
        ClassOrInterface etd = 
                super.getExtendedTypeDeclaration();
        if (etd instanceof Interface) {
            return (Interface) etd;
        }
        else {
            return null;
        }
    }
    
}
