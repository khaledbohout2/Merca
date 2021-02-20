//
//  UILabel.swift
//  GPless
//
//  Created by Khaled Bohout on 12/16/20.
//

import Foundation
import UIKit

extension UILabel {
    
    func setLocalization() {
        
       // let currentSvreen = Screens.cur //change this to current device

        let font = self.font.fontName

        let size = self.font.pointSize
        
        let newFont = font.localizableString()
        
        
        self.font = UIFont(name: newFont, size: size)
        
    }
    
}
