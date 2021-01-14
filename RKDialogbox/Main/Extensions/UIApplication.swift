//
//  UIApplication.swift
//  RKDialogbox
//
//  Created by Ramazan Karami on 1/14/21.
//

import UIKit

extension UIApplication {
    
    func dismissKeyboard() {
        sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
        UIWindow.visibleWindow()?.endEditing(true)
    }

    func safeAreaInsets() -> UIEdgeInsets{
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIApplication.shared.keyWindow?.layoutMargins ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}
