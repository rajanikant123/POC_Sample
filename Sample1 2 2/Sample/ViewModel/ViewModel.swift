//
//  ViewModel.swift
//  Sample
//
//  Created by rajnikant on 16/01/19.
//  Copyright © 2019 rajnikant. All rights reserved.
//

import UIKit

class ViewModel: NSObject {

    var model : Model?
    
    func getList(completion: @escaping () -> Void) {
        
        ApiClient.sharedInstance.fetApiRequest(url: url) { (result) in
            
            DispatchQueue.main.async {
                self.model = result
                completion()
            }
        }
        
    }
    
}
