//
//  Extensions.swift
//  Sample
//
//  Created by Rajanikant Hole on 1/19/19.
//  Copyright © 2019 rajnikant. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setAsCardBackground() {
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.7
    }
}


