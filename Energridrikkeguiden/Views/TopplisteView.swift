//
//  FavoritesView.swift
//  Energridrikkeguiden
//
//  Created by Samakab on 14/05/2023.
//

import SwiftUI
import Combine
struct TopplisteView: View {
    @ObservedObject var energiviewmodel = EnergiViewModel()
    @State private var updateTrigger = false
    var body: some View {
        NavigationStack{
            ScrollView{
                Text("Topplisten for de mest godkjente drikkene").foregroundColor(.black)
                    .lineLimit(200)
                    .padding(.top, 160)
                    .padding(.trailing, 79*2)
                VStack(alignment: .leading) {
                    ForEach(Array(energiviewmodel.sortedEnergiModel.enumerated()), id: \.element.id) { (index, toppliste) in
                        HStack(alignment: .top){
                            Image(toppliste.ImageType)
                                .resizable()
                                .frame(width: 36, height: 100)
                                 .padding(.trailing, 8)
                            VStack(alignment: .leading){
                                Text("\(index + 1).\(toppliste.EnergiType)")
                                    .bold()
                                Spacer()
                                Text("✅Godkjent \(toppliste.points) Ganger ")
                                 Spacer()
                                Text("💯Godkjent \(toppliste.Secondpoints) Ganger ")
                            }.padding(.bottom, 70)
                        }
                        
           
                    }
                    
                }.padding(.trailing, 80)
                Spacer(minLength: 50)
            }.background(Color("PurplelightAksel").scaledToFill()).ignoresSafeArea(.all)
            
                .navigationTitle("Toppliste")
                .onAppear {
                             energiviewmodel.loadPoints() // Reload the data when the view appears
                         }
        }
        
      
    }
}

struct TopplisteView_Previews: PreviewProvider {
    static var previews: some View {
       TopplisteView()
    }
}
