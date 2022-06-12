//
//  HomeScreen.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 11/06/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
struct MainScreen: View {
    @State var selectedTab = "home"
    @Binding var pages: [TabBarPageModel]
    init(pages: Binding<[TabBarPageModel]>) {
        UITabBar.appearance().isHidden = true
        self._pages = pages
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                ForEach(pages) { item in
                    AnyView(_fromValue: item.page)
                    
                        .tabItem{
                            EmptyView()
                        }.tag(item.tag)
                }
            }
            HStack {
                ForEach(pages) { item in
                    Button(action: {
                        self.selectedTab = item.tag
                    }) {
                        ZStack {
                            Image(item.icon).resizable().frame(maxWidth: 30 ,maxHeight: 30)
                                .foregroundColor(Color.white)
                                .imageScale(.small)
                            
                                .padding(15)
                                .background(self.selectedTab == item.tag ? Color("green").opacity(0.1) : Color.white )
                                .mask(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .frame(maxWidth: .infinity)
                }.padding(.vertical,10)
            }
            .padding(5)
            .background(Color.white)
            .cornerRadius(10)
            .padding()
        }
    }
}


@available(iOS 15.0, *)
struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(pages: .constant([TabBarPageModel(page: CreateAccountScreen(), icon: "f1", tag: "home", color: Color.white),
                                     TabBarPageModel(page: ForgetPasswordScreen(), icon: "notification", tag: "notification", color: Color.white),
                                     TabBarPageModel(page: CreateAccountScreen(), icon: "search", tag: "search", color: Color.white),
                                     TabBarPageModel(page: CreateAccountScreen(), icon: "document", tag: "document", color: Color.white),
                                     TabBarPageModel(page: CreateAccountScreen(), icon: "category", tag: "category", color: Color.white)]))
    }
}

