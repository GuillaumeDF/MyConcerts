//
//  InfoConcertCell.swift
//  MyConcerts
//
//  Created by Guillaume Djaider Fornari on 22/07/2019.
//  Copyright © 2019 Guillaume Djaider Fornari. All rights reserved.
//

import UIKit

class InfoConcertCell: UITableViewCell {

    @IBOutlet weak var imageInfo: UIImageView!
    @IBOutlet weak var dataInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInfoConcertCell(dataInfo: String, imageInfo: UIImage?) {
        self.dataInfo.text = dataInfo
         self.imageInfo.image = imageInfo
    }

}
