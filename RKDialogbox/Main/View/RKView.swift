//
//  RKView.swift
//  RKDialogbox
//
//  Created by Ramazan Karami on 1/14/21.
//

import UIKit

@IBDesignable class RKView: UIButton {
    
    @IBInspectable public var cornerRadius: CGFloat = 0 { didSet { updateUI() } }
    @IBInspectable public var bottomLeft: Bool = false { didSet { updateUI() } }
    @IBInspectable public var bottomRight: Bool = false { didSet { updateUI() } }
    @IBInspectable public var topLeft: Bool = false { didSet { updateUI() } }
    @IBInspectable public var topRight: Bool = false { didSet { updateUI() } }
    
    @IBInspectable public var borderWidth: CGFloat = 0 { didSet { updateUI() } }
    @IBInspectable public var borderColor: UIColor? { didSet { updateUI() } }
}

// MARK: - override
extension RKView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateUI()
    }
}

// MARK: - public func
extension RKView {
    
    func updateUI() {
        setCornerRadius()
        if let borderColor = borderColor, borderColor != .clear {
            setBoarder(borderColor: borderColor)
        } else {
            removePreviousBorder()
        }
        backgroundColor = self.backgroundColor
    }
}

// MARK: - private func
private extension RKView {
    
    func setCornerRadius() {
        layer.cornerRadius = cornerRadius
        var maskedCorners: CACornerMask = []
        if bottomLeft {
            maskedCorners.insert(.layerMinXMaxYCorner)
        }
        if bottomRight {
            maskedCorners.insert(.layerMaxXMaxYCorner)
        }
        if topLeft {
            maskedCorners.insert(.layerMinXMinYCorner)
        }
        if topRight {
            maskedCorners.insert(.layerMaxXMinYCorner)
        }
        if bottomLeft || bottomRight || topLeft || topRight {
            layer.maskedCorners = maskedCorners
        }
        clipsToBounds = cornerRadius > 0
    }
    
    func removePreviousBorder() {
        layer.borderWidth = 0
        layer.borderColor = UIColor.clear.cgColor
    }
    
    func setBoarder(borderColor: UIColor) {
        removePreviousBorder()
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
