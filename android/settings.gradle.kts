pluginManagement {
    val flutterSdkPath =
        run {
            val properties = java.util.Properties()
            val propertiesFile = file("local.properties")
            if (propertiesFile.exists()) {
                propertiesFile.inputStream().use { properties.load(it) }
            }

            val flutterSdkPath = properties.getProperty("flutter.sdk") ?: System.getenv("FLUTTER_ROOT")
            require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
            flutterSdkPath
        }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://storage.googleapis.com/download.flutter.io") }
        gradlePluginPortal()
    }
}

plugins {
    id("com.android.application") version "8.6.0" apply false
    // Kotlin 2.1.0 is required by Flutter 3.38.x
    id("org.jetbrains.kotlin.android") version "2.1.0" apply false
}

dependencyResolutionManagement {
    // repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://storage.googleapis.com/download.flutter.io") }
    }
}

include(":app")
