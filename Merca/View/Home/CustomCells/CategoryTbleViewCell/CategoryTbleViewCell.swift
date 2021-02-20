//
//  CategoryTbleViewCell.swift
//  Merca
//
//  Created by Khaled Bohout on 20/02/2021.
//

import UIKit

protocol SubCategoryCollectionViewDelegate {
    func showMoreTapped(index: Int)
}

class CategoryTbleViewCell: UITableViewCell {
    
    @IBOutlet weak var subCategoriesCollectionView: UICollectionView!
    
    var delegate: SubCategoryCollectionViewDelegate?
    var index: Int!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initTableView() {
        
        subCategoriesCollectionView.delegate = self
        subCategoriesCollectionView.dataSource = self
        let subCategoryNib = UINib(nibName: "SubCategoryCollectionView", bundle: nil)
        subCategoriesCollectionView.register(subCategoryNib, forCellWithReuseIdentifier: "SubCategoryCollectionView")

    }


    
}

extension CategoryTbleViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoryCollectionView", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.delegate?.showMoreTapped(index: self.index)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.height) - 23, height: collectionView.frame.height)
    }
    
    
}
