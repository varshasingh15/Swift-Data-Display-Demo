//
//  TableViewCell.swift
//  DemoApp
//
//  Created by Varsha Singh on 7/12/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit
/*
 TableViewCell used to create information of instructor
 */
class TableViewCell: UITableViewCell {
    
    @IBOutlet var instructorTitle: UILabel! //instructorTitle IBOutlet : used for adding it through storyboard
    @IBOutlet var instructorBio: UILabel! //instructorBio IBOutlet : used for adding it through storyboard
    @IBOutlet var instructorImage: UIImageView! //instructorImage IBOutlet : used for adding it through storyboard
    
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
         - image: available instructor image
         - title: available instructor name
         - title: available instructor bio
     */
    func displayContent(image: String?, title: String?, bioInfo: String?) {
        
        if let image = image, let title = title, let bio = bioInfo {
            instructorTitle.text = title
            instructorBio.text = bio

            if !(image.isEmpty) {
                //self.instructorImage.imageFromServerURL(urlString: image)
            }
        }
    }
}
