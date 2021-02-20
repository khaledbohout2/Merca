//
//  CategoriesCollectionViewCell.swift
//  Merca
//
//  Created by Khaled Bohout on 05/02/2021.
//

import UIKit
import IBAnimatable

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: AnimatableView!
    
    @IBOutlet weak var categoryImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell() {
        
        mainView.layer.cornerRadius =  (mainView.frame.width) / 2
       // mainView.cornerRadius = 
        categoryImageView.cornerRadius = (categoryImageView.frame.width) / 2
        
    }

}
