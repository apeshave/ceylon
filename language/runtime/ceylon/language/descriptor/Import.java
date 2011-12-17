package ceylon.language.descriptor;

import com.redhat.ceylon.compiler.metadata.java.Ceylon;
import com.redhat.ceylon.compiler.metadata.java.Defaulted;
import com.redhat.ceylon.compiler.metadata.java.Ignore;
import com.redhat.ceylon.compiler.metadata.java.Name;
import com.redhat.ceylon.compiler.metadata.java.TypeInfo;

@Ceylon
public class Import {
    private final ceylon.language.Quoted name;
    private final ceylon.language.Quoted version;
    
    @TypeInfo("ceylon.language.Quoted")
    public final ceylon.language.Quoted getName() {
        return name;
    }
    
    @TypeInfo("ceylon.language.Quoted")
    public final ceylon.language.Quoted getVersion() {
        return version;
    }
    private final boolean optional;
    
    @TypeInfo("ceylon.language.Boolean")
    public final boolean getOptional() {
        return optional;
    }
    private final boolean export;
    
    @TypeInfo("ceylon.language.Boolean")
    public final boolean getExport() {
        return export;
    }
    
    @TypeInfo("ceylon.language.String")
    public final java.lang.String toString() {
        return new java.lang.StringBuilder().append("Import[").append(name.toString()).append("/").append(version.toString()).append("]").toString();
    }
    
    public Import(@Name("name")
    @TypeInfo("ceylon.language.Quoted")
    ceylon.language.Quoted name, @Name("version")
    @TypeInfo("ceylon.language.Quoted")
    ceylon.language.Quoted version, @Name("optional")
    @Defaulted
    @TypeInfo("ceylon.language.Boolean")
    boolean optional, @Name("export")
    @Defaulted
    @TypeInfo("ceylon.language.Boolean")
    boolean export) {
        this.name = name;
        this.version = version;
        this.optional = optional;
        this.export = export;
    }
    
    @Ignore
    public static final class Import$impl {
        
        @TypeInfo("ceylon.language.Boolean")
        public static boolean $init$optional(@Name("name")
        @TypeInfo("ceylon.language.Quoted")
        final ceylon.language.Quoted name, @Name("version")
        @TypeInfo("ceylon.language.Quoted")
        final ceylon.language.Quoted version) {
            return false;
        }
        
        @TypeInfo("ceylon.language.Boolean")
        public static boolean $init$export(@Name("name")
        @TypeInfo("ceylon.language.Quoted")
        final ceylon.language.Quoted name, @Name("version")
        @TypeInfo("ceylon.language.Quoted")
        final ceylon.language.Quoted version, @Name("optional")
        @Defaulted
        @TypeInfo("ceylon.language.Boolean")
        final boolean optional) {
            return false;
        }
    }
}
