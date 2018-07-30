//
//  CourseModel.swift
//  DemoApp
//
//  Created by Varsha Singh on 7/11/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
/**
 Model class - maintain course model objects
 */
struct CourseModel  {
    var title: String?
    var subTitle: String?
    var image: String?
    var expectedLearning: String?
    var syllabus: String?
    var instructors = [InstructorModel]()

    init(dictionary: NSDictionary) {
        guard
            let title = dictionary[CourseResponseMappingKeys.title] as? String,
            let subTitle = dictionary[CourseResponseMappingKeys.subtitle] as? String,
            let image = dictionary[CourseResponseMappingKeys.image] as? String,
            let expectedLearning = dictionary[CourseResponseMappingKeys.expected_learning] as? String,
            let syllabus = dictionary[CourseResponseMappingKeys.syllabus] as? String
        else {
            return
        }
        
        self.title = title
        self.subTitle = subTitle
        self.image = image
        self.expectedLearning = expectedLearning
        self.syllabus = syllabus
      
        var instructorArray: Array<Any>?
        instructorArray = dictionary.value(forKeyPath: CourseResponseMappingKeys.instructors) as? Array
        for instructor in instructorArray! {
            let data = InstructorModel(dictionary: (instructor as? NSDictionary)!)
            self.instructors.append(data)
        }
    }
}
