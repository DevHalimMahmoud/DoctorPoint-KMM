//
//  SpecialistCardView.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 19/06/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared
struct SpecialistCardView: View {
    let specialistCardData : SpecialistCardData
    
    var body: some View {
        VStack{
            Image(specialistCardData.image).padding(.vertical,5).frame(alignment:.top)
            Text(specialistCardData.speciality).foregroundColor(.white).fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal,5).font(.subheadline).frame(alignment:.center)
            Text(specialistCardData.numberOfDoctors+" Doctors").foregroundColor(.white).fontWeight(.light).multilineTextAlignment(.center).font(.caption2).frame(alignment:.bottom)
        }.frame(width:90,height: 132).background(Color (hex: specialistCardData.color)).cornerRadius(10)
    }
}

struct SpecialistCardView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialistCardView(specialistCardData: .init(speciality: "Cardio Specialist", numberOfDoctors: "21", image: "lungs", color: "#129A7F"))
    }
}
