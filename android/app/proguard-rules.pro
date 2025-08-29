-keep class com.razorpay.** { *; }
-keep class proguard.annotation.** { *; }
-dontwarn proguard.annotation.**
# Example for Gson
-keep class com.google.gson.** { *; }
-keepattributes Signature

# Example for Retrofit
-keep class retrofit2.** { *; }
-dontwarn retrofit2.**
# Razorpay Proguard rules

-dontwarn com.razorpay.**
