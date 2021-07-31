//
//  ItemDetailsVC.swift
//  Merca
//
//  Created by Khaled Bohout on 19/03/2021.
//

import UIKit

class ItemDetailsVC: UIViewController {

    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var relatedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionView()

    }
    
    func initCollectionView() {
        
        let adNib = UINib(nibName: "AdsCollectionViewCell", bundle: nil)
        imagesCollectionView.register(adNib, forCellWithReuseIdentifier: "AdsCollectionViewCell")
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        
        let itemsNib = UINib(nibName: "ItemsCollectionViewCell", bundle: nil)
        relatedCollectionView.register(itemsNib, forCellWithReuseIdentifier: "ItemsCollectionViewCell")
        relatedCollectionView.delegate = self
        relatedCollectionView.dataSource = self
    }
    
    @IBAction func addToCartBtnTapped(_ sender: Any) {
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let addToCartVC = homeStoryboard.instantiateViewController(withIdentifier: "AddToCartVC")
        self.addChild(addToCartVC)
        addToCartVC.view.frame = self.view.frame
        self.view.addSubview((addToCartVC.view)!)
        addToCartVC.didMove(toParent: self)
    }
    
}

extension ItemDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == imagesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdsCollectionViewCell", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCollectionViewCell", for: indexPath)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == imagesCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        } else {
            return CGSize(width: collectionView.frame.width / 2.4, height: collectionView.frame.height)
        }
    }
    
}
