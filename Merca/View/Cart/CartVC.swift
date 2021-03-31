//
//  CartVC.swift
//  Merca
//
//  Created by Khaled Bohout on 20/03/2021.
//

import UIKit
import IBAnimatable

class CartVC: UIViewController {

    @IBOutlet weak var containerView: AnimatableView!
    @IBOutlet weak var noItemsView: UIView!
    @IBOutlet weak var cartTableView: UITableView!
    
    var deletePlanetIndexPath: IndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        var frame = cartTableView.frame
        frame.size.height = cartTableView.contentSize.height
        cartTableView.frame = frame
        
        cartTableView.reloadData()
        cartTableView.layoutIfNeeded()
        cartTableView.heightAnchor.constraint(equalToConstant: cartTableView.contentSize.height).isActive = true
    }
    

    func initTableView() {
        
        let cartNib = UINib(nibName: "CartTableViewCell", bundle: nil)
        cartTableView.register(cartNib, forCellReuseIdentifier: "CartTableViewCell")
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }

}

extension CartVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
            -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
                // delete the item here
                completionHandler(true)
            }
            deleteAction.image = UIImage(named: "clear")
            deleteAction.backgroundColor = hexStringToUIColor(hex: "#000000")
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            return configuration
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        cartTableView.beginUpdates()

        cartTableView.deleteRows(at: [indexPath], with: .automatic)
        
        cartTableView.endUpdates()
    }
    
    
}
