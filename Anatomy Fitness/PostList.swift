//
//  PostList.swift
//  Anatomy Fitness
//
//  Created by David Giang on 10/28/20.
//  Copyright © 2020 David Giang. All rights reserved.
//

import SwiftUI

// This is to remove the HTML tags in the text
// No need to call it or anything it does its job automatically
extension String {
    var withoutHtmlTags: String {
    return self.replacingOccurrences(of: "<[^>]+>", with: "", options:
    .regularExpression, range: nil).replacingOccurrences(of: "&[^;]+;", with:
    "", options:.regularExpression, range: nil)
    }
}

// Example of how to use and call the REST API
// This displays the results in a list
struct PostList: View {
    // I saved the results from the REST API call into this posts variable
    @State var posts: [myResult] = []
    
    var body: some View {
        // This creates a list using the posts variable and sets the Text to post.name which in our case is the name of the exercise as we can see in the RESTApi.swift file
        List(posts) { post in
            Text(post.name)
        }
        // On screen appear, call the API function and save the results in our posts variable
        .onAppear {

            // Example call to API with muscle 5
            API().getExerciseByMuscle(muscle_num: "5") { (response) in
                self.posts=response.results
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}

// For muscle ID reference:
/*
{
    "count": 15,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 2,
            "name": "Anterior deltoid",
            "is_front": true
        },
        {
            "id": 1,
            "name": "Biceps brachii",
            "is_front": true
        },
        {
            "id": 11,
            "name": "Biceps femoris",
            "is_front": false
        },
        {
            "id": 13,
            "name": "Brachialis",
            "is_front": true
        },
        {
            "id": 7,
            "name": "Gastrocnemius",
            "is_front": false
        },
        {
            "id": 8,
            "name": "Gluteus maximus",
            "is_front": false
        },
        {
            "id": 12,
            "name": "Latissimus dorsi",
            "is_front": false
        },
        {
            "id": 14,
            "name": "Obliquus externus abdominis",
            "is_front": true
        },
        {
            "id": 4,
            "name": "Pectoralis major",
            "is_front": true
        },
        {
            "id": 10,
            "name": "Quadriceps femoris",
            "is_front": true
        },
        {
            "id": 6,
            "name": "Rectus abdominis",
            "is_front": true
        },
        {
            "id": 3,
            "name": "Serratus anterior",
            "is_front": true
        },
        {
            "id": 15,
            "name": "Soleus",
            "is_front": false
        },
        {
            "id": 9,
            "name": "Trapezius",
            "is_front": false
        },
        {
            "id": 5,
            "name": "Triceps brachii",
            "is_front": false
        }
    ]
}*/
