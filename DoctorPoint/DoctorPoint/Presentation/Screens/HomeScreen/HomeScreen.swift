//
//  HomeScreen.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 19/06/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared
struct HomeScreen: View {
    var vm = HomeScreenViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    //    @Binding var selectedTab :String
    
    var body: some View {
        ScrollView{
            GeometryReader { geometry in
                
                Spacer().frame(maxHeight:geometry.safeAreaInsets.top)
            }.padding()
            HStack{
                Image("abdelHalim").resizable().frame(width: 40,height: 40).cornerRadius(15)
                VStack{
                    Text("AbdelHalim").fontWeight(.semibold)
                        .font(.title2).foregroundColor(.gray).frame(maxWidth:.infinity,alignment:.leading)
                    Text("Find your suitable doctor here").fontWeight(.light)
                        .font(.body).foregroundColor(.gray).frame(maxWidth:.infinity,alignment:.leading)
                }
                Image("calender").resizable().frame(width: 40,height: 40).frame(alignment:.center)
                
            }.frame(maxWidth:.infinity,alignment:.leading).padding()
            Image("search_box").resizable().padding(.horizontal)
            
            Text("Specialist").fontWeight(.semibold)
                .font(.title2).foregroundColor(.gray).frame(maxWidth:.infinity,alignment:.leading).padding(.horizontal).padding(.top)
            
            
            ScrollView (.horizontal, showsIndicators: false) {
                LazyHStack  {
                    ForEach ((0...vm.specialityData.value!.size-1), id: \.self) {index in
                        SpecialistCardView( specialistCardData: (vm.specialityData.value?.get(index: index))!)
                    }
                    
                }.padding(.horizontal)
            }.padding(.bottom)
            
            ScrollView (.horizontal, showsIndicators: false) {
                LazyHStack  {
                    ForEach ((0...vm.specialityPricesData.value!.size-1), id: \.self) {index in
                        SpecialistPricesCardView( specialistPriceCardData: (vm.specialityPricesData.value?.get(index: index))!)
                    }
                    
                }.padding(.horizontal)
            }
            
            Text("Top doctors").fontWeight(.semibold)
                .font(.title2).foregroundColor(.gray).frame(maxWidth:.infinity,alignment:.leading).padding(.horizontal).padding(.top)
            ScrollView(.horizontal,showsIndicators: false){
                LazyHStack{
                    ForEach((0...vm.topDoctorsCardData.value!.size-1),id: \.self){ index in
                        TopDoctorsCardView(topDoctorCardData: (vm.topDoctorsCardData.value?.get(index: index))!)
                    }
                }.padding(.horizontal)
            }
            
            Spacer().padding(50)
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true).navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top).edgesIgnoringSafeArea(.top).background(Color("white").edgesIgnoringSafeArea(.all))
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
