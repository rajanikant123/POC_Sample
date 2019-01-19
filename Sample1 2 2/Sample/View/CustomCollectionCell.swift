//
//  CustomCollectionCell.swift
//  Sample
//
//  Created by rajnikant on 16/01/19.
//  Copyright © 2019 rajnikant. All rights reserved.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {

    @IBOutlet var viewBackground: UIView!
    @IBOutlet weak var imgObject: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.viewBackground?.setAsCardBackground()
    }

}
