//
//  SubCategoryItemsList.swift
//  Merca
//
//  Created by Khaled Bohout on 21/02/2021.
//

import UIKit

class SubCategoryItemsList: UIViewController {
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCustomLayout()
        
        initSliderCollectionView()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func setUpCustomLayout() {
        
        if let layout = itemsCollectionView?.collectionViewLayout as? PinterestLayout {
            
          layout.delegate = self
        }

        itemsCollectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        
        let itemCellNib = UINib(nibName: "SubcategoryItemsCollectionViewCell", bundle: nil)
        itemsCollectionView.register(itemCellNib, forCellWithReuseIdentifier: "SubcategoryItemsCollectionViewCell")
    }
    
    func initSliderCollectionView() {
        
        let sliderNib = UINib(nibName: "SubCategorySliderCollectionViewCell", bundle: nil)
        sliderCollectionView.register(sliderNib, forCellWithReuseIdentifier: "SubCategorySliderCollectionViewCell")
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        
    }
    
}

extension SubCategoryItemsList: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return 8
  }
  
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == itemsCollectionView {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubcategoryItemsCollectionViewCell", for: indexPath as IndexPath)

    return cell
    } else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategorySliderCollectionViewCell", for: indexPath as IndexPath)

        return cell
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    if collectionView == itemsCollectionView {
        
    let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 18)) / 2
        
    return CGSize(width: itemSize, height: itemSize)
        
    } else {
        
        return CGSize(width: collectionView.frame.width / 3.8, height: collectionView.frame.height)
    }
  }
    
}

extension SubCategoryItemsList: PinterestLayoutDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    
    if indexPath.row == 1 {
        
        return (((collectionView.frame.width - 50) / 2) * 1.22) + 35
        
    } else {
        
        return (((collectionView.frame.width - 50) / 2) * 1.22)
    }
  }


}
