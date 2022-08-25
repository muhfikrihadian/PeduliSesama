//
//  CovidServices.swift
//  RestAPI
//
//  Created by Muhammad Fikri Hadian on 21/08/22.
//

import Foundation
import SwiftUI
import Combine

class CovidServices : ObservableObject{
    let objectWillChange = ObservableObjectPublisher()
    @Published var isLoading = true
    @Published var datatotal = [Total](){
        willSet{
            objectWillChange.send()
        }
    }
    
    init(){
        guard let url = URL(string: "https://data.covid19.go.id/public/api/update.json") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            let result = try? JSONDecoder().decode(CovidResponse.self, from:data)
            if let result = result {
                self.isLoading = false
                DispatchQueue.main.async {
                    self.datatotal = [result.update.total]
                }
            }

        }.resume()
    }
}
