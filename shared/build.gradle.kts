plugins {
    kotlin("multiplatform")
    kotlin("native.cocoapods")
    id("com.android.library")
}

version = "1.0"
kotlin {
    android()
    iosX64()
    iosArm64()
    iosSimulatorArm64()

    cocoapods {
        summary = "Some description for the Shared Module"
        homepage = "Link to the Shared Module homepage"
        ios.deploymentTarget = "14.1"
        podfile = project.file("../DoctorPoint/Podfile")
        framework {
            baseName = "shared"
            export("dev.icerock.moko:mvvm-core:0.13.0")
            export("dev.icerock.moko:mvvm-livedata:0.13.0")
            export("dev.icerock.moko:mvvm-livedata-resources:0.13.0")
            export("dev.icerock.moko:mvvm-state:0.13.0")
        }
    }
    
    sourceSets {
        val commonMain by getting {
            dependencies {
                api("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.6.1")
                //MVVM

                api("dev.icerock.moko:mvvm-core:0.13.0")
                api("dev.icerock.moko:mvvm-livedata:0.13.0")
                api("dev.icerock.moko:mvvm-livedata-resources:0.13.0")
                api("dev.icerock.moko:mvvm-state:0.13.0")
            }
        }
        val commonTest by getting {
            dependencies {
                implementation(kotlin("test"))
            }
        }
        val androidMain by getting
        val androidTest by getting
        val iosX64Main by getting
        val iosArm64Main by getting
        val iosSimulatorArm64Main by getting
        val iosMain by creating {
            dependsOn(commonMain)
            iosX64Main.dependsOn(this)
            iosArm64Main.dependsOn(this)
            iosSimulatorArm64Main.dependsOn(this)
        }
        val iosX64Test by getting
        val iosArm64Test by getting
        val iosSimulatorArm64Test by getting
        val iosTest by creating {
            dependsOn(commonTest)
            iosX64Test.dependsOn(this)
            iosArm64Test.dependsOn(this)
            iosSimulatorArm64Test.dependsOn(this)
        }
    }

}

android {
    compileSdk = 32
    sourceSets["main"].manifest.srcFile("src/androidMain/AndroidManifest.xml")
    defaultConfig {
        minSdk = 24
        targetSdk = 32
    }
}
//dependencies {
//    implementation("androidx.lifecycle:lifecycle-viewmodel-ktx:2.4.1")
//}
