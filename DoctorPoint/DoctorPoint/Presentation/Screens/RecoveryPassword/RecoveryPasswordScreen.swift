//
//  RecoveryPasswordScreen.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 06/06/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
struct RecoveryPasswordScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var selection: Int? = nil
    @FocusState private var focusedField: Field?
    @State private var password: String = ""
    @State private var resetPassword: String = ""

    
    enum Field: Hashable {
        case myField
    }
    var body: some View {
        VStack(){
            Text("Forgot password")
                .fontWeight(.semibold)
                .font(.title).foregroundColor(.gray).frame(maxWidth:.infinity,alignment:.leading)
            
            Text("Please enter your phone number below to recive your OTP number.").fontWeight(.ultraLight).foregroundColor(Color.gray).font(.subheadline).multilineTextAlignment(.leading).frame(maxWidth:.infinity,alignment:.leading).padding(.vertical)
            Spacer().frame(height: 15)
            Group{
                HStack {
                    Image("pass_ico").resizable().frame(width: 20,height: 25)
                    Spacer().frame(width: 20)
                    Text("Password")
                        .fontWeight(.semibold)
                        .font(.body)
                }
                .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28,alignment: .leading)
                .padding(.bottom,5).padding(.top)
                .foregroundColor(.gray)
                .cornerRadius(15)
                HStack {
                    SecureField("Enter password", text: $password).multilineTextAlignment(.leading).textContentType(.password)
                        .keyboardType(.emailAddress).focused($focusedField, equals: .myField).autocapitalization(.none)
                        .disableAutocorrection(true)
                }.textFieldStyle(DefaultTextFieldStyle())
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                
                Spacer().frame(height: 15)
                
                HStack {
                    Image("pass_ico").resizable().frame(width: 20,height: 25)
                    Spacer().frame(width: 20)
                    Text("Confirm Password")
                        .fontWeight(.semibold)
                        .font(.body)
                }
                .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28,alignment: .leading)
                .padding(.bottom,5).padding(.top)
                .foregroundColor(.gray)
                .cornerRadius(15)
                HStack {
                    
                    SecureField("Enter confirm password", text: $resetPassword).multilineTextAlignment(.leading).textContentType(.password)
                        .keyboardType(.emailAddress).focused($focusedField, equals: .myField).autocapitalization(.none)
                        .disableAutocorrection(true)
                }.textFieldStyle(DefaultTextFieldStyle())
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
                            Text("Reset password")
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
                
                
            }.frame(maxHeight:.infinity,alignment: .bottom)
        }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .topLeading).navigationBarBackButtonHidden(true).navigationBarItems(leading: Image("back_button").frame(alignment:.bottomLeading).onTapGesture(perform: {
            self.presentationMode.wrappedValue.dismiss()
        })).padding(.horizontal)
    }
}
@available(iOS 15.0, *)
struct RecoveryPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecoveryPasswordScreen()
    }
}
