//
//  HomeTableViewCell.swift
//  Merca
//
//  Created by Khaled Bohout on 05/02/2021.
//

import UIKit

protocol HomeTableViewCellDelegate {
    
    func seeMoreBtnTapped(index: Int)
}

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewItems: HomeItemModel!
    
    @IBOutlet weak var itemType: UILabel!
    
    @IBOutlet weak var titleViewHeight: NSLayoutConstraint!
    
    var delegate: HomeTableViewCellDelegate?
    
    var index: Int?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpcollectionViewCells() {
        
        let adsNib = UINib(nibName: "AdsCollectionViewCell", bundle: nil)
        let itemNib = UINib(nibName: "ItemsCollectionViewCell", bundle: nil)
        let categoriesNib = UINib(nibName: "CategoriesCollectionViewCell", bundle: nil)
        collectionView.register(adsNib, forCellWithReuseIdentifier: "AdsCollectionViewCell")
        collectionView.register(itemNib, forCellWithReuseIdentifier: "ItemsCollectionViewCell")
        collectionView.register(categoriesNib, forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configureCell (collectionViewItems: HomeItemModel) {
        let type = collectionViewItems.type
        itemType.text = type
        
        if type == "ads" {
            
            self.titleViewHeight.constant = 0
        }
        self.collectionViewItems = collectionViewItems
        
    }
    
    @IBAction func seeMoreBtnTapped(_ sender: Any) {
        
        self.delegate?.seeMoreBtnTapped(index: self.index!)
    }

}

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewItems.elements!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let type = collectionViewItems.type
        
        if type == "ads" {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdsCollectionViewCell", for: indexPath) as! AdsCollectionViewCell
            
            
            return cell
            
        } else if type == "items" {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCollectionViewCell", for: indexPath)
            
            return cell
            
        } else if type == "categories" {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
            
            cell.configureCell()
            
            return cell
            
        } else if type == "stores" {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdsCollectionViewCell", for: indexPath) as! AdsCollectionViewCell
            cell.imageView.image = UIImage(named: "logo-lavender-flowers_83529-71")
            
            let cellWidth = ((collectionView.frame.width - 10) / 3.14)
            
            let imageWidth = cellWidth - 16
            
            cell.imageView.cornerRadius =  imageWidth / 2
            
            return cell
            
        } else if type == "occasions" {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdsCollectionViewCell", for: indexPath) as! AdsCollectionViewCell
         //   cell.imageView.image = UIImage(named: "19406492")
            
            return cell
            
        } else {
            
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let type = collectionViewItems.type
        
        if type == "ads" {
            

            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            
        } else if type == "items" {
            
            
            return CGSize(width: collectionView.frame.width / 2.4, height: collectionView.frame.height)
            
        } else if type == "categories" {
            
            
            return CGSize(width: (collectionView.frame.width - 20) / 4.1, height: collectionView.frame.height)
            
        } else if type == "stores" {
            

            return CGSize(width: (collectionView.frame.width - 10) / 3.14, height: collectionView.frame.height)
            
        } else if type == "occasions" {
            
            return CGSize(width: collectionView.frame.width / 1.66, height: collectionView.frame.height)
            
        } else {
            
            return CGSize(width: 0, height: 0)
        }
    }
    
    
}
