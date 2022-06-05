import SwiftUI
import shared

@available(iOS 15.0, *)
@main
struct iOSApp: App {
//    let greet = Greeting().greeting()
    var body: some Scene {
        WindowGroup {
            if(FirstLaunchKt.firstLaunch()){
                OnboardingScreen()
            }else{
                SigninOrCreateAccountScreen()
            }
        }
    }
}

