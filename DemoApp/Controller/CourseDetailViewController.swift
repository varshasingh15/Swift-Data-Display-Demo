//
//  CourseDetailViewController.swift
//  DemoApp
//
//  Created by Varsha Singh on 7/12/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit
/**
 UIViewController used for displaying detailed information of course and instructors.
 */
class CourseDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let store = DataStore.sharedInstance //store : Datasource shared instance
    
    @IBOutlet var courseImage: UIImageView! //courseImage IBOutlet : used for adding it through storyboard
    @IBOutlet var courseName: UILabel! //courseName IBOutlet : used for adding it through storyboard
    @IBOutlet var syllabusButton: UIButton! //syllabusButton IBOutlet : used for adding it through storyboard
    @IBOutlet var learningButton: UIButton! //learningButton IBOutlet : used for adding it through storyboard
    @IBOutlet var instructorInfo: UILabel! //instructorInfo IBOutlet : used for adding it through storyboard

    @IBOutlet private weak var instructorTableView: UITableView!  //instructorTableView IBOutlet : used for adding it through storyboard
    
    private let tableViewCellIdentifier = "instructorTableViewCell" // TableViewCell identifier
    private let popUpIdentifier = "showPopUp" //popUpViewController identifier
    
    var courseModel:CourseModel?
    
    // MARK: View Controller Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        setUpDetailInfo()
        
        guard (self.courseModel?.instructors.count)! > 0 else {
            instructorInfo.isHidden = true
            return
        }
        registerTableViewCell()
    }
    
    /**
     register tableview cell
     */
    private func registerTableViewCell() {
        instructorTableView.isHidden = false
        instructorTableView.separatorStyle = .none
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        instructorTableView.register(nib, forCellReuseIdentifier: tableViewCellIdentifier)
    }
    
    /**
     Method used to setup initial info for detail page
     Does:
     1. fetch image, name, info from listing page
     2. display all available data on UI
     3. setup button with underline
     */
    func setUpDetailInfo()  {
        if let image = courseModel?.image, let name = courseModel?.title {
            courseName.text = name
            Utils.fetchImage(imageString: image, completion: { (image, error) in
                DispatchQueue.main.async {
                    self.courseImage.image = image
                }
            })
        }
        
        syllabusButton.underline()
        learningButton.underline()
    }
    
    @IBAction func syllabusButtonTapped() {
        showPopupView(info: courseModel?.syllabus)
    }
    
    @IBAction func learningButtonTapped() {
            showPopupView(info: courseModel?.expectedLearning)
    }
    
    fileprivate func showPopupView(info: String? = "", isLabelPresent: Bool? = false) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: popUpIdentifier) as! PopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        popOverVC.textView.text = info
        popOverVC.displayPopupData()
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    
    // MARK: UITableView Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.courseModel?.instructors.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier) as? TableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        let item = self.courseModel?.instructors[indexPath.row]
        cell.displayContent(image: item?.image, title: item?.name, bioInfo: item?.bio)
        return cell
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 44.0 // standard tableViewCell height
        tableView.rowHeight = UITableViewAutomaticDimension
        return UITableViewAutomaticDimension
    }
 
}

