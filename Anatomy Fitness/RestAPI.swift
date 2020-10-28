//
//  RestAPI.swift
//  Anatomy Fitness
//
//  Created by David Giang on 10/28/20.
//  Copyright © 2020 David Giang. All rights reserved.
//

import UIKit
import SwiftUI

// The REST API Class
class API {
    // This function makes a REST call to the following URL to get data
    func getPosts(completion: @escaping (Response) -> ()) {
        guard let url = URL(string: "https://wger.de/api/v2/exercise/?limit=200&status=2&language=2") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode(Response.self, from: data!)
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
    
    // More API calls can be created for more features we will add such as filtering
}

// This is the layout of the return from calling the REST API
struct Response: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [myResult]
}

// This is the JSON format of the 'results' from the Response above
struct myResult: Codable, Identifiable {
    let id: Int
    let license_author: String
    let status: String
    let description: String
    let name: String
    let name_original: String
    let creation_date: String?
    let uuid: String
    let license: Int
    let category: Int
    let language: Int
    let muscles: [Int]
    let muscles_secondary: [Int]
    let equipment: [Int]
}
