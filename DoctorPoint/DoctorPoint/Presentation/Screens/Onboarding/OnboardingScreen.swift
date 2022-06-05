//
//  OnboardingScreen.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 04/06/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared
struct OnboardingScreen: View {
    var vm = OnboardingScreenViewModel()
    
    var body: some View {
        ZStack{
            TabView{
                ForEach ((0...vm.onboardingData.value!.size-1), id: \.self) {index in
                    CardView( onboardCard: (vm.onboardingData.value?.get(index: index))!).frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
                }.frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
            }.ignoresSafeArea()
                .frame(maxWidth:.infinity,maxHeight: .infinity,alignment:.top)
                .tabViewStyle(.page).indexViewStyle(.page(backgroundDisplayMode: .never))
        }.ignoresSafeArea().frame(maxWidth:.infinity,maxHeight:.infinity,alignment:.top).background(Color("kinda_gray")).edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}
