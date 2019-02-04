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

/**
 Extension of ViewController and UICollectionViewDataSource,PinterestLayoutDelegate implemention.
 */
extension ViewController : UICollectionViewDataSource , PinterestLayoutDelegate  {
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.model?.rows?.count ?? 0
        
    }
    
    public func collectionView(collectionView: UICollectionView,
                               heightForImageAtIndexPath indexPath: IndexPath,
                               withWidth: CGFloat) -> CGFloat {
        
        return  150
    }
    
    public func collectionView(collectionView: UICollectionView,
                               heightForAnnotationAtIndexPath indexPath: IndexPath,
                               withWidth: CGFloat) -> CGFloat {
        
        let object  = self.model?.rows? [indexPath.row]
        
        var heightLbl : CGFloat = 0.0
        let font = UIFont.defaultFont
        
        if let text = object?.title {
            let textHeight = text.heightForWidth(width: withWidth, font: font)
            
            
            heightLbl = PinterestCell.annotationPadding * 2 + textHeight
            
        }
        if let text = object?.description {
            let textHeight = text.heightForWidth(width: withWidth, font: font)
            
            
            heightLbl = heightLbl + PinterestCell.annotationPadding * 2 + textHeight
        }
        return heightLbl  + PinterestCell.annotationPadding + PinterestCell.annotationPadding
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: pinterestCellIdentifier,
            for: indexPath) as! PinterestCell
        
        let object  = self.model?.rows? [indexPath.row]
        
        cell.tileLabel.text = object?.title
        cell.descriptionLabel.text = object?.description
        if let _ = object?.imageHref {
            let url = URL(string:(object?.imageHref)!)!
            let placeholderImage = UIImage(named: imgPlaceholder)!
            
            cell.imageView.af_setImage(withURL: url, placeholderImage: placeholderImage)
            
        }else {
            cell.imageView.image = UIImage(named: imgPlaceholder)!
        }
        cell.roundedCornersView.backgroundColor = UIColor.white
        cell.roundedCornersView.setAsCardBackground()
        
        return cell
    }
    
    
    
}

/**
 Extension addView methods
 */

extension ViewController {
    
    func setupInitialData() {
        
        roundedCornersView.addSubview(titleLbl)
        self.addConstraintsForTilteLbl()
        let layout = PinterestLayout()
        listCollectionView?.collectionViewLayout = layout
        layout.delegate = self
        layout.cellPadding = 5
        if deviceIdiom == .pad  {
            layout.numberOfColumns = 3
        }else {
            layout.numberOfColumns = 1
        }
        
        listCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        roundedCornersView.addSubview(listCollectionView! )
        self.addConstraintsForCollection()
        setupCollectionViewInsets()
        listCollectionView?.register(
            PinterestCell.self,
            forCellWithReuseIdentifier: pinterestCellIdentifier
        )
        
        listCollectionView?.contentInset = UIEdgeInsets(
            top: 20,
            left: 5,
            bottom: 49,
            right: 5
        )
        listCollectionView?.dataSource = self
        listCollectionView?.reloadData()
    }
    
    func setupCollectionViewInsets() {
        listCollectionView?.backgroundColor = .clear
        listCollectionView?.contentInset = UIEdgeInsets(
            top: 15,
            left: 5,
            bottom: 5,
            right: 5
        )
        self.refresher.addTarget(self, action: #selector(loadData), for: .valueChanged)
        self.listCollectionView!.addSubview(refresher)
    }
    
    
    func addConstraintsForTilteLbl() {
        self.titleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        roundedCornersView.addConstraint(
            NSLayoutConstraint(
                item: self.titleLbl,
                attribute: .top,
                relatedBy: .equal,
                toItem: roundedCornersView,
                attribute: NSLayoutConstraint.Attribute.top,
                multiplier: 1,
                constant: 0
            )
        )
        roundedCornersView.addConstraint(
            NSLayoutConstraint(
                item: self.titleLbl,
                attribute: .leading,
                relatedBy: .equal,
                toItem: roundedCornersView,
                attribute: .leading,
                multiplier: 1,
                constant: 0
            )
        )
        roundedCornersView.addConstraint(
            NSLayoutConstraint(
                item: self.titleLbl,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: roundedCornersView,
                attribute: .trailing,
                multiplier: 1,
                constant: 0
            )
        )
        
        let imageViewHeightLayoutConstraint =
            NSLayoutConstraint(
                item: self.titleLbl,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 90
        )
        self.titleLbl.addConstraint(imageViewHeightLayoutConstraint)
    }
    
    func addConstraintsForCollection() {
        
        if let collectionView = self.listCollectionView {
            
            
            self.listCollectionView?.translatesAutoresizingMaskIntoConstraints = false
            
            roundedCornersView.addConstraint(
                NSLayoutConstraint(
                    item: collectionView,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: self.titleLbl,
                    attribute: .bottom,
                    multiplier: 1,
                    constant: 0
                )
            )
            roundedCornersView.addConstraint(
                NSLayoutConstraint(
                    item: collectionView,
                    attribute: .left,
                    relatedBy: .equal,
                    toItem: roundedCornersView,
                    attribute: .left,
                    multiplier: 1,
                    constant: 0
                )
            )
            roundedCornersView.addConstraint(
                NSLayoutConstraint(
                    item: collectionView,
                    attribute: .right,
                    relatedBy: .equal,
                    toItem: roundedCornersView,
                    attribute: .right,
                    multiplier: 1,
                    constant: 0
                )
            )
            let bottomConstraint = NSLayoutConstraint(
                item: collectionView,
                attribute: .bottom,
                relatedBy: .greaterThanOrEqual,
                toItem: roundedCornersView,
                attribute: .bottom,
                multiplier: 1,
                constant: 0
            )
            roundedCornersView.addConstraint(bottomConstraint)
        }
    }
    
}

