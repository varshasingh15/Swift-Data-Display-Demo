//
//  PopUpViewController.swift
//  DemoApp
//
//  Created by Varsha Singh on 7/13/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit
/**
 UIViewController used for displaying Popup to display syllabus and expected learning.
 */
class PopUpViewController: UIViewController {
    
    @IBOutlet var textView: UITextView! //textView IBOutlet : used for adding it through storyboard
    @IBOutlet var noResultFoundLabel: UILabel! //noResultFoundLabel IBOutlet : used for adding it through storyboard
    
    // MARK: View Controller Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
    }
    
    // MARK: Method to display text view and no result found
    
    func displayPopupData() {
        if !(textView.text.isEmpty) {
            textView.isHidden = false
            noResultFoundLabel.isHidden = true
        } else {
            textView.isHidden = true
            noResultFoundLabel.isHidden = false
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBAction for close popup method
    
    @IBAction func closePopUp(_ sender: AnyObject) {
        self.removeAnimate()
    }
    
    // MARK: Show animation method
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    // MARK: Remove animation method
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
}
