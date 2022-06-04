//
//  OnboardingViewModel.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 04/06/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation

final class ViewModel : ObservableObject{
    
    @Published var  onboardsCards : [OnboardCardData] = [.init(title: "Thousands of doctors", imageName:"onboarding_1", text: "Access thousands of Doctors instantly.\nYou can easily contact with the doctors and contact for your needs."),
                                                     .init(title:"Live talk with doctor", imageName:"onboarding_2", text: "Easily connect with doctor and start video chat for your better treatment & Prescription.")
                                                     ,.init(title: "Chat with doctors", imageName: "onboarding_3", text: "Book an appointment with doctor. Chat with doctor via appointment letter.\nGet consultent.")
    ]
    
    func newCard (card : OnboardCardData){
        self.onboardsCards.append(card)
    }
    
    
}
