//
//  UIview+Extensions.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 25.09.2021.
//

import UIKit

extension UIView {

    public func startPressedAnimationCommon(withDuration: CGFloat = 0.3, completion: @escaping (_ finish: Bool) -> Void) {

        self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95) 
        UIView.animate(withDuration: TimeInterval(withDuration),
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.8),
            initialSpringVelocity: CGFloat(6.0),
            options: UIView.AnimationOptions.allowUserInteraction,
            animations: {

                self.transform = CGAffineTransform.identity

        }, completion: completion)

        self.layoutIfNeeded()
    }
    
}

