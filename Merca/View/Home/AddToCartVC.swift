//
//  AddToCartVC.swift
//  Merca
//
//  Created by Khaled Bohout on 19/03/2021.
//

import UIKit

class AddToCartVC: UIViewController {

    @IBOutlet weak var datesCollectionView: UICollectionView!
    
    @IBOutlet weak var timesCollectionView: UICollectionView!
    
    @IBOutlet weak var mainView: UIView!
    
    var dismisViewGesture = UITapGestureRecognizer()
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUpUI()

    }
    
    func setUpUI() {
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        mainView.backgroundColor = UIColor(white: 1, alpha: 1.0)
        
        dismisViewGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismisView))
        dismisViewGesture.delegate = self
        self.view.addGestureRecognizer(dismisViewGesture)
        
        
    }
    
    func initCollectionViews() {
        
        let datesNib = UINib(nibName: "DatesCollectionViewCell", bundle: nil)
        let pickDateNib = UINib(nibName: "PickDateCollectionViewCell", bundle: nil)
        datesCollectionView.register(datesNib, forCellWithReuseIdentifier: "DatesCollectionViewCell")
        datesCollectionView.register(pickDateNib, forCellWithReuseIdentifier: "PickDateCollectionViewCell")
        timesCollectionView.register(datesNib, forCellWithReuseIdentifier: "DatesCollectionViewCell")
        datesCollectionView.delegate = self
        datesCollectionView.dataSource = self
        timesCollectionView.delegate = self
        timesCollectionView.dataSource = self
    }
    
    @IBAction func plusBtnTapped(_ sender: Any) {
    }
    
    @IBAction func minusBtnTapped(_ sender: Any) {
    }
    
    @IBAction func confirmBtnTapped(_ sender: Any) {
    }
    
    @objc func dismisView(_ sender: UITapGestureRecognizer) {
        self.view.removeFromSuperview()
    }
    
}

extension AddToCartVC: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view?.isDescendant(of: self.datesCollectionView) == true || touch.view?.isDescendant(of: self.timesCollectionView) == true {
            return false
        }
        return true
    }
}

extension AddToCartVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == datesCollectionView {
        if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PickDateCollectionViewCell", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DatesCollectionViewCell", for: indexPath)
            return cell
        }
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DatesCollectionViewCell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == datesCollectionView {
            if indexPath.row == 2 {
                
                let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
                let datePickerVC = homeStoryboard.instantiateViewController(withIdentifier: "DatePickerVC")
                self.addChild(datePickerVC)
                datePickerVC.view.frame = self.view.frame
                self.view.addSubview((datePickerVC.view)!)
                datePickerVC.didMove(toParent: self)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == datesCollectionView {
            return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
            
        } else {
            
            return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
        }
    }
    
    
    
}
