//
//  SetupProfileScreen.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 06/06/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
struct SetupProfileScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var selection: Int? = nil
    @FocusState private var focusedField: Field?
    @State private var gender: String = "Select your gender"
    @State private var date: String = ""
    
    @State private var address: String = ""
    
    
    enum Field: Hashable {
        case myField
    }
    var body: some View {
        VStack(){
            ScrollView{
                Text("Set up your profile")
                    .fontWeight(.semibold)
                    .font(.title).foregroundColor(.gray).frame(maxWidth:.infinity,alignment:.leading)
                
                Text("Update  your profile to connect your doctor with better impression.").fontWeight(.light).foregroundColor(Color.gray).font(.subheadline).multilineTextAlignment(.leading).frame(maxWidth:.infinity,alignment:.leading).padding(.vertical)
                Spacer().frame(height: 15)
                Image("profile_image")
                Spacer().frame(height: 15)
                Group{
                    Spacer().frame(height: 15)
                    
                    HStack {
                        
                        Image("gender").resizable().frame(width: 25,height: 20)
                        Spacer().frame(width: 20)
                        Text("Gender")
                            .fontWeight(.semibold)
                            .font(.body)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28,alignment: .leading)
                    .padding(.vertical,5)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
                    HStack {
                        
                        Menu {
                            Button("Male", action: {gender="Male"})
                            Button("Female", action: {gender="Female"})
                            Button("Other", action: {gender="Other"})
                        } label: {
                            HStack{
                                Text(gender).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(Color.gray)
                                Image("arrow_down").resizable().frame(width: 20,height: 10,alignment: .trailing)
                                
                            }.frame(maxWidth:.infinity,alignment: .leading)
                            
                        }.frame(maxWidth:.infinity,alignment: .leading)
                        
                    }.textFieldStyle(DefaultTextFieldStyle())
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Image("date").resizable().frame(width: 18,height: 20)
                        Spacer().frame(width: 20)
                        Text("Date of birth")
                            .fontWeight(.semibold)
                            .font(.body)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28,alignment: .leading)
                    .padding(.bottom,5).padding(.top)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
                    HStack {
                        TextField("Type of your birth date", text: $date).multilineTextAlignment(.leading).textContentType(.dateTime)
                            .keyboardType(.emailAddress).focused($focusedField, equals: .myField).autocapitalization(.none)
                            .disableAutocorrection(true)
                    }.textFieldStyle(DefaultTextFieldStyle())
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    
                    Spacer().frame(height: 15)
                    
                    HStack {
                        Image("location").resizable().frame(width: 18,height: 22)
                        Spacer().frame(width: 20)
                        Text("Address")
                            .fontWeight(.semibold)
                            .font(.body)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28,alignment: .leading)
                    .padding(.bottom,5).padding(.top)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
                    HStack {
                        
                        TextField("Enter your address", text: $address).multilineTextAlignment(.leading).textContentType(.addressCityAndState)
                            .keyboardType(.emailAddress).focused($focusedField, equals: .myField).autocapitalization(.none)
                            .disableAutocorrection(true)
                    }.textFieldStyle(DefaultTextFieldStyle())
                    
                }
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
            }
            HStack(alignment:.bottom){
                NavigationLink(destination: RecoveryPasswordScreen(), tag: 2, selection: $selection) {
                    Button(action: {
                        print("tapped!")
                        self.selection = 2
                    }) {
                        HStack {
                            Text("Complete")
                                .fontWeight(.semibold)
                                .font(.body).padding()
                        }
                        .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("green"))
                        .cornerRadius(15)
                    }.frame(alignment:.bottom).padding(.bottom)
                }.frame(alignment:.bottom)
                
                
            }.frame(alignment: .bottom)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .topLeading).navigationBarBackButtonHidden(true).navigationBarItems(leading: Image("back_button").frame(alignment:.bottomLeading).onTapGesture(perform: {
            self.presentationMode.wrappedValue.dismiss()
        })).padding(.horizontal)
    }
}

@available(iOS 15.0, *)
struct SetupProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        SetupProfileScreen()
    }
}
