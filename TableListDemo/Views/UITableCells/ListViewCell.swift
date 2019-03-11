//
//  ListViewCell.swift
//  TableListDemo
//
//  Created by Darshan on 09/03/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit
import Kingfisher

class ListViewCell: UITableViewCell {

    var lblTitle : UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var lblDescription : UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var imgView : UIImageView = {
        let img = UIImageView(frame: .zero)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var imgBottomConstraint: NSLayoutConstraint!
    var lblBottomConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        contentView.addSubview(lblTitle)
        contentView.addSubview(lblDescription)
        contentView.addSubview(imgView)
        
        lblDescription.numberOfLines = 0
        
        imgBottomConstraint = imgView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: 7)
        imgBottomConstraint.priority = UILayoutPriority(rawValue: 500)
        
        NSLayoutConstraint.activate([
            imgView.widthAnchor.constraint(equalToConstant: 70),
            imgView.heightAnchor.constraint(equalToConstant: 70),
            imgView.leftAnchor.constraint(equalTo: marginGuide.leftAnchor, constant: 7),
            imgView.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 7),
            imgBottomConstraint
            ])
        
        NSLayoutConstraint.activate([
            lblTitle.heightAnchor.constraint(equalToConstant: 21),
            lblTitle.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 5),
            lblTitle.rightAnchor.constraint(equalTo: marginGuide.rightAnchor, constant: 5),
            lblTitle.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 15),
            lblTitle.bottomAnchor.constraint(equalTo: lblDescription.topAnchor, constant: 5)
            ])

        lblBottomConstraint = lblDescription.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: 5)
        lblBottomConstraint.priority = UILayoutPriority(rawValue: 998)
        
        NSLayoutConstraint.activate([
            lblDescription.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 5),
            lblDescription.rightAnchor.constraint(equalTo: marginGuide.rightAnchor, constant: 5),
            lblBottomConstraint
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func configureCell(_ list: ListModel?) {
        
        guard let details = list else { return }
        
        lblTitle.text = details.title
        lblDescription.text = details.description
        imgView.kf.indicatorType = .activity
        imgView.kf.setImage(with: URL(string: details.imageHref ?? ""), placeholder: UIImage(named: "git_logo"), options: nil, progressBlock: nil, completionHandler: nil)
        
        if details.description == nil {
            imgBottomConstraint.priority = UILayoutPriority(rawValue: 999)
            self.setNeedsLayout()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
