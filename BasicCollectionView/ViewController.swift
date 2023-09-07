//
//  ViewController.swift
//  BasicCollectionView
//
//  Created by DA MAC M1 157 on 2023/09/07.
//

import UIKit

class ViewController: UIViewController {
    
    let images = [
        UIImage(systemName: "square.and.arrow.up"),
        UIImage(systemName: "square.and.arrow.up.fill"),
        UIImage(systemName: "pencil.circle.fill"),
        UIImage(systemName: "eraser.fill"),
        UIImage(systemName: "trash.circle"),
        UIImage(systemName: "person.circle"),
        UIImage(systemName: "square.and.arrow.up"),
        UIImage(systemName: "square.and.arrow.up.fill"),
        UIImage(systemName: "pencil.circle.fill"),
        UIImage(systemName: "eraser.fill"),
        UIImage(systemName: "trash.circle"),
        UIImage(systemName: "person.circle")
    ]
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "List of system icons"
        label.font = UIFont(name: "Avenir", size: 27)
        label.numberOfLines  = 1
        label.textAlignment = .center
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.layer.cornerRadius = CGFloat(18.0)
        collectionView.layer.shadowOffset = CGSize(width: -3, height: -2)
        collectionView.layer.shadowOpacity = 0.7
        collectionView.layer.shadowRadius = 15
        
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    func setupUI() {
        view.addSubview(topLabel)
        topLabel.backgroundColor = UIColorFromRGB(rgbValue: 0xFFF5E0)
        topLabel.textColor = UIColorFromRGB(rgbValue: 0xBB2525)
        
        view.addSubview(collectionView)
        collectionView.layer.backgroundColor = UIColorFromRGB(rgbValue: 0xFF6969).cgColor
        collectionView.layer.shadowColor = UIColorFromRGB(rgbValue: 0x141E46).cgColor
        
        collectionView.delegate = self
        collectionView.dataSource = self
        setupConstraints()
    }
    
    func setupConstraints() {
        let topLabelConstraints = [
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topLabel.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        let  collectionViewConstraints = [
            collectionView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        
        ]
        
        NSLayoutConstraint.activate(topLabelConstraints)
        NSLayoutConstraint.activate(collectionViewConstraints)
    }
    
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}


//MARK: - Delegates and Datasource Methods

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            print("Cannot dequeue collectionView Cell")
            return UICollectionViewCell()
        }
        
        let image = images[indexPath.row]!
        cell.configure(with: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ( view.frame.width / 2 ) - 20
        return CGSize(width: width, height: 200)
    }
}
