//
//  ApiClient.swift
//  Sample
//
//  Created by rajnikant on 16/01/19.
//  Copyright © 2019 rajnikant. All rights reserved.
//

import Foundation
import Alamofire

class ApiClient: NSObject {
    static let sharedInstance = ApiClient()
    private override init() {
        
    }
    
    /**
     Get API  Call.
     */
    func fetApiRequest(url : String, completion:@escaping ( Model) -> () ) {
        
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<600)
            .responseString { (jsonData) in
                
                do {
                    
                    if let value = jsonData.result.value {
                        let data = Data(value.utf8)
                        let jsonDecoder = JSONDecoder()
                        let responseModel = try jsonDecoder.decode(Model.self, from: data)
                        completion(responseModel)
                    }
                    
                }
                catch{
                    print("error")
                }
                
        }
        
    }
    
    
    
}

