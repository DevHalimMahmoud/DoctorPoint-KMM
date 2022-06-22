//
//  TopDoctorsCardView.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 21/06/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared
struct TopDoctorsCardView: View {
    let topDoctorCardData: TopDoctorsCardData
    var body: some View {
        VStack{
            Image(topDoctorCardData.image).resizable().frame(width: 110, height: 125, alignment: .top).cornerRadius(25).padding(.vertical,5)
            Text(topDoctorCardData.name).fontWeight(.semibold).foregroundColor(Color.gray).font(.subheadline)
            Text(topDoctorCardData.speciality).foregroundColor(Color.gray).font(.caption)
        }.frame(width: 130, height: 188, alignment: .top).background(Color.white).cornerRadius(10)
        
    }
}

struct TopDoctorsCardView_Previews: PreviewProvider {
    static var previews: some View {
        TopDoctorsCardView(topDoctorCardData: .init(name: "Dr. AbdelHalim", image: "abdelHalim", speciality: "Developer"))
    }
}
