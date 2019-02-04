//
//  ViewController.swift
//  Sample
//
//  Created by rajnikant on 16/01/19.
//  Copyright © 2019 rajnikant. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    /**
     Properties.
     */
    
    static let annotationPadding: CGFloat = 4
    
    var refresher:UIRefreshControl = UIRefreshControl()
    var model : Model?
    var viewModel : ViewModel = ViewModel()
    
    
    var listCollectionView : UICollectionView?
    
    
    var titleLbl: UILabel = {
        
        let label = UILabel()
        label.text = "Loading"
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    
    
    private var _imageView: UIImageView?
    public var imageView: UIImageView {
        get {
            if let imageView = _imageView {
                return imageView
            }
            let imageView = UIImageView(frame: roundedCornersView.bounds)
            _imageView = imageView
            
            roundedCornersView.addSubview(imageView)
            imageView.contentMode = .scaleAspectFit
            
            return imageView
        }
    }
    
    private var _descriptionLabel: UILabel?
    public var descriptionLabel: UILabel {
        get {
            if let descriptionLabel = _descriptionLabel {
                return descriptionLabel
            }
            let descriptionLabel = UILabel()
            _descriptionLabel = descriptionLabel
            
            roundedCornersView.addSubview(descriptionLabel)
            
            descriptionLabel.numberOfLines = 0
            descriptionLabel.font = UIFont.defaultFont
            
            return descriptionLabel
        }
    }
    
    
    
    private var _roundedCornersView: UIView?
    public var roundedCornersView: UIView {
        get {
            if let roundedCornersView = _roundedCornersView {
                return roundedCornersView
            }
            let roundedCornersView = UIView(frame: self.view.bounds)
            _roundedCornersView = roundedCornersView
            
            self.view.addSubview(roundedCornersView)
            roundedCornersView.addConstraintsAlignedToSuperview()
            
            roundedCornersView.clipsToBounds = true
            roundedCornersView.layer.cornerRadius = 5
            roundedCornersView.backgroundColor = .white
            
            return roundedCornersView
        }
    }
    
    /**
     Orinataion change method.
     */
    override open func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        listCollectionView?.collectionViewLayout.invalidateLayout()
        DispatchQueue.main.async{
            self.listCollectionView?.reloadData()
        }
        
    }
    
    
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        self.setupInitialData()
    }
    
    /**
     Get list of data.
     */
    
    func getData() {
        
        if Connectivity.isConnectedToInternet() {
            
            self.viewModel.getList {
                
                self.model = self.viewModel.model
                self.titleLbl.text = self.model?.title
                self.listCollectionView?.reloadData()
                self.refresher.endRefreshing()
            }
        }else {
            
            let alertController = UIAlertController(title: "Alert", message: "The Internet is not available", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertController, animated: true, completion: nil)
            
        }
        
        
    }
    
    @objc func loadData() {
        self.getData()
    }
    
    
    
}

