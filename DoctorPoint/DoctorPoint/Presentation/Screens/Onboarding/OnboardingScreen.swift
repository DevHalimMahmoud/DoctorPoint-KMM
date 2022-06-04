//
//  OnboardingScreen.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 04/06/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct OnboardingScreen: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        ZStack{
            TabView{
                ForEach(vm.onboardsCards){card in
                    CardView( onboardCard: card).frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
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
