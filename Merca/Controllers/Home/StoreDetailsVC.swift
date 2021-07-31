//
//  StoreDetailsVC.swift
//  Merca
//
//  Created by Khaled Bohout on 27/02/2021.
//

import UIKit
import CollectionViewPagingLayout
import ScaledCenterCarouselSwift

class StoreDetailsVC: UIViewController {
    
    @IBOutlet weak var storesCollectionView: UICollectionView!
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    var layout = ScaledCenterCarouselLayout(centerCellSize: CGSize(width: 0, height: 0), normalCellSize: CGSize(width: 0, height: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        
    }
    
    func setUpCollectionView() {
        
        let itemNib = UINib(nibName: "SubcategoryItemsCollectionViewCell", bundle: nil)
        itemsCollectionView.register(itemNib, forCellWithReuseIdentifier: "SubcategoryItemsCollectionViewCell")
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        
        let storesNib = UINib(nibName: "StoresCollectionViewCell", bundle: nil)
        storesCollectionView.register(storesNib, forCellWithReuseIdentifier: "StoresCollectionViewCell")
        
        storesCollectionView.delegate = self
        storesCollectionView.dataSource = self
        
        
        let layout = ScaledCenterCarouselLayout(centerCellSize: CGSize(width: storesCollectionView.frame.height - 50 , height: storesCollectionView.frame.height), normalCellSize: CGSize(width: storesCollectionView.frame.height - 100, height: storesCollectionView.frame.height - 80))
        
        storesCollectionView.collectionViewLayout = layout
        self.layout = layout
    }
    


}

extension StoreDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ScaledCenterCarouselPaginatorDelegate, ScaledCenterCarouselDataSource {
    
    var selectedIndex: UInt {
        get {
            return 12
        }
        set(newValue) {
        
        }
    }
    
    
    func carousel(_ collectionView: UICollectionView, didSelectElementAt index: UInt) {
        collectionView.scrollToItem(at: IndexPath(index: IndexPath.Element(index)), at: .centeredHorizontally, animated: true)
    }
    
    func carousel(_ collectionView: UICollectionView, didScrollTo visibleCells: [UICollectionViewCell]) {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == storesCollectionView {
            
            return 12
            
        } else {
            
            return 12
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == storesCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoresCollectionViewCell", for: indexPath) as! StoresCollectionViewCell
            cell.storeNameTextField.font = cell.storeNameTextField.font.withSize(8)
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubcategoryItemsCollectionViewCell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == storesCollectionView {
            
//            return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
            return layout.collectionViewContentSize
            
        } else {
            
            return CGSize (width: (Int((collectionView.frame.width)) - 15) / 2, height: (Int(((collectionView.frame.width)) - 15) / 2) + 33)
        }
    }
    
    
    
    
    
    

    
    
    
}
