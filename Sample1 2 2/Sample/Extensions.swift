//
//  Extensions.swift
//  Sample
//
//  Created by Rajanikant Hole on 1/19/19.
//  Copyright © 2019 rajnikant. All rights reserved.
//

import AVFoundation
import UIKit

/**
 Extension UIImage
 */

public extension UIImage {
    /**
     Calculates the best height of the image for available width.
     */
    public func height(forWidth width: CGFloat) -> CGFloat {
        let boundingRect = CGRect(
            x: 0,
            y: 0,
            width: width,
            height: CGFloat(MAXFLOAT)
        )
        let rect = AVMakeRect(
            aspectRatio: size,
            insideRect: boundingRect
        )
        return rect.size.height
    }
}

/**
 Extension String
 */
public extension String {
    /**
     Calculates the best height of the text for available width and font used.
     */
    public func heightForWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let rect = NSString(string: self).boundingRect(
            with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: font],
            context: nil
        )
        return ceil(rect.height)
    }
}

/**
 Extension UIFont
 */
extension UIFont {
    
    class var defaultFont: UIFont {
        return UIFont(name: "Arial-ItalicMT", size: 16)!
    }
}

/**
 Extension UIView
 */
extension UIView {
    func setAsCardBackground() {
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.7
    }
    
    func addConstraintsAlignedToSuperview(top: CGFloat = 0,
                                          leading: CGFloat = 0,
                                          bottom: CGFloat = 0,
                                          trailing: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraint(
            NSLayoutConstraint(
                item: self,
                attribute: .top,
                relatedBy: .equal,
                toItem: superview,
                attribute: .top,
                multiplier: 1,
                constant: top
            )
        )
        superview?.addConstraint(
            NSLayoutConstraint(
                item: self,
                attribute: .leading,
                relatedBy: .equal,
                toItem: superview,
                attribute: .leading,
                multiplier: 1,
                constant: leading
            )
        )
        superview?.addConstraint(
            NSLayoutConstraint(
                item: self,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: superview,
                attribute: .bottom,
                multiplier: 1,
                constant: bottom
            )
        )
        superview?.addConstraint(
            NSLayoutConstraint(
                item: self,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: superview,
                attribute: .trailing,
                multiplier: 1,
                constant: trailing
            )
        )
    }
    
    
}



