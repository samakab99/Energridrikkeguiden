//
//  ContentView.swift
//  Energridrikkeguiden
//
//  Created by Samakab on 10/05/2023.
//

import SwiftUI

struct ContentView: View {
    init() {
        let appearance = UITabBarAppearance()
               appearance.configureWithOpaqueBackground()
               appearance.backgroundColor = UIColor.white
               UITabBar.appearance().standardAppearance = appearance
               UITabBar.appearance().backgroundColor = UIColor(named: "tabbaraksel")
               UITabBar.appearance().barTintColor = UIColor(named: "tabbaraksel")
    }
    
    var body: some View {
        TabView {
            ScrollView(showsIndicators: false) {
                EnergiView()
                    .padding(.top, 140)
            }
            .background(Color("PurpleAksel").scaledToFill())
            .ignoresSafeArea(.all)
            .tabItem {
                Image(systemName: "house.fill")
                Text("Hjem")
            }
            
            TopplisteView()
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("Toppliste")
            }
        }
        .background(Color.blue)
        .accentColor(.red)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
