//
//  DataStore.swift
//  DemoApp
//
//  Created by Varsha Singh on 7/11/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
import UIKit

/**
 this class is the interface between Networking layer and controller layer
 */
class DataStore {
    
    static let sharedInstance = DataStore() // DataStore : shared instance with that there can be only 1 instance of DataStore Model
    fileprivate init() {}
    
    var courseArray: [CourseModel] = [] // to store all course data
    var images: [UIImage] = [] // imageArray : download all images and use array all over the app
    let imageCache = NSCache<NSString, UIImage>()


    // MARK: Fetch Course List
    
    /**
     Does:
     1. hit API to get all courses
     2. get data into JSON format
     3. add actual data to array
     4. completion handler to maintain block for data fetching
     */
    
    func getCourseList(completion: @escaping () -> Void) {
        self.courseArray.removeAll()
        APIClient.createNetworkRequest(apiURL: kAPI_GET_COURSES, completion: { (dictionary) in
            if let taskArray = dictionary?.value(forKey: RequestMappingKeys.courses) as? NSArray {
                for task in (taskArray.firstObject as? NSArray)! {
                    let contentDict = CourseModel(dictionary: (task as? NSDictionary)!)
                    self.courseArray.append(contentDict)
                }
            }
            completion()
        })
    }
}
