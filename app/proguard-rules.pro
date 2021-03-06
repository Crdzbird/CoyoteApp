-optimizations !code/simplification/arithmetic
-optimizationpasses 5
-allowaccessmodification
# Retrofit does reflection on generic parameters. InnerClasses is required to use Signature and
# EnclosingMethod is required to use InnerClasses.
-keepattributes Signature, InnerClasses, EnclosingMethod

# Retrofit does reflection on method and parameter annotations.
-keepattributes RuntimeVisibleAnnotations, RuntimeVisibleParameterAnnotations

# Retain service method parameters when optimizing.
-keepclassmembers,allowshrinking,allowobfuscation interface * {
    @retrofit2.http.* <methods>;
}

# Ignore annotation used for build tooling.
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement

# Ignore JSR 305 annotations for embedding nullability information.
-dontwarn javax.annotation.**

# Guarded by a NoClassDefFoundError try/catch and only used when on the classpath.
-dontwarn kotlin.Unit

# Top-level functions that can only be used by Kotlin.
-dontwarn retrofit2.KotlinExtensions
-dontwarn retrofit2.KotlinExtensions$*

# With R8 full mode, it sees no subtypes of Retrofit interfaces since they are created with a Proxy
# and replaces all potential values with null. Explicitly keeping the interfaces prevents this.
-if interface * { @retrofit2.http.* <methods>; }
-keep,allowobfuscation interface <1>

# A resource is loaded with a relative path so the package of this class must be preserved.
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase

# OkHttp platform used only on JVM and when Conscrypt dependency is available.
-dontwarn okhttp3.internal.platform.ConscryptPlatform

-keep class ni.jugnicaragua.coyoteapp.model.banks.Banks { *; }
-keep class ni.jugnicaragua.coyoteapp.model.banks.RootBank { *; }
-keep class ni.jugnicaragua.coyoteapp.model.cookie.CookieRequestBDF { *; }
-keep class ni.jugnicaragua.coyoteapp.model.exchangeRate.ExchangeRate { *; }
-keep class ni.jugnicaragua.coyoteapp.model.exchangeRate.RootExchangeRate { *; }
-keep class ni.jugnicaragua.coyoteapp.model.exchangeRate.centralBank.CentralBank { *; }
-keep class ni.jugnicaragua.coyoteapp.model.exchangeRate.centralBank.RootCentralBank { *; }
-keep class ni.jugnicaragua.coyoteapp.model.Event { *; }