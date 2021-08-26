//
//  CategoriesCollectionViewCell.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 03.08.2021.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with title: String) {
        titleLabel.text = title
    }

}
