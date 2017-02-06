//
//  TableViewCell.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2016/12/23.
//  Copyright © 2016年 Jerry Chen. All rights reserved.
//

import UIKit

class LeftTableViewCell: UITableViewCell {

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
