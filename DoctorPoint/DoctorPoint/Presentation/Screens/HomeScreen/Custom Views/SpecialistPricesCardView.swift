//
//  SpecialistPricesCardView.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 20/06/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared
struct SpecialistPricesCardView: View {
    let specialistPriceCardData : SpecialistPricesCardData

    var body: some View {
        VStack{
            HStack{
                Text(specialistPriceCardData.title).fontWeight(.bold).padding(.top,7).font(.title3).frame(maxWidth: .infinity, alignment: .topLeading).foregroundColor(Color.gray)
                
                Text("$"+specialistPriceCardData.price).font(.caption2).frame(width:44,height: 22,alignment:.center).background(Color("green")).foregroundColor(Color.white).cornerRadius(5, corners: .bottomLeft).offset(y:-6)
                
            }.frame(maxWidth:.infinity,alignment:.top)
            HStack{
                Rectangle().foregroundColor(Color("green")).frame(maxWidth:2,maxHeight: 59)
                Text(specialistPriceCardData.description_).fontWeight(.light).multilineTextAlignment(.leading).font(.caption).frame(width:241,height: 59,alignment:.topLeading).foregroundColor(Color.gray)
            }.frame(maxWidth:.infinity,alignment:.topLeading).padding(.bottom)
        }.padding(.leading).frame(width:287,height: 121,alignment: .topLeading).background(Color.white).cornerRadius(10).shadow(radius: 0.5)
    }
}

struct SpecialistPricesCardView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialistPricesCardView(specialistPriceCardData: .init(title: "Cardio Issues?", description: "For cardio patient here can easily contact with doctor. Can chat & live chat.", price: "100"))
    }
}
