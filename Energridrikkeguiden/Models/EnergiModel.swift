//
//  EnergiModel.swift
//  Energridrikkeguiden
//
//  Created by Samakab on 13/05/2023.
//

import Foundation
struct Energimodel:Identifiable, Hashable,Decodable,Encodable {
    var id: UUID
    var EnergiType: String
    var ImageType: String
    var points: Int
    var Secondpoints: Int
    var totalPoints: Int = 0
    
}
