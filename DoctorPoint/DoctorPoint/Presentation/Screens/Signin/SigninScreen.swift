//
//  SigninScreen.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 01/04/2022.
//

import SwiftUI
import shared
@available(iOS 15.0, *)
struct SigninScreen: View {
    @State var tabBarPages: [TabBarPageModel] = [TabBarPageModel(page: CreateAccountScreen(), icon: "f1", tag: "f1", color: Color.white),
                                            TabBarPageModel(page: ForgetPasswordScreen(), icon: "notification", tag: "notification", color: Color.white),
                                            TabBarPageModel(page: CreateAccountScreen(), icon: "search", tag: "search", color: Color.white),
                                            TabBarPageModel(page: CreateAccountScreen(), icon: "document", tag: "document", color: Color.white),
                                            TabBarPageModel(page: CreateAccountScreen(), icon: "category", tag: "category", color: Color.white)]
    @State var selection: Int? = nil
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
                        
                        TextField("example@example.com", text: $email).multilineTextAlignment(.leading).textContentType(.oneTimeCode)
                            .keyboardType(.emailAddress).focused($focusedField, equals: .myField).autocapitalization(.none)
                            .disableAutocorrection(true)
                    }.textFieldStyle(DefaultTextFieldStyle()).padding(.horizontal)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
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
                        
                        SecureField("Enter password", text: $password).multilineTextAlignment(.leading).textContentType(.oneTimeCode)
                            .keyboardType(.emailAddress).focused($focusedField, equals: .myField).autocapitalization(.none)
                            .disableAutocorrection(true)
                    }.textFieldStyle(DefaultTextFieldStyle()).padding(.horizontal)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    Spacer().frame(height: 40)
                    NavigationLink(destination: MainScreen(pages: $tabBarPages), tag: 2, selection: $selection) {
                        Button(action: {
                            print("tapped!")
                            self.selection = 2
                        }) {
                            HStack {
                                Text("Sign In")
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
                }
                NavigationLink(destination: ForgetPasswordScreen(), tag: 3, selection: $selection) {
                    Text("Forgot Password?").fontWeight(.ultraLight).foregroundColor(Color.gray).font(.subheadline).multilineTextAlignment(.center).frame( maxWidth: .infinity, alignment: .center).onTapGesture(perform: {
                        self.selection = 3
                    })}
                Spacer().frame(height: 40)
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
            
            HStack{
                Text("Haven't any account?").fontWeight(.ultraLight).foregroundColor(Color.gray).font(.subheadline).multilineTextAlignment(.center).frame( alignment: .center)
                NavigationLink(destination: CreateAccountScreen(), tag: 1, selection: $selection) {
                    Text("Create account").foregroundColor(Color("green")).font(.body).multilineTextAlignment(.center).frame(alignment: .center).onTapGesture(perform: {
                        self.selection = 1
                    })}
            }.padding().frame(alignment:.bottom)
            
        }.frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top).background(Color("white")).navigationBarBackButtonHidden(true)
        
    }
}



@available(iOS 15.0, *)
struct SigninScreen_Previews: PreviewProvider {
    static var previews: some View {
        SigninScreen()
    }
}
