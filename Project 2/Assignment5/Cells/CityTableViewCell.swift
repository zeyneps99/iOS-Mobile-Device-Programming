//
//  TableViewCell.swift
//  hw4
//
//  Created by Sezen Zeynep Sumer on 6.11.2021.
//

import UIKit

class CityTableViewCell: UITableViewCell {
   
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
