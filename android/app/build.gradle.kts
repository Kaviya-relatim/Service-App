plugins {
    id("com.android.application")
    // Use the Kotlin Android plugin version defined in settings.gradle.kts (1.9.24)
    id("org.jetbrains.kotlin.android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin") version "1.0.0"
}

android {
    namespace = "com.example.relatim"
    compileSdk = 34
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }
    
    sourceSets {
        getByName("main") {
            java.srcDirs("src/main/kotlin")
        }
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.relatim"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 21
        targetSdk = 34
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = false
            isShrinkResources = false
        }
    }
    
    // Ensure the build uses the correct Kotlin version
    tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
        kotlinOptions {
            jvmTarget = "17"
        }
    }
}

flutter {
    source = "../.."
}

// Ensure the Flutter Gradle Plugin is properly configured
afterEvaluate {
    if (project.plugins.hasPlugin("dev.flutter.flutter-gradle-plugin")) {
        println("Flutter Gradle Plugin is properly applied")
    } else {
        println("Warning: Flutter Gradle Plugin may not be properly applied")
    }
}

dependencies {
    // Flutter plugin wires required embedding dependencies automatically; nothing extra needed here.
}
