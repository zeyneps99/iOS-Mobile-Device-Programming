//
//  PharmacyTableViewCell.swift
//  hw4
//
//  Created by Sezen Zeynep Sumer on 28.11.2021.
//

import UIKit

class PharmacyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
