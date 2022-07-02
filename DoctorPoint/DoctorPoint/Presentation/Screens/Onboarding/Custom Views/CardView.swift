//
//  CardView.swift
//  Onboarding
//
//  Created by AbdelHalim on 13/01/2022.
//

import SwiftUI
import shared
@available(iOS 15.0, *)
struct CardView :  View{
    let onboardCard : OnboardingCardData
    @State var selection: Int? = nil
    
    var body : some View{
        
        
        VStack{
            Image(onboardCard.image)
                .resizable().scaledToFit()
                .frame(maxWidth:.infinity,alignment:.top).ignoresSafeArea()
            Spacer(minLength: 30)
            VStack{
                Text(onboardCard.title)
                    .fontWeight(.semibold)
                    .font(.title2).foregroundColor(Color.gray).padding(.top)
                Text(onboardCard.description_)
                    .padding().multilineTextAlignment(.center).font(.body).foregroundColor(Color.gray)
                NavigationLink(destination: SigninOrCreateAccountScreen(), tag: 2, selection: $selection) {
                    Button(action: {
                        print("tapped!")
                        self.selection = 2
                    }) {
                        HStack {
                            Text("Get Started")
                                .fontWeight(.semibold)
                                .font(.body).padding()
                        }
                        .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("green"))
                        .cornerRadius(10)
                    }.padding()
                    
                }
                if(onboardCard.title != "Chat with doctors"){
                    Text("Skip for now").fontWeight(.ultraLight).foregroundColor(Color.gray).font(.subheadline).multilineTextAlignment(.center).frame( alignment: .center).padding()
                }
                
            }.background(Color.white).cornerRadius(20).padding(16).frame(alignment:.bottom)
        }.frame(maxWidth: .infinity)
        
        
    }
}


@available(iOS 15.0, *)
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(onboardCard: .init(title: "Thousands of doctors", description: "Access thousands of Doctors instantly.\nYou can easily contact with the doctors and contact for your needs.", image:"onboarding_1"))
    }
}
