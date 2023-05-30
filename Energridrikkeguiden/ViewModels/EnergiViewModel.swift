//
//  EnergyViewModel.swift
//  Energridrikkeguiden
//
//  Created by Samakab on 13/05/2023.
//

import Foundation

class EnergiViewModel: ObservableObject {
    @Published var energimodel: [Energimodel] = []
    private let pointsKey = "EnergiPointsKey"
    private var timer: Timer?
    init(){
        førsterunde()
        loadPoints()

    }
  
    var sortedEnergiModel: [Energimodel] {
        return energimodel.sorted {
            if $0.Secondpoints != $1.Secondpoints {
                return $0.Secondpoints > $1.Secondpoints // Sort by Secondpoints in descending order
            } else {
                 return $0.points > $1.points // Sort by AnotherProperty in ascending order
            }
        }
    }

     
    func savePoints() {
         let data = try? JSONEncoder().encode(energimodel)
         UserDefaults.standard.set(data, forKey: pointsKey)
     }

     func loadPoints() {
         guard let data = UserDefaults.standard.data(forKey: pointsKey) else {
             return
         }
         if let energiModels = try? JSONDecoder().decode([Energimodel].self, from: data) {
             energimodel = energiModels
         }
     }
    func førsterunde() {
        energimodel = energiround1
    }
    var totalPoints: Int {
          energimodel.reduce(0) { $0 + $1.points }
      }
    func updatePoints(for drink: Energimodel, points: Int) {
        if let index = energimodel.firstIndex(where: { $0.id == drink.id }) {
            energimodel[index].points = points // Add points to the drink's points
            energimodel[index].totalPoints = points // Add points to the drink's totalPoints
            savePoints()
       
        }
    }
    var secondtotalPoints: Int {
          energimodel.reduce(0) { $0 + $1.Secondpoints }
      }
    func secondupdatePoints(for drink: Energimodel, points: Int) {
        if let index = energimodel.firstIndex(where: { $0.id == drink.id }) {
            energimodel[index].Secondpoints = points // Add points to the drink's points
            energimodel[index].totalPoints = points // Add points to the drink's totalPoints
            savePoints()
       
        }
    }
    
    
    
    func randomEnergi() -> Energimodel? {
            guard !energimodel.isEmpty else {
                return nil
            }
            
            let randomIndex = Int.random(in: 0..<energimodel.count)
            return energimodel[randomIndex]
        }
    
}
var energiround1 = [Energimodel(id: UUID(), EnergiType: "Redbull Junebær", ImageType: "redbulljuneberry", points: 0, Secondpoints: 0, totalPoints: 0),Energimodel(id: UUID(), EnergiType: "Redbull DrageFrukt", ImageType: "redbulldragonfruit", points: 0, Secondpoints: 0, totalPoints: 0),Energimodel(id: UUID(), EnergiType: "Monster Energy", ImageType: "monsterenergy", points: 0, Secondpoints: 0, totalPoints: 0), Energimodel(id: UUID(), EnergiType: "Battery Lime No Calories", ImageType: "batterynocal", points: 0, Secondpoints: 0, totalPoints: 0), Energimodel(id: UUID(), EnergiType: "Nocco Ramonade", ImageType: "nocco2", points: 0, Secondpoints: 0, totalPoints: 0),Energimodel(id: UUID(), EnergiType: "Nocco Lime", ImageType: "nocco1", points: 0, Secondpoints: 0, totalPoints: 0) ,Energimodel(id: UUID(), EnergiType: "battery no sizzle", ImageType: "batterynosizzle", points: 0, Secondpoints: 0, totalPoints: 0) , Energimodel(id: UUID(), EnergiType: "Monster Energy Ultra", ImageType: "Monsterultra", points: 0, Secondpoints: 0),Energimodel(id: UUID(), EnergiType: "Monster Energy Ultra Vannemlon", ImageType: "Monsterwatermelon", points: 0, Secondpoints: 0), Energimodel(id: UUID(), EnergiType: "Battery Energi Fresh", ImageType: "Fresh", points: 0, Secondpoints: 0)]
