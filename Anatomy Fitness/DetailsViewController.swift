//
//  DetailsViewController.swift
//  Anatomy Fitness
//
//  Created by Duy Nguyen on 11/13/20.
//  Copyright © 2020 David Giang. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    //extension
    
    @IBOutlet var exerciseName: UILabel!
    @IBOutlet var exerciseImage: UIImageView!
    @IBOutlet var exerciseDescription: UITextView!
    var postDetails: [myResult] = []
    var postsImage: [myResult2] = []
    var images : UIImage = UIImage(named:"chest")!
    var index = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exerciseName.text = postDetails[index].name

        exerciseImage.image = images
        var content = postDetails[index].description
        let a = content.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
        let b = a.replacingOccurrences(of: "&[^;]+;", with: "", options: String.CompareOptions.regularExpression, range: nil)

        exerciseDescription.text = b
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
