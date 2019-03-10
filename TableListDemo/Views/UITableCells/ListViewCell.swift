//
//  ListViewCell.swift
//  TableListDemo
//
//  Created by Darshan on 09/03/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {

    let lblTitle = UILabel()
    let lblDescription = UILabel()
    let imgView = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
