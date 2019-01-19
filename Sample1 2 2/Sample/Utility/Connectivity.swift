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
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
