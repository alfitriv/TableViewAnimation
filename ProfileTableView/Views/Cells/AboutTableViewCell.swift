//
//  AboutTableViewCell.swift
//  ProfileTableView
//
//  Created by Vania Radmila Alfitri on 15/07/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = 100
    }
    
    func configureImage(image: UIImage) {
        profileImage.image = image
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
