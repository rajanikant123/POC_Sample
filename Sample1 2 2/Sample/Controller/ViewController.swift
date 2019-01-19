//
//  ViewController.swift
//  Sample
//
//  Created by rajnikant on 16/01/19.
//  Copyright © 2019 rajnikant. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout {

    var refresher:UIRefreshControl = UIRefreshControl()
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var model : Model?
    var viewModel : ViewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.dataSource = self
    
        setUpData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func getData() {
        if Connectivity.isConnectedToInternet() {
            
            self.viewModel.getList {
                
                self.model = self.viewModel.model
                self.lblTitle.text = self.model?.title
                self.collectionView.reloadData()
            }
        }
    
        
    }
    
    
    func setUpData() {
       
        var cellWidth : CGFloat = 0.0
        var cellheight : CGFloat = 0.0
        
        if deviceIdiom == .pad  {
            cellWidth  = (screenSize.width/4) - 20
            cellheight = 290
        }else{
           
            cellWidth  = screenSize.width - 10
            cellheight = 250
            
        }
        let cellSize = CGSize(width: cellWidth , height:cellheight)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        self.refresher.addTarget(self, action: #selector(loadData), for: .valueChanged)
        self.collectionView!.addSubview(refresher)
        
        self.getData()
        
    }
    
    @objc func loadData() {
        self.getData()
    }
}

