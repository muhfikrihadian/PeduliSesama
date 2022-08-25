//
//  Covid.swift
//  RestAPI
//
//  Created by Muhammad Fikri Hadian on 21/08/22.
//

import Foundation
import SwiftUI

struct Total : Codable, Identifiable {
    let id = UUID()
    let jumlah_positif : Int
    let jumlah_dirawat : Int
    let jumlah_sembuh : Int
    let jumlah_meninggal : Int
}

struct Update : Codable{
    let total : Total
}

struct CovidResponse: Codable{
    var update : Update
}
