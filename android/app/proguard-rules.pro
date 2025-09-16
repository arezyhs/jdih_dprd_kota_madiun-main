#Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Keep Play Core for deferred components (fix R8 error)
-keep class com.google.android.play.** { *; }
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.**
