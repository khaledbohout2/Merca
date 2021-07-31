//
//  SubCategoriesVC.swift
//  Merca
//
//  Created by Khaled Bohout on 20/02/2021.
//

import UIKit

class SubCategoriesVC: UIViewController {
    
    @IBOutlet weak var subCategoriesCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initTableView()
    }
    
    func initTableView() {
        
        subCategoriesCollectionView.delegate = self
        subCategoriesCollectionView.dataSource = self
        let subCategoryNib = UINib(nibName: "SubCategoryCollectionView", bundle: nil)
        subCategoriesCollectionView.register(subCategoryNib, forCellWithReuseIdentifier: "SubCategoryCollectionView")

    }


}

extension SubCategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoryCollectionView", for: indexPath) as! SubCategoryCollectionView
        cell.subCategoryNameLbl.font = UIFont(name: "Montserrat-Medium", size: 16)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: (Int((collectionView.frame.width)) - 15) / 2, height: (Int(((collectionView.frame.width)) - 15) / 2) + 33)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let subCategoryItemsList = storyBoard.instantiateViewController(identifier: "SubCategoryItemsList")
        self.navigationController?.pushViewController(subCategoryItemsList, animated: true)
        
    }
    
    
    
}
