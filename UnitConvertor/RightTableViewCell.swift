//
//  RightTableViewCell.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/2.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import UIKit

class RightTableViewCell: UITableViewCell {
    
    @IBOutlet weak var unitValueLabel: UILabel!
    @IBOutlet weak var unitNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
