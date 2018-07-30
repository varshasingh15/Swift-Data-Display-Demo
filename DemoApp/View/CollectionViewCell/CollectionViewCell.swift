//
//  CollectionViewCell.swift
//  DemoApp
//
//  Created by Varsha Singh on 7/11/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit
/*
 CollectionViewCell used to create information of course
 */
class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var courseTitle: UILabel! //courseTitle IBOutlet : used for adding it through storyboard
    @IBOutlet var courseSubtitle: UILabel! //courseSubtitle IBOutlet : used for adding it through storyboard
    @IBOutlet var courseImage: UIImageView! //courseSubtitle IBOutlet : used for adding it through storyboard
    // Create a cacher and use the temporary directory
    let cacher: Cacher = Cacher(destination: .temporary)
    /**
     Initialization method for CollectionViewCell
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    /**
     Used to display information
     - parameters:
         - title: available course name
         - title: available course subtitle
     */
    func displayContent(title: String?, subTitle: String?) {
        
        if let title = title, let subTitle = subTitle {
            courseTitle.text = title
            courseSubtitle.text = subTitle
        }
    }
    
    /**
     Used to display information
     - parameters:
         - image: available course image
     */
    
    func setImage(image: UIImage?) {
        DispatchQueue.main.async {
          self.courseImage.image = image
        }
    }
}


