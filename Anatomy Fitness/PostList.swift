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
            API().getPosts { (response) in
                self.posts = response.results
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
