//
//  SerchableCell.swift
//  codingExercise
//
//  Created by Ahsan Rizvi on 12/24/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

import UIKit

class SerchableCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnail.layer.cornerRadius = thumbnail.frame.width/2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
