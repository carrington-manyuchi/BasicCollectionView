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
        UIImage(systemName: "person.circle")
    ]
    
    
    private let collection
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    func setupUI() {
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
    }
}

