//
//  Services.swift
//  RestAPI
//
//  Created by Muhammad Fikri Hadian on 21/08/22.
//

import Foundation
import SwiftUI

class Services: ObservableObject{
    @Published var post = [Post]()
    
    init(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do{
                if let postData = data{
                    let decodedData = try JSONDecoder().decode([Post].self, from: postData)
                    DispatchQueue.main.async {
                        self.post = decodedData
                    }
                }else {
                    print("No Data")
                }
            }catch{
                print("Error")
            }
        }.resume()
    }
}
