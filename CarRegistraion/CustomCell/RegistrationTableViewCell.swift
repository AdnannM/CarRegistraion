//
//  RegistrationTableViewCell.swift
//  CarRegistraion
//
//  Created by Adnann Muratovic on 21.10.21.
//

import UIKit

class RegistrationTableViewCell: UITableViewCell {
  
    @IBOutlet weak var cellBackgroundView: UIView! {
        didSet {
            cellBackgroundView.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
