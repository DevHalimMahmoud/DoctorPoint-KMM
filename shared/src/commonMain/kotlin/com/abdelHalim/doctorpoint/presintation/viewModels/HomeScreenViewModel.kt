package com.abdelHalim.doctorpoint.presintation.viewModels

import com.abdelHalim.doctorpoint.presintation.models.SpecialistCardData
import com.abdelHalim.doctorpoint.presintation.models.SpecialistPricesCardData
import com.abdelHalim.doctorpoint.presintation.models.TopDoctorsCardData
import dev.icerock.moko.mvvm.livedata.LiveData
import dev.icerock.moko.mvvm.livedata.MutableLiveData
import dev.icerock.moko.mvvm.viewmodel.ViewModel

class HomeScreenViewModel : ViewModel() {
    private val _specialityData: MutableLiveData<Array<SpecialistCardData>> = MutableLiveData(
        arrayOf(
            SpecialistCardData(
                speciality = "Cardio\nSpecialist",
                numberOfDoctors = "27",
                image = "lungs",
                color = "#129A7F"
            ),
            SpecialistCardData(
                speciality = "Heart\nIssue",
                numberOfDoctors = "43",
                image = "heart-1",
                color = "#5554DB"
            ),
            SpecialistCardData(
                speciality = "Dental\nCare",
                numberOfDoctors = "19",
                image = "tooth",
                color = "#FFA873"
            ),
            SpecialistCardData(
                speciality = "Physio\nTherapy",
                numberOfDoctors = "7",
                image = "wheelchair",
                color = "#A079EC"
            ),
        )
    )
    val specialityData: LiveData<Array<SpecialistCardData>> = _specialityData

    private val _specialityPricesData: MutableLiveData<Array<SpecialistPricesCardData>> =
        MutableLiveData(
            arrayOf(
                SpecialistPricesCardData(
                    title = "Cardio Issues?",
                    price = "100",
                    description = "For cardio patient here can easily contact with doctor. Can chat & live \nchat."
                ),
                SpecialistPricesCardData(
                    title = "Dental Treatments",
                    price = "200",
                    description = "For Dental patient here can easily contact with doctor. Can chat & live \nchat."
                ),
            )
        )
    val specialityPricesData: LiveData<Array<SpecialistPricesCardData>> = _specialityPricesData

    private val _topDoctorsCardData: MutableLiveData<Array<TopDoctorsCardData>> = MutableLiveData(
        arrayOf(
            TopDoctorsCardData(
                name = "Dr.AbdelHalim",
                speciality = "Cardio Specialist",
                image = "abdelHalim",
            ),
            TopDoctorsCardData(
                name = "Dr. Mahmud Naser",
                speciality = "Heart Surgeon",
                image = "doctor-1",
            ),
            TopDoctorsCardData(
                name = "Dr. Daniela M",
                speciality = "Cardio Surgeon",
                image = "doctor-2",
            ),
            TopDoctorsCardData(
                name = "Dr. Mahmud Naser",
                speciality = "Heart Surgeon",
                image = "doctor-1",
            ),
        )
    )
    val topDoctorsCardData: LiveData<Array<TopDoctorsCardData>> = _topDoctorsCardData
}