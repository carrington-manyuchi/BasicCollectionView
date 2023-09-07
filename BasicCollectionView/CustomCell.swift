//
//  CustomCell.swift
//  BasicCollectionView
//
//  Created by DA MAC M1 157 on 2023/09/07.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    public static let identifier = "CustomCell"
    
    private let catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "photo.artframe")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func configure(with image: UIImage) {
        catImageView.image = image
        setupUI()
    }
    
    func setupUI() {
        contentView.addSubview(catImageView)
        catImageView.tintColor = UIColorFromRGB(rgbValue: 0x141E46)
        setupConstraints()
    }
    
    func setupConstraints() {
        let catImageViewConstraints = [
            catImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            catImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            catImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            catImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(catImageViewConstraints)
    }
    
    
    
}
