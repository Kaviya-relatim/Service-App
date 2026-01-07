val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

allprojects {
    repositories {
        google()
        mavenCentral()
        // Fallback central mirror
        maven { url = uri("https://repo1.maven.org/maven2") }
        // Flutter artifacts
        maven { url = uri("https://storage.googleapis.com/download.flutter.io") }
        // Community artifacts
        maven { url = uri("https://jitpack.io") }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
