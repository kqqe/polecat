//
//  CollectionVIewCell.swift
//  Polecat
//
//  Created by Anatoliy on 21.06.2022.
//

import Foundation
import UIKit

final class CollectionViewCell: UICollectionViewCell {
    /// временно рещение для private 
    var icon: UIImage = UIImage() {
        didSet {
            self.image.image = icon
        }
    }
    
    var image: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode =  .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.alignment = .center
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSteckView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: -  Setup Collection View Cell
extension CollectionViewCell {
    
    func setupSteckView() {
        stack.addArrangedSubview(image)
        contentView.addSubview(stack)
        setupConstarints()
    }
    
    func setupConstarints() {
        NSLayoutConstraint.activate([
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            stack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4),
            stack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -4),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4)
        ])
    }
}
