//
//  HomeVC.swift
//  Merca
//
//  Created by Khaled Bohout on 05/02/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: - IBoutlets
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var homeItems = [HomeItemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMockingData()
        setUpTableView()
        
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false

        // Do any additional setup after loading the view.
    }
    
    func addMockingData() {
        
        let type = ["ads", "categories", "stores", "occasions", "items"]
        
        let homeModel = HomeElement(image: "", title: "")
        let homeElements = [homeModel, homeModel, homeModel, homeModel]
        
        for i in 0...4 {
            
            let item = HomeItemModel(type: type[i], elements: homeElements)
            homeItems.append(item)
        }
        
        print(homeItems.count)
        
        homeTableView.reloadData()
        
        
    }
    
    func setUpTableView() {
        
        let homeAdNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(homeAdNib, forCellReuseIdentifier: "HomeTableViewCell")
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return homeItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.delegate = self
        cell.index = indexPath.row
        cell.setUpcollectionViewCells()
        cell.configureCell(collectionViewItems: homeItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = homeItems[indexPath.row].type
        
        if type == "ads" {
            
            return tableView.frame.width / 2
            
        } else if type == "items" {
            
            return (tableView.frame.width / 2.2) + 45
            
        } else if type == "stores" {
            
            return (tableView.frame.width / 3.65) + 45
            
        } else if type == "categories" {
            
            return (tableView.frame.width / 3) + 45
            
        } else if type == "occasions" {
            
            return (tableView.frame.width / 2.2) + 45
            
        } else {
            
            return 0
        }
    }
    
}

//MARK:- HomeTableViewCellDelegate

extension HomeVC: HomeTableViewCellDelegate {
    
    func seeMoreBtnTapped(index: Int) {
        
        let type = homeItems[index].type
        
        if type == "categories" {
            
            let storyBoard = UIStoryboard(name: "Home", bundle: nil)
            
            let categoriesVC = storyBoard.instantiateViewController(identifier: "CategoriesVC")
            
            self.navigationController?.pushViewController(categoriesVC, animated: true)
            
        } else if type == "stores" {
        
            let storyBoard = UIStoryboard(name: "Home", bundle: nil)
            
            let storesListVC = storyBoard.instantiateViewController(identifier: "StoresListVC") as! StoresListVC
            
            self.navigationController?.pushViewController(storesListVC, animated: true)
            
        } else if type == "occasions" {
            
            let storyBoard = UIStoryboard(name: "Home", bundle: nil)
            
            let occasionsVC = storyBoard.instantiateViewController(identifier: "OccasionsVC") as! OccasionsVC
            
            self.navigationController?.pushViewController(occasionsVC, animated: true)
            
        } else if type == "items" {
            

        }
    }
    
}
