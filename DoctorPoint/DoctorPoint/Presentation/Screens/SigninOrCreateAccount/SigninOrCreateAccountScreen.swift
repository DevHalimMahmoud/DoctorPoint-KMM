//
//  ContentView.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 01/04/2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct SigninOrCreateAccountScreen: View {
    @State var selection: Int? = nil
    
    var body: some View {
            VStack{
                VStack{
                    Image("logo").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 120)
                }.frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .center)
                
                VStack{
                    Text("Create a Free Account").font(.title).foregroundColor(Color.gray)
                    NavigationLink(destination: CreateAccountScreen(), tag: 1, selection: $selection) {
                        Button(action: {
                            print("tapped!")
                            self.selection = 1
                        }) {
                            HStack {
                                Text("Create an account")
                                    .fontWeight(.semibold)
                                    .font(.body).padding()
                            }
                            .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("green"))
                            .cornerRadius(15)
                        }.padding()
                    }
                    NavigationLink(destination: SigninScreen(), tag: 2, selection: $selection) {
                        Button(action: {
                            print("tapped!")
                            self.selection = 2
                            
                        }) {
                            HStack {
                                Text("Sign in")
                                    .fontWeight(.semibold)
                                    .font(.body).padding()
                            }
                            .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28)
                            .padding()
                            .foregroundColor(Color("green"))
                            .background(Color.white)
                            .cornerRadius(15)
                        }.padding(.horizontal)}
                }.frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top).padding(.horizontal)
            }.frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top).background(Color("white")).ignoresSafeArea().navigationBarBackButtonHidden(true)
        
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SigninOrCreateAccountScreen()
    }
}
