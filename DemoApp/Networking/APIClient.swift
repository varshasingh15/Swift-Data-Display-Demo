//
//  APIClient.swift
//  DemoApp
//
//  Created by Varsha Singh on 7/11/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
import UIKit
/**
 Network layer - to create network request and parse JSON data
 */

struct APIClient {
    /**
     Trigger API
     Does:
     1. hit API for the given URL's (apiURL)
     2. call parse data method
     */
    static func createNetworkRequest(apiURL: String?, completion: @escaping (AnyObject?) -> Void) {
        let Url = String(format: apiURL!)
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = HTTPMethods.get.rawValue
     //   request.setValue(CONTENT_TYPE_VALUE, forHTTPHeaderField: CONTENT_TYPE_KEY)
        fetchAndParseData(request, completion)
    }
    
    
    /**
     Parse JSON response
     Does:
     1. session to maintain task
     2. maintain data, response and error
     3. JSONSerialization to get JSON object
     4. check object is an array or dict - based on that return object
     */
    fileprivate static func fetchAndParseData(_ request: URLRequest, _ completion: @escaping (AnyObject?) -> Void) {
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let responseJSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    var jsonResult: [Any] = []
                    
                    if let dictionary = responseJSON as? Dictionary<String, Any> {
                        jsonResult.append(dictionary)
                    } else if let array = responseJSON as? [Any] {
                        jsonResult = array
                    }
                    completion(jsonResult as AnyObject)
                } catch {
                    print("Could not get API response. \(error), \(error.localizedDescription)")
                    completion(error as AnyObject)
                }
            }
        }.resume()
    }
    
    /**
     Download Image
     Parameter:
     - imageUrl: image URL to
     - completion block: to handle image and error
     Does:
     1. create caching object
     2. check error, data and convert to image format
     3. set image to cache object
     4. return completion block
     */

    static func downloadImage(imageUrl: String, completion: @escaping (_ image: UIImage?, _ error: Error? ) -> Void) {
        let imageCache = NSCache<NSString, UIImage>()

        if let cachedImage = imageCache.object(forKey: imageUrl as NSString) {
            completion(cachedImage, nil)
        } else {
            
            URLSession.shared.dataTask(with: NSURL(string: imageUrl)! as URL, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    completion(nil, error)
                    return
                }
                else if let data = data, let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: imageUrl as NSString)
                    completion(image, nil)
                } else {
                    completion(nil, nil)
                }                
            }).resume()
        }
    }
}
