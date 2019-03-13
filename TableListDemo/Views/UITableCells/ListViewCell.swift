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

    var lblTitle: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var lblDescription: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var imgView: UIImageView = {
        let img = UIImageView(frame: .zero)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var imgBottomConstraint: NSLayoutConstraint!
    var lblBottomConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.addSubview(lblTitle)
        contentView.addSubview(lblDescription)
        contentView.addSubview(imgView)
        
        lblTitle.font = UIFont.boldSystemFont(ofSize: 17)
        lblDescription.numberOfLines = 0
        imgView.cornerRadius = 35
        
        // Set all UIElements with autolayout
        setUpView()
    }
    
    func setUpView() {
        let marginGuide = contentView.layoutMarginsGuide
        
        imgBottomConstraint = imgView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: 0)
        imgBottomConstraint.priority = UILayoutPriority(rawValue: 500)
        
        NSLayoutConstraint.activate([
            imgView.widthAnchor.constraint(equalToConstant: 70),
            imgView.heightAnchor.constraint(equalToConstant: 70),
            imgView.leftAnchor.constraint(equalTo: marginGuide.leftAnchor, constant: 0),
            imgView.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 7),
            imgBottomConstraint
            ])
        
        NSLayoutConstraint.activate([
            lblTitle.heightAnchor.constraint(equalToConstant: 21),
            lblTitle.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 7),
            lblTitle.rightAnchor.constraint(equalTo: marginGuide.rightAnchor, constant: 5),
            lblTitle.topAnchor.constraint(equalTo: imgView.topAnchor, constant: 0),
            lblTitle.bottomAnchor.constraint(equalTo: lblDescription.topAnchor, constant: 0)
            ])
        
        lblBottomConstraint = lblDescription.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: 0)
        lblBottomConstraint.priority = UILayoutPriority(rawValue: 998)
        
        NSLayoutConstraint.activate([
            lblDescription.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 7),
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
        
        let imgUrl = URL(string: details.imageHref ?? "")
        let placehldr = UIImage(named: kPlaceHolderImg)
        imgView.kf.setImage(with: imgUrl, placeholder: placehldr, options:nil, progressBlock:nil, completionHandler:nil)
        
        if details.description == nil {
            lblDescription.text = "Description not available."
            imgBottomConstraint.priority = UILayoutPriority(rawValue: 999)
        }else{
            imgBottomConstraint.priority = UILayoutPriority(rawValue: 500)
        }
        self.setNeedsLayout()
    }
}

extension ListViewCell: ReusableViewProtocol {}
