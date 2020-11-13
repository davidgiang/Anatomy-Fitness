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
    func getExerciseByMuscle(muscle_num: String, completion: @escaping (Response) -> ()) {
        guard let url = URL(string: "https://wger.de/api/v2/exercise/?limit=1000&status=2&language=2&muscles=" + muscle_num) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode(Response.self, from: data!)
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
    
    // Function for images, returns a boolean (true if not a bad request, false if bad request)
    func getExerciseImageByExerciseID(exercise_id: String, completion: @escaping (Response2) -> ()) -> Bool {
        
        let sem = DispatchSemaphore.init(value: 0)
        var return_val = true
        
        guard let url = URL(string: "https://wger.de/api/v2/exerciseimage/?is_main=true&exercise=" + exercise_id) else { return false }
        
        URLSession.shared.dataTask(with: url) { data, response, error in defer { sem.signal() }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    return_val = false
                    return
            }
            
            let posts = try! JSONDecoder().decode(Response2.self, from: data!)
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
        sem.wait()
        return return_val
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

// For getting image URL

struct Response2: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [myResult2]
}

struct myResult2: Codable, Identifiable {
    let id: Int
    let licenseAuthor, status: String
    let image: String
    let isMain: Bool
    let license, exercise: Int

    enum CodingKeys: String, CodingKey {
        case id
        case licenseAuthor = "license_author"
        case status, image
        case isMain = "is_main"
        case license, exercise
    }
}

struct RestAPI_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
