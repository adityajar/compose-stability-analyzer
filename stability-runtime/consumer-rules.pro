# Keep annotations (used at compile-time, small overhead to keep)
-keep @interface com.skydoves.compose.stability.runtime.TraceRecomposition
-keep @interface com.skydoves.compose.stability.runtime.StableForAnalysis
-keep @interface com.skydoves.compose.stability.runtime.IgnoreStabilityReport

# Keep ONLY RecompositionTracker - used by compiler-injected code
# The compiler injects calls to: constructor, trackParameter(), logIfThresholdMet()
-keep class com.skydoves.compose.stability.runtime.RecompositionTracker {
    public <init>(java.lang.String, java.lang.String, int);
    public <methods>;
}

# Keep public API for users who explicitly call ComposeStabilityAnalyzer.setLogger()
# ComposeStabilityAnalyzer is a Kotlin object (singleton), methods are accessed via INSTANCE
# These are only kept if referenced (R8 will remove if unused)
-keep,allowobfuscation class com.skydoves.compose.stability.runtime.ComposeStabilityAnalyzer {
    public <methods>;
}
-keep,allowobfuscation interface com.skydoves.compose.stability.runtime.RecompositionLogger {
    public <methods>;
}
-keep,allowobfuscation class com.skydoves.compose.stability.runtime.RecompositionEvent { *; }
-keep,allowobfuscation class com.skydoves.compose.stability.runtime.ParameterChange { *; }

# Note: StabilityInfo/ComposableInfo/ParameterInfo are only used for JSON generation
# at compile-time. They don't need to be kept in the runtime APK.
# R8 will automatically remove them if unused.
