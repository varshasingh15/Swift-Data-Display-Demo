//
//  APIConstant.swift
//  DemoApp
//
//  Created by Varsha Singh on 7/11/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation

/**
 Constant file - used to hold all constant strings and URL's
 */

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

let CONTENT_TYPE_VALUE = "Application/json"
let CONTENT_TYPE_KEY = "Content-Type"
let CONTENT_TYPE_FORM_URL_ENCODED = "application/x-www-form-urlencoded"

let kAPI_GET_COURSES = "https://www.udacity.com/public-api/v0/courses" //Courses list

public struct CourseResponseMappingKeys {
    public static let title = "title"
    public static let subtitle = "subtitle"
    public static let image = "image"
    public static let instructors = "instructors"
    public static let expected_learning = "expected_learning"
    public static let syllabus = "syllabus"
}

public struct InstructorResponseMappingKeys {
    public static let bio = "bio"
    public static let image = "image"
    public static let name = "name"
}

public struct RequestMappingKeys {
    public static let courses = "courses"
}
