//
//  Connectivity.swift
//  Sample
//
//  Created by Rajanikant Hole on 1/19/19.
//  Copyright © 2019 rajnikant. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    
    /**
     NetworkConnectivity Check.
     */
    class func isConnectedToInternet() ->Bool {
        if let manager = NetworkReachabilityManager() {
            return manager.isReachable
        }else {
            return false
        }
    }
}
