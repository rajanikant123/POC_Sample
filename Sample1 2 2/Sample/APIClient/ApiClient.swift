//
//  ApiClient.swift
//  Sample
//
//  Created by rajnikant on 16/01/19.
//  Copyright © 2019 rajnikant. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiClient: NSObject {
    static let sharedInstance = ApiClient()
    private override init() {
        
    }
    
    func fetApiRequest(url : String, completion:@escaping ( Model) -> () ) {
        
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<600)
            .responseString { (jsonData) in
                
                do {
                    let data = Data((jsonData.result.value?.utf8)!)
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(Model.self, from: data)
                    completion(responseModel)
                    
                }
                catch{
                    print("error")
                }
                
        }
        
    }
    

    
}
