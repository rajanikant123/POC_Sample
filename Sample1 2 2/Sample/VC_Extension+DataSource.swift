//
//  VC_Extension+DataSource.swift
//  Sample
//
//  Created by rajnikant on 16/01/19.
//  Copyright © 2019 rajnikant. All rights reserved.
//

import UIKit
import Foundation
import AlamofireImage

extension ViewController : UICollectionViewDataSource{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model?.rows?.count ?? 0
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
     
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CustomCollectionCell
        let object  = self.model?.rows? [indexPath.row]
        cell.lblTitle.text = object?.title
        cell.lblDescription.text = object?.description
        cell.lblTitle.text = object?.title
        if let _ = object?.imageHref {
        let url = URL(string:(object?.imageHref)!)!
        let placeholderImage = UIImage(named: imgPlaceholder)!
        
        cell.imgObject.af_setImage(withURL: url, placeholderImage: placeholderImage)
            
        }else {
            cell.imgObject.image = UIImage(named: imgPlaceholder)!
        }
        return cell
    }

}

