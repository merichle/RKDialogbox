//
//  RKDialogbox.swift
//  RKDialogbox
//
//  Created by Ramazan Karami on 1/14/21.
//

import UIKit

public class RKDialogbox: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var cardView: RKView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var firstButton: RKView!
    @IBOutlet weak var secondButton: RKView!
    
    var firstActionCallback: (() -> Void)?
    var secondActionCallback: (() -> Void)?
    
    var isDismissible: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: UIWindow.boundsRootViewController)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    @IBAction func dismissTouchUpInside(_ sender: Any) {
        if isDismissible {
            doAction(.dismiss)
        }
    }
    
    @IBAction func firstButtonTouchUpInside(_ sender: Any) {
        doAction(.first)
    }
    
    @IBAction func secondButtonTouchUpInside(_ sender: Any) {
        doAction(.second)
    }
}

//MARK: - private func
private extension RKDialogbox {
    
    func commonInit(){
        loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    
    func show(
        title: String? = "",
        message: String? = "",
        firstButtonTitle: String? = nil,
        secondButtonTitle: String? = nil
    ) {
        guard let window = UIWindow.visibleWindow() else { return }
        UIApplication.shared.dismissKeyboard()
        titleLabel.text = title
        messageLabel.text = message
        if let firstButtonTitle = firstButtonTitle {
            firstButton.setTitle(firstButtonTitle, for: .normal)
        }
        if let secondButtonTitle = secondButtonTitle {
            secondButton.setTitle(secondButtonTitle, for: .normal)
        }
        if !isDismissible {
            closeButton.isHidden = true
        }
        self.contentView.alpha = 0
        self.cardView.transform = CGAffineTransform(translationX: 0, y: self.cardView.frame.height)
        window.addSubview(self)
        window.bringSubviewToFront(self)
        UIView.animate(withDuration: 0.3) {
            self.contentView.alpha = 1
            self.cardView.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }
    
    func hide() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.removeFromSuperview()
        }
    }
    
    func doAction(_ type: ActionEnum) {
        UIView.animate(withDuration: 0.2, animations: {
            self.contentView.alpha = 0
            self.cardView.transform = CGAffineTransform(translationX: 0, y: self.cardView.frame.height)
        }) { isFinished in
            if isFinished {
                switch type {
                case .dismiss:
                    break
                    
                case .first:
                    self.firstActionCallback?()
                    
                case .second:
                    self.secondActionCallback?()
                    
                }
                self.hide()
            }
        }
    }
}

//MARK: - Enum
private extension RKDialogbox {
    
    enum ActionEnum {
        case dismiss
        case first
        case second
    }
}

//MARK: - static func
public extension RKDialogbox {
    
    static func oneButton(
        title: String? = "",
        message: String? = "",
        firstButtonTitle: String? = nil,
        firstActionCallback: (() -> Void)? = nil,
        isDismissible: Bool = true
    ) {
        DispatchQueue.main.async {
            let rkDialogbox = RKDialogbox()
            rkDialogbox.isDismissible = isDismissible
            rkDialogbox.secondButton.removeFromSuperview()
            rkDialogbox.firstActionCallback = firstActionCallback
            rkDialogbox.show(title: title,
                             message: message,
                             firstButtonTitle: firstButtonTitle)
        }
    }
    
    static func twoButton(
        title: String? = "",
        message: String? = "",
        firstButtonTitle: String? = nil,
        secondButtonTitle: String? = nil,
        isDismissible: Bool = true,
        firstActionCallback: (() -> Void)? = nil,
        secondActionCallback: (() -> Void)? = nil
    ) {
        DispatchQueue.main.async {
            let rkDialogbox = RKDialogbox()
            rkDialogbox.isDismissible = isDismissible
            rkDialogbox.firstActionCallback = firstActionCallback
            rkDialogbox.secondActionCallback = secondActionCallback
            rkDialogbox.show(title: title,
                             message: message,
                             firstButtonTitle: firstButtonTitle,
                             secondButtonTitle: secondButtonTitle)
        }
    }
}
