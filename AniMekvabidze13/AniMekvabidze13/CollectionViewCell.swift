//
//  CustomCollectionViewCell.swift
//  AniMekvabidze13
//
//  Created by Mac User on 5/17/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
     let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
         imageView.clipsToBounds = true 
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        contentView.addSubview(myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
    }
}

