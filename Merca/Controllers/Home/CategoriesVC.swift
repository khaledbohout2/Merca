//
//  CategoriesVC.swift
//  Merca
//
//  Created by Khaled Bohout on 20/02/2021.
//

import UIKit

class CategoriesVC: UIViewController {
    
    @IBOutlet weak var categoriesTableView: UITableView!
    
    var selectedRow: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    func setUpTableView() {
        
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        let categoryNib = UINib(nibName: "CategoryTbleViewCell", bundle: nil)
        categoriesTableView.register(categoryNib, forCellReuseIdentifier: "CategoryTbleViewCell")
        
    }
    

}

extension CategoriesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTbleViewCell", for: indexPath) as! CategoryTbleViewCell
        cell.initTableView()
        cell.index = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedRow = indexPath
        self.categoriesTableView.beginUpdates()
        self.categoriesTableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath == selectedRow {
            
            return tableView.frame.width / 1.1

        } else {
        
           return (tableView.frame.width / 2) + 15
            
        }
    }
    
}

extension CategoriesVC: SubCategoryCollectionViewDelegate {
    
    func showMoreTapped(index: Int) {
        
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let subCategoriesVC = storyBoard.instantiateViewController(identifier: "SubCategoriesVC")
        self.navigationController?.pushViewController(subCategoriesVC, animated: true)
    }
    
    

}
