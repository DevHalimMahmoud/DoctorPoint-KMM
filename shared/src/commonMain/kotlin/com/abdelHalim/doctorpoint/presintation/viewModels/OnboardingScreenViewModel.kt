package com.abdelHalim.doctorpoint.presintation.viewModels

import com.abdelHalim.doctorpoint.presintation.models.OnboardingCardData
import dev.icerock.moko.mvvm.livedata.LiveData
import dev.icerock.moko.mvvm.livedata.MutableLiveData
import dev.icerock.moko.mvvm.viewmodel.ViewModel


class OnboardingScreenViewModel : ViewModel() {
    private val _onboardingData: MutableLiveData<Array<OnboardingCardData>> = MutableLiveData(
        arrayOf(
            OnboardingCardData(
                title = "Thousands of doctors",
                description = "Access thousands of Doctors instantly.\nYou can easily contact with the doctors and contact for your needs.",
                image = "onboarding_1"
            ),
            OnboardingCardData(
                title = "Live talk with doctor",
                description = "Easily connect with doctor and start video chat for your better treatment & Prescription.",
                image = "onboarding_2"
            ),
            OnboardingCardData(
                title = "Chat with doctors",
                description = "Book an appointment with doctor. Chat with doctor via appointment letter.\nGet consultent.",
                image = "onboarding_3"
            )
        )
    )
    val onboardingData: LiveData<Array<OnboardingCardData>> = _onboardingData
}
