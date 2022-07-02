//
//  SearchScreen.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 02/07/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared
@available(iOS 15.0, *)
struct SearchScreen: View {
    @State private var date: String = ""
    @FocusState private var focusedField: Field?
    enum Field: Hashable {
        case myField
    }
    var vm = HomeScreenViewModel()
    
    var body: some View {
        ScrollView{
            
                GeometryReader { geometry in
                    
                    Spacer().frame(maxHeight:geometry.safeAreaInsets.top)
                }.padding()
            HStack{
                HStack {
                    Text("Dr").padding(.leading)
                    TextField("", text: $date).multilineTextAlignment(.leading).textContentType(.name)
                        .keyboardType(.namePhonePad).focused($focusedField, equals: .myField).autocapitalization(.none)
                        .disableAutocorrection(true).frame(height:50).accentColor(Color("green"))
                    Image("magnifier_colored").resizable().frame(width:20,height:20).padding(.trailing)
                }.background(Color.white).cornerRadius(10)
            }.padding(.horizontal)
            
            
                LazyVStack{
                    ForEach((0...vm.topDoctorsCardData.value!.size-1),id: \.self){ index in
                        TopDoctorsCardView(topDoctorCardData: (vm.topDoctorsCardData.value?.get(index: index))!)
                    }
                }.padding(.horizontal)
            
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true).navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top).edgesIgnoringSafeArea(.top).background(Color("white").edgesIgnoringSafeArea(.all))
    }
}

@available(iOS 15.0, *)
struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
