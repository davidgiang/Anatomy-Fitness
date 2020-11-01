//
//  ExerciseTableViewCell.swift
//  Anatomy Fitness
//
//  Created by Duy Nguyen on 11/1/20.
//  Copyright © 2020 David Giang. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet var exerciseImage: UIImageView!
    @IBOutlet var exerciseLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
