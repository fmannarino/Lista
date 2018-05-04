//
//  PhtotosListTableViewCell.swift
//  Lista
//
//  Created by Felipe Mannarino on 02/05/2018.
//  Copyright © 2018 Felipe Mannarino. All rights reserved.
//

import UIKit

class PhotosListTableViewCell: UITableViewCell {

    @IBOutlet var lbltitle: UILabel!
    @IBOutlet var albumImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
