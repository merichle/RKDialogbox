//
//  UIWindow.swift
//  RKDialogbox
//
//  Created by Ramazan Karami on 1/14/21.
//

import UIKit

extension UIWindow {
    
    static func visibleWindow() -> UIWindow? {
        var currentWindow = UIApplication.shared.keyWindow
        if currentWindow == nil {
            let frontToBackWindows = Array(UIApplication.shared.windows.reversed())
            for window in frontToBackWindows {
                if window.windowLevel == UIWindow.Level.normal {
                    currentWindow = window
                    break
                }
            }
        }
        return currentWindow
    }

    static var boundsRootViewController: CGRect {
        return UIWindow.visibleWindow()?.rootViewController?.view.bounds ?? .zero
    }
}
