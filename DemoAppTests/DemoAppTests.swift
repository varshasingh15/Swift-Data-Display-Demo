//
//  DemoAppDemoAppTests.swift
//  DemoAppDemoAppTests
//
//  Created by Varsha Singh on 7/11/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import XCTest
@testable import DemoApp

class DemoAppAppTests: XCTestCase {
    
    var requestExpectation: XCTestExpectation?
    var courseArray: [CourseModel] = [] // contentArray : to store all data
    
    override func setUp() {
        super.setUp()
        //  This method is called before the invocation of each test method in the class.
        requestExpectation = expectation(description: "courseContentRetrieved")
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // This method is used to test API response
    func testCourseListResponse() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            APIClient.createNetworkRequest(apiURL: kAPI_GET_COURSES, completion: { (dictionary) in
                
                if let taskArray = dictionary?.value(forKey: RequestMappingKeys.courses) as? NSArray {
                    for task in (taskArray.firstObject as? NSArray)! {
                        let contentDict = CourseModel(dictionary: (task as? NSDictionary)!)
                        self.courseArray.append(contentDict)
                        if self.courseArray.count > 0 {
                            XCTAssert(true)
                        } else {
                            XCTAssert(false)
                        }
                    }
                    self.requestExpectation?.fulfill()
                }
            })
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
