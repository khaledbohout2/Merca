//
//  OccasionsVC.swift
//  Merca
//
//  Created by Khaled Bohout on 06/03/2021.
//

import UIKit
import CollectionViewPagingLayout

class OccasionsVC: UIViewController {
    
    var banners = ["bouquet-roses-tulips", "Group 2804", "OF186Z1-1", "happy-birthday-cake-with-macaroons-flowers-stand", "smiley-girl-posing-with-placard_23-2148498992", "engagement-rings-with-flower_23-2148491780"]
    
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    @IBOutlet weak var allOccasionsCollectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    let layout = CollectionViewPagingLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionView()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = allOccasionsCollectionView.collectionViewLayout.collectionViewContentSize.height
        collectionViewHeight.constant = height
        self.view.layoutIfNeeded()
    }
    
    //MARK: - Methods
    
    /**
       func that init collection view
      - Parameters :
      - zero parameters
      */
    
    func initCollectionView() {
        
        featuredCollectionView.delegate = self
        featuredCollectionView.dataSource = self
        let nib = UINib(nibName: "BannersCollectionViewCell", bundle: nil)
        featuredCollectionView.register(nib, forCellWithReuseIdentifier: "BannersCollectionViewCell")
        
        featuredCollectionView.collectionViewLayout = layout
        featuredCollectionView.isPagingEnabled = true
        
        allOccasionsCollectionView.delegate = self
        allOccasionsCollectionView.dataSource = self
        let brandsNib = UINib(nibName: "SubCategoryCollectionView", bundle: nil)
        allOccasionsCollectionView.register(brandsNib, forCellWithReuseIdentifier: "SubCategoryCollectionView")

    }
    



}

//MARK: - UICollectionView Delegate and data source

extension OccasionsVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == featuredCollectionView {
        
        return 3
            
        } else {
            
            return 12
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == featuredCollectionView {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannersCollectionViewCell", for: indexPath) as! BannersCollectionViewCell
            
            if indexPath.row < banners.count + 1 {
            
            cell.bannerImageView.image = UIImage(named: banners[indexPath.row])
            } else {
                cell.bannerImageView.image = UIImage(named: banners[indexPath.row / 5])
            }
            
//        let photoLink = featuredBrands[indexPath.row].bannerPhoto ?? ""
//            print(photoLink)
//                        cell.bannerImageView.sd_setImage(with: URL(string: (SharedSettings.shared.settings?.setting?.bannersLink ?? "") + "/" + photoLink), placeholderImage: UIImage(named: "placeholder"), options: [.fromLoaderOnly])
        
        return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoryCollectionView", for: indexPath) as! SubCategoryCollectionView
            
            if indexPath.row < banners.count {
            
                cell.bannerImageView.image = UIImage(named: banners[indexPath.row])
            } else {
                cell.bannerImageView.image = UIImage(named: banners[indexPath.row / 5])
            }
      //      cell.configureCell(brand: brands[indexPath.row])
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == featuredCollectionView {
            
//            let storyBoard = UIStoryboard(name: "Lists", bundle: nil)
//            let paidOffersListVC = storyBoard.instantiateViewController(withIdentifier: "PaidOffersListVC") as! PaidOffersListVC
//            print(brands[indexPath.row].id!)
//            paidOffersListVC.vendorId = "\(brands[indexPath.row].id!)"
//            self.navigationController?.pushViewController(paidOffersListVC, animated: true)
        } else {
            
//            let storyBoard = UIStoryboard(name: "Lists", bundle: nil)
//            let paidOffersListVC = storyBoard.instantiateViewController(withIdentifier: "PaidOffersListVC") as! PaidOffersListVC
//            print(brands[indexPath.row].id!)
//            paidOffersListVC.vendorId = "\(featuredBrands[indexPath.row].id!)"
//            self.navigationController?.pushViewController(paidOffersListVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == featuredCollectionView {

            return layout.collectionViewContentSize
        

        } else {

            return CGSize(width: self.allOccasionsCollectionView.frame.width / 3, height: (self.allOccasionsCollectionView.frame.width / 3) + 33)
        }
    }
    
}
