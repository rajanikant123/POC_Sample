//
//  APITest.swift
//  SampleTests
//
//  Created by Rajanikant Hole on 2/4/19.
//  Copyright © 2019 rajnikant. All rights reserved.
//

import XCTest
import Alamofire
@testable import Sample

class APITest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /**
     API Success testCase
     */
    
    func testAPI() {
        
            Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
                .validate(statusCode: 200..<600)
                .responseString { (jsonData) in
              
                        if jsonData.result.isSuccess {
                            XCTAssertTrue(jsonData.result.isSuccess)
                        }else {
                            XCTAssertFalse(true)
                        }
                    
            }
    }
    
    /**
     API Fail testCase
     */
    
    func testAPIFails() {
        
       
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<600)
            .responseString { (jsonData) in
                
                if jsonData.result.isFailure {
                     XCTAssertTrue(jsonData.result.isFailure)
                }else {
                    XCTAssertFalse(true)
                }
                
        }
    }
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
