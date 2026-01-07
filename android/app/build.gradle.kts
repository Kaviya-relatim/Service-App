import java.util.Properties

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Get Flutter SDK path from local.properties or environment
val flutterSdkPath: String = run {
    val localProperties = Properties()
    val localPropertiesFile = rootProject.file("local.properties")
    if (localPropertiesFile.exists()) {
        localPropertiesFile.inputStream().use { localProperties.load(it) }
    }
    localProperties.getProperty("flutter.sdk") 
        ?: System.getenv("FLUTTER_ROOT") 
        ?: throw GradleException("Flutter SDK not found. Define flutter.sdk in local.properties or set FLUTTER_ROOT environment variable.")
}

android {
    namespace = "com.example.relatim"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.example.relatim"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// Add Flutter embedding dependency explicitly to ensure it's available during compilation
dependencies {
    // Flutter embedding - use compileOnly since the Flutter plugin manages runtime inclusion
    compileOnly(files("$flutterSdkPath/bin/cache/artifacts/engine/android-arm64-release/flutter.jar"))
    // Add AndroidX lifecycle dependency for LifecycleOwner
    implementation("androidx.lifecycle:lifecycle-common-java8:2.8.4")
}
