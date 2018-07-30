//
//  UIViewController+Extension.swift
//  DemoApp
//
//  Created by Varsha Singh on 7/11/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit
/*
 An extension of UIViewController to support show/hide of activity indicator
 */
extension UIViewController {
    
    // MARK: Display/Remove Activity Indicator
    
    /**
     Add activity indicator
     - parameter:
         - onView: The UIView on which activity indicator will be added
     - return:
         returns UIView
     */
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    /**
     Remove activity indicator
     - parameters:
         - spinner: The UIView which is removed from Superview
     */
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }   
}
