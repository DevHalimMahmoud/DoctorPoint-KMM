//
//  ForgetPasswordScreen.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 06/06/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
struct ForgetPasswordScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var selection: Int? = nil
    @FocusState private var focusedField: Field?
    @State private var phone: String = ""
    
    enum Field: Hashable {
        case myField
    }
    var body: some View {
        VStack{
            Text("Forgot password")
                .fontWeight(.semibold)
                .font(.title).foregroundColor(.gray).frame(maxWidth:.infinity,alignment:.leading)
            
            Text("Please enter your phone number below to recive your OTP number.").fontWeight(.ultraLight).foregroundColor(Color.gray).font(.subheadline).multilineTextAlignment(.leading).frame(maxWidth:.infinity,alignment:.leading).padding(.vertical)
            Spacer().frame(height: 15)
            
            HStack {
                
                Image("phone_ico").resizable().frame(width: 25,height: 25)
                Spacer().frame(width: 20)
                Text("Phone number")
                    .fontWeight(.semibold)
                    .font(.body)
            }
            .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28,alignment: .leading)
            .padding(.vertical,5)
            .foregroundColor(.gray)
            .cornerRadius(15)
            HStack {
                
                Menu {
                    Button("+254", action: {})
                    Button("+20", action: {})
                } label: {
                    HStack{
                        Text("+254").frame(alignment: .leading).foregroundColor(Color.gray)
                        Image("arrow_down").resizable().frame(alignment: .trailing).frame(width: 20,height: 10)
                        
                    }.frame(alignment: .leading)
                    
                }.frame(alignment: .leading).padding(.trailing)
                
                TextField("Enter your phone number", text: $phone).multilineTextAlignment(.leading).textContentType(.telephoneNumber)
                    .keyboardType(.phonePad).focused($focusedField,equals:.myField).autocapitalization(.none)
                    .disableAutocorrection(true)
            }.textFieldStyle(DefaultTextFieldStyle())
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
            NavigationLink(destination: SigninScreen(), tag: 2, selection: $selection) {
                Button(action: {
                    print("tapped!")
                    self.selection = 2
                }) {
                    HStack {
                        Text("Send OTP")
                            .fontWeight(.semibold)
                            .font(.body).padding()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("green"))
                    .cornerRadius(15)
                }.frame(maxHeight:.infinity,alignment:.bottom).padding(.bottom)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .topLeading).navigationBarBackButtonHidden(true).navigationBarItems(leading: Image("back_button").frame(alignment:.bottomLeading).onTapGesture(perform: {
            self.presentationMode.wrappedValue.dismiss()
        })).padding(.horizontal)
    }
}

@available(iOS 15.0, *)
struct ForgetPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordScreen()
    }
}
