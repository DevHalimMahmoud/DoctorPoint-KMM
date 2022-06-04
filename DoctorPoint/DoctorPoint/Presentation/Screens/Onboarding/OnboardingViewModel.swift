//
//  OnboardingViewModel.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 04/06/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import shared

final class ViewModel : ObservableObject{
    
    @Published var  onboardsCards : [OnboardingCardData] = [.init(title: "Thousands of doctors", description: "Access thousands of Doctors instantly.\nYou can easily contact with the doctors and contact for your needs.", image:"onboarding_1"),
                                                            .init(title:"Live talk with doctor", description: "Easily connect with doctor and start video chat for your better treatment & Prescription.", image:"onboarding_2")
                                                            ,.init(title: "Chat with doctors", description: "Book an appointment with doctor. Chat with doctor via appointment letter.\nGet consultent.", image: "onboarding_3")
    ]
    
    func newCard (card : OnboardingCardData){
        self.onboardsCards.append(card)
    }
    
    
}
