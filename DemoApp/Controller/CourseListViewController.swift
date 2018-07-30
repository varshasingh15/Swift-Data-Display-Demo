//
//  CourseListViewController.swift
//  DemoApp
//
//  Created by Varsha Singh on 7/11/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit
/**
 UIViewController used for creating listing page which supports to display courses information using UICollectionView.
 */
class CourseListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet private weak var collectionView: UICollectionView!  //UICollectionView IBOutlet : used for adding it through storyboard
    private let collectionViewCellIdentifier = "collectionViewCell" //collectionViewCell : CollectionViewCell identifier
    private let detailPageIdentifier = "showDetail" //showDetail : DetailViewController identifier
    
    let store = DataStore.sharedInstance //store : Datasource shared instance
    
    private var images_cache = [String:UIImage]()

    // MARK: View Controller Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initialUISetUp()
    }
    
    /**
     Method used to setup initial info for listing page
     Does:
     1. uses UIViewController extension to add and remove activity indicator
     2. trigger API call
     3. register collection view cell
     */
    func initialUISetUp() {
        let view = UIViewController.displaySpinner(onView: self.view)
        store.getCourseList {
            UIViewController.removeSpinner(spinner: view)
            DispatchQueue.main.async {
                self.collectionView.reloadSections(IndexSet(integer: 0))
            }
        }
        registerCollectionViewCell()
    }
    
    /**
     display title on navigation bar
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "DemoApp Demo"
        
    }
    /**
     hide title on navigation bar
     */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationItem.title = " "
    }
    
    func registerCollectionViewCell() {
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: collectionViewCellIdentifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionView Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard store.courseArray.count > 0 else { return 0 }
        return store.courseArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        let courseInfo = store.courseArray[indexPath.row]
        cell.displayContent(title: courseInfo.title, subTitle: courseInfo.subTitle)
        Utils.fetchImage(imageString: courseInfo.image!, completion: { (image, error) in
            cell.setImage(image: image)
        })
        return cell
    }
    
    // MARK: UICollectionView Datasource
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let courseInfo = store.courseArray[indexPath.row]
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: detailPageIdentifier) as? CourseDetailViewController {
            if let navigator = navigationController {
                viewController.courseModel = courseInfo
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
}
