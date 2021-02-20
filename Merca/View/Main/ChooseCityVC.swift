//
//  ChooseCityVC.swift
//  Merca
//
//  Created by Khaled Bohout on 11/02/2021.
//

import UIKit

class ChooseCityVC: UIViewController {
    
    
    @IBOutlet weak var districtLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var cityunderLineView: UIView!
    @IBOutlet weak var areaView: UIView!
    @IBOutlet weak var districtUnderLineView: UIView!
    @IBOutlet weak var areaLbl: UILabel!
    @IBOutlet weak var confirmBtn: UIButton!
    
    
    
    var cities = ["Cairo", "Alex"]
    var distiricts = ["Haram", "Nasr City"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    

    @IBAction func countryBtnTapped(_ sender: Any) {
        
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if let firstSubview = actionSheetController.view.subviews.first, let alertContentView = firstSubview.subviews.first {
            for view in alertContentView.subviews {
                view.backgroundColor = hexStringToUIColor(hex: "#FFFFFF")
                view.layer.cornerRadius = 15.0
            }
        }
        
        actionSheetController.view.tintColor = hexStringToUIColor(hex: "#000000")

        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        
    
        
        
        actionSheetController.addAction(cancelActionButton)
        
        for city in cities {

        let action = UIAlertAction(title: city, style: .default)
            { _ in
            
               print(city)
            self.cityunderLineView.backgroundColor = hexStringToUIColor(hex: "#00C1B2")
            self.areaView.isHidden = false
            self.districtLbl.isHidden = false
            self.cityLbl.textColor = hexStringToUIColor(hex: "#000000")
            self.cityLbl.text = city
        }

            actionSheetController.addAction(action)
        }
        
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    @IBAction func areaButtonTapped(_ sender: Any) {
        
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if let firstSubview = actionSheetController.view.subviews.first, let alertContentView = firstSubview.subviews.first {
            for view in alertContentView.subviews {
                view.backgroundColor = hexStringToUIColor(hex: "#FFFFFF")
                view.layer.cornerRadius = 15.0
            }
        }
        
        actionSheetController.view.tintColor = hexStringToUIColor(hex: "#000000")

        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        
    
        
        
        actionSheetController.addAction(cancelActionButton)
        
        for area in distiricts {

        let action = UIAlertAction(title: area, style: .default)
            { _ in
            
               print(area)
            self.districtUnderLineView.backgroundColor = hexStringToUIColor(hex: "#00C1B2")
            self.areaView.isHidden = false
            self.districtLbl.isHidden = false
            self.areaLbl.textColor = hexStringToUIColor(hex: "#000000")
            self.areaLbl.text = area
            self.confirmBtn.backgroundColor = hexStringToUIColor(hex: "#00C1B2")
        }

            actionSheetController.addAction(action)
        }
        
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    
    //MARK:- IBActions
    
    @IBAction func confirmBtnTapped(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(identifier: "HomeVC")
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
}
