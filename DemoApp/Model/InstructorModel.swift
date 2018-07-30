//
//  InstructorModel.swift
//  DemoApp
//
//  Created by Varsha Singh on 7/12/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
/**
 Model class - maintain instructor model objects
 */
struct InstructorModel  {
    var bio: String?
    var name: String?
    var image: String?
    
    init(dictionary: NSDictionary) {
        guard
            let title = dictionary[InstructorResponseMappingKeys.bio] as? String,
            let subTitle = dictionary[InstructorResponseMappingKeys.name] as? String,
            let image = dictionary[InstructorResponseMappingKeys.image] as? String
        else {
            return
        }
        
        self.bio = title
        self.name = subTitle
        self.image = image
    }
}
