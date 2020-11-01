//
//  FrontViewController.swift
//  Anatomy Fitness
//
//  Created by Duy Nguyen on 10/12/20.
//  Copyright © 2020 David Giang. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController {
    var muscleID = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPressed(_ sender: UIButton){
        self.muscleID = String(sender.tag)
        performSegue(withIdentifier: "fronter", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ExerciseTableViewController
        vc.muscleData = self.muscleID
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
