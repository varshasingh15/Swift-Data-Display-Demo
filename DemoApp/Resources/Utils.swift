//
//  Utils.swift
//  DemoApp
//
//  Created by Varsha Singh on 7/17/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
import UIKit

public class Utils {
    
    public static func fetchImage(imageString: String, completion: @escaping (_ image: UIImage?, _ error: Error? ) -> Void)  {
        APIClient.downloadImage(imageUrl: imageString, completion: { (image, error) in
            completion(image, nil)
        })
    }
}
