//
//  StoresListVC.swift
//  Merca
//
//  Created by Khaled Bohout on 27/02/2021.
//

import UIKit

class StoresListVC: UIViewController {
    @IBOutlet weak var storesListCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()

    }
    
    func setUpCollectionView() {
        
        let storesNib = UINib(nibName: "StoresCollectionViewCell", bundle: nil)
        storesListCollectionView.register(storesNib, forCellWithReuseIdentifier: "StoresCollectionViewCell")
        
        storesListCollectionView.delegate = self
        storesListCollectionView.dataSource = self
        
    }
    
}

extension StoresListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoresCollectionViewCell", for: indexPath) as! StoresCollectionViewCell
        cell.storeImageView.image = UIImage(named: "logo-lavender-flowers_83529-71")
        
        let cellWidth = ((collectionView.frame.width - 10) / 3.14)
        
        let imageWidth = cellWidth - 16
        
        cell.storeImageView.cornerRadius =  imageWidth / 2
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.width - 16) / 3.14, height: ((collectionView.frame.width - 10) / 3.14) + 23)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let storeDetailsVC = homeStoryboard.instantiateViewController(identifier: "StoreDetailsVC")
        self.navigationController?.pushViewController(storeDetailsVC, animated: true)
    }
}
