//
//  CreateAccountScreen.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 01/04/2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct CreateAccountScreen: View {
    @State var selection: Int? = nil
    @State private var name: String = ""
    @State private var phone: String = ""
    
    @State private var email: String = ""
    @State private var password: String = ""
    @FocusState private var focusedField: Field?
    enum Field: Hashable {
        case myField
    }
    var body: some View {
        ScrollView{
            VStack{
                
                Group{
                    Image("logo").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 130, height: 100)
                    Spacer().frame(height: 30)
                    HStack {
                        Image("mail_ico").resizable().frame(width: 25,height: 20)
                        Spacer().frame(width: 20)
                        Text("Email")
                            .fontWeight(.semibold)
                            .font(.body)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28,alignment: .leading)
                    .padding(.horizontal).padding(.vertical,5)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
                    HStack {
                        
                        TextField("example@example.com", text: $email).multilineTextAlignment(.leading).textContentType(.emailAddress)
                            .keyboardType(.emailAddress).focused($focusedField, equals: .myField).autocapitalization(.none)
                            .disableAutocorrection(true)
                    }.textFieldStyle(DefaultTextFieldStyle()).padding(.horizontal)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    Spacer().frame(height: 15)
                    
                    HStack {
                        Image("user_ico").resizable().frame(width: 20,height: 25)
                        Spacer().frame(width: 20)
                        Text("Name")
                            .fontWeight(.semibold)
                            .font(.body)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28,alignment: .leading)
                    .padding(.horizontal).padding(.vertical,5)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
                    HStack {
                        
                        TextField("Enter your full name", text: $name).multilineTextAlignment(.leading).textContentType(.givenName)
                            .keyboardType(.namePhonePad).focused($focusedField, equals: .myField).autocapitalization(.none)
                            .disableAutocorrection(true)
                    }.textFieldStyle(DefaultTextFieldStyle()).padding(.horizontal)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                }
                Spacer().frame(height: 15)
                
                HStack {
                    
                    Image("phone_ico").resizable().frame(width: 25,height: 25)
                    Spacer().frame(width: 20)
                    Text("Phone number")
                        .fontWeight(.semibold)
                        .font(.body)
                }
                .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28,alignment: .leading)
                .padding(.horizontal).padding(.vertical,5)
                .foregroundColor(.gray)
                .cornerRadius(15)
                HStack {
                    
                    Menu {
                        Button("+254", action: {})
                        Button("+20", action: {})
                    } label: {
                        HStack{
                            Text("+254").frame(alignment: .leading).foregroundColor(Color.black)
                            Image("arrow_down").resizable().frame(alignment: .trailing).frame(width: 20,height: 10)
                            
                        }.frame(alignment: .leading)
                        
                    }.frame(alignment: .leading).padding(.trailing)
                    
                    TextField("Enter your full name", text: $phone).multilineTextAlignment(.leading).textContentType(.telephoneNumber)
                        .keyboardType(.phonePad).focused($focusedField, equals: .myField).autocapitalization(.none)
                        .disableAutocorrection(true)
                }.textFieldStyle(DefaultTextFieldStyle()).padding(.horizontal)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                Group{
                    HStack {
                        Image("pass_ico").resizable().frame(width: 20,height: 25)
                        Spacer().frame(width: 20)
                        Text("Password")
                            .fontWeight(.semibold)
                            .font(.body)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28,alignment: .leading)
                    .padding(.horizontal).padding(.bottom,5).padding(.top)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
                    HStack {
                        
                        SecureField("Enter password", text: $password).multilineTextAlignment(.leading).textContentType(.password)
                            .keyboardType(.emailAddress).focused($focusedField, equals: .myField).autocapitalization(.none)
                            .disableAutocorrection(true)
                    }.textFieldStyle(DefaultTextFieldStyle()).padding(.horizontal)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    Spacer().frame(height: 40)
                    NavigationLink(destination: SigninScreen(), tag: 2, selection: $selection) {
                        Button(action: {
                            print("tapped!")
                            self.selection = 2
                        }) {
                            HStack {
                                Text("Create account")
                                    .fontWeight(.semibold)
                                    .font(.body).padding()
                            }
                            .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("green"))
                            .cornerRadius(15)
                        }.padding(.horizontal).padding(.bottom,5)
                    }
                    
                    
                    HStack{
                        Text("Already have an account?").fontWeight(.ultraLight).foregroundColor(Color.gray).font(.subheadline).multilineTextAlignment(.center).frame( alignment: .center)
                        NavigationLink(destination: SigninScreen(), tag: 1, selection: $selection) {
                            Text("Sign in").foregroundColor(Color("green")).font(.body).multilineTextAlignment(.center).frame(alignment: .center).offset(x:-2).onTapGesture(perform: {
                                self.selection = 1
                            })}
                    }
                    Spacer().frame(height: 40)
                }
                HStack{
                    Text("Or Sign in With").fontWeight(.ultraLight).foregroundColor(Color.gray).font(.subheadline).multilineTextAlignment(.leading).frame( alignment: .center)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.leading)
                }.padding().frame(maxWidth:.infinity,alignment: .leading)
                
                HStack{
                    Image("facebook").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55).padding(.trailing)
                    Image("google").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55).padding(.trailing)
                    Image("twitter").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55).padding(.trailing)
                    Image("instagram").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55).padding(.trailing)
                }.frame(maxWidth:.infinity,alignment:.leading).padding(.horizontal)
            }.frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top).padding(.horizontal,5)
            
            
            
        }.frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top).background(Color("white")).navigationBarBackButtonHidden(true)
    }
}

@available(iOS 15.0, *)
struct CreateAccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountScreen()
    }
}
