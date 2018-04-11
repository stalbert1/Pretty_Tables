//
//  ReceiptCell.swift
//  Pretty_Tables
//
//  Created by Shane Talbert on 3/19/18.
//  Copyright © 2018 Shane Talbert. All rights reserved.
//

import UIKit

class ReceiptCell: UITableViewCell {

    

    @IBOutlet weak var lblReceiptName: UILabel!
    @IBOutlet weak var lblIsVerified: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblCreditCard: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
