//
//  ExerciseTableViewController.swift
//  Anatomy Fitness
//
//  Created by Duy Nguyen on 11/1/20.
//  Copyright © 2020 David Giang. All rights reserved.
//

import UIKit


class ExerciseTableViewController: UITableViewController {
    var muscleNum = -1
    var muscleData = ""
    var postData: [myResult] = []
    var posts: [myResult2] = []
    var indexNum = -1
    var image1 : UIImage = UIImage(named:"chest")!
    override func viewDidLoad() {
        super.viewDidLoad()
           API().getExerciseByMuscle(muscle_num: muscleData) { (response) in
            self.postData=response.results
            self.tableView.reloadData()
        }
        muscleNum = Int(muscleData) ?? 0
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as? ExerciseTableViewCell else{
            fatalError("The dequeued cell is not an instance of ExerciseTableViewCell")
        }
        
        let exercise = postData[indexPath.row]
        cell.exerciseLabel.text = exercise.name
        //get image
        let id = String(exercise.id)
        let bool_check = API().getExerciseImageByExerciseID(exercise_id: id) { (response) in
            self.posts=response.results
        }
        if(bool_check != false){
            if(posts.count > 0){
                let url = URL(string: posts[0].image)
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                cell.exerciseImage.image = UIImage(data: data!)
            }
            else if(muscleNum == 4 || muscleNum == 2){
                let image : UIImage = UIImage(named: "chest")!
                cell.exerciseImage.image = image
            }
            else if(muscleNum == 1 || muscleNum == 13 || muscleNum == 5){
                let image : UIImage = UIImage(named: "arm")!
                cell.exerciseImage.image = image
            }
            else if(muscleNum == 6 || muscleNum == 14 || muscleNum == 3){
                let image : UIImage = UIImage(named: "abs")!
                cell.exerciseImage.image = image
            }
            else if(muscleNum == 8 || muscleNum == 12){
                let image : UIImage = UIImage(named: "backer")!
                cell.exerciseImage.image = image
            }
            else{
                let image : UIImage = UIImage(named: "leg")!
                cell.exerciseImage.image = image
            }
        }

        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell = tableView.cellForRow(at: indexPath) as! ExerciseTableViewCell
        indexNum = indexPath.row
        image1 = cell.exerciseImage.image!
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "detailer", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailsViewController
        vc.postDetails = self.postData
        vc.index = self.indexNum
        vc.images = self.image1
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
