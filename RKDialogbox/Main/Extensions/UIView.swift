//
//  UIView.swift
//  RKDialogbox
//
//  Created by Ramazan Karami on 1/14/21.
//

import UIKit

extension UIView {
    
    func loadViewFromNib() {
        let bundle = Bundle (for: type(of: self))
        let nib = UINib(nibName: String(describing:type(of: self)), bundle: bundle)
        nib.instantiate(withOwner: self, options: nil)
    }
}
