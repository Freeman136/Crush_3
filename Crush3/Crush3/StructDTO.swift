//
//  StructDTO.swift
//  Crush3
//
//  Created by Andrew on 29.10.2023.
//

import Foundation


struct Name: Codable {
    let first: String
    let last: String
}
struct Picture: Codable  {
    let large: String
    var isLoading = false
    
}
struct RandomUserResponse: Codable {
    let results: [IconOfMasters]
}
struct IconOfMasters: Codable {
    let name: Name
    let picture: Picture
}

struct photoDTO {
    let master: IconOfMasters?
    let url  = "https://randomuser.me/api/?results=10&gender=female"

    func fetchMastersPhotos()  {
        guard let url = URL(string: url) else { return}
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(IconOfMasters.self, from: data) {
                    DispatchQueue.main.async {
                    }
                }
            }
            
        }
        
        
    }
}
