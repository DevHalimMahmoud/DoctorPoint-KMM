import SwiftUI
import shared

@available(iOS 15.0, *)
@main
struct iOSApp: App {
    let greet = Greeting().greeting()
    var body: some Scene {
        WindowGroup {
            if(isFirstLaunch()){
                OnboardingScreen()
            }else{
//                SigninOrCreateAccountScreen()
                OnboardingScreen()
            }
            
        }
    }
}


func isFirstLaunch() -> Bool {
    if !UserDefaults.standard.bool(forKey: "HasLaunched") {
        UserDefaults.standard.set(true, forKey: "HasLaunched")
        UserDefaults.standard.synchronize()
        return true
    }
    return false
}

