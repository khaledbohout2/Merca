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
    @IBOutlet weak var listingBtn: UIButton!
    @IBOutlet weak var itemsTableView: UITableView!
    
    var gridView = true
    
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
        let itemVerticalNib = UINib(nibName: "SubCategoryItemsTableViewCell", bundle: nil)
        
        itemsTableView.register(itemVerticalNib, forCellReuseIdentifier: "SubCategoryItemsTableViewCell")
        
        itemsCollectionView.register(itemCellNib, forCellWithReuseIdentifier: "SubcategoryItemsCollectionViewCell")
        
        self.itemsTableView.delegate = self
        self.itemsTableView.dataSource = self
    }
    
    func initSliderCollectionView() {
        
        let sliderNib = UINib(nibName: "SubCategorySliderCollectionViewCell", bundle: nil)
        sliderCollectionView.register(sliderNib, forCellWithReuseIdentifier: "SubCategorySliderCollectionViewCell")
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        
    }
    
    //MARK:- IBActions
    
    @IBAction func lustingBtnTapped(_ sender: Any) {
        
        gridView = !gridView
        
        if gridView {
            
            itemsTableView.isHidden = false
            itemsCollectionView.isHidden = true
            
        } else {
            
            self.itemsTableView.isHidden = true
            self.itemsTableView.isHidden = false
        }

    }
    
    
}

extension SubCategoryItemsList: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return 8
  }
  
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == itemsCollectionView {
            
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubcategoryItemsCollectionViewCell", for: indexPath as IndexPath) as! SubcategoryItemsCollectionViewCell
            return cell
            


    
    } else {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategorySliderCollectionViewCell", for: indexPath as IndexPath) as! SubCategorySliderCollectionViewCell
        
        if indexPath.row == 1 {
            
            cell.subCategoryNameLbl.textColor = hexStringToUIColor(hex: "#00C1B2")
        }

        return cell
    }
  }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        
        let itemDetailsVC = storyBoard.instantiateViewController(identifier: "ItemDetailsVC") as! ItemDetailsVC
        
        self.navigationController?.pushViewController(itemDetailsVC, animated: true)
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

extension SubCategoryItemsList: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryItemsTableViewCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        
        let itemDetailsVC = storyBoard.instantiateViewController(identifier: "ItemDetailsVC") as! ItemDetailsVC
        
        self.navigationController?.pushViewController(itemDetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 206
    }
    
}
