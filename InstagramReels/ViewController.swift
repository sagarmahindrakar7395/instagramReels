//
//  ViewController.swift
//  InstagramReels
//
//  Created by Sagar Mahindrakar on 03/05/21.
//

import UIKit

class ViewController: UIViewController, CategoryViewModelDelegate {
    
    let categoryViewModel = CategoryViewModel()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        categoryViewModel.categoryViewModelDelegate = self
        categoryViewModel.getCategoriesData()
    }
    
    func dataLoadSuccess() {
         let nodes = categoryViewModel.categories[0].nodes
            let videosPageViewController = VideosPageViewController.initialize(with: nodes, index:0)
            videosPageViewController.modalPresentationStyle = .fullScreen
            videosPageViewController.modalTransitionStyle = .coverVertical
        DispatchQueue.main.async { [weak self] in
            self?.present(videosPageViewController, animated: true, completion: nil)
        }
           // self.present(videosPageViewController, animated: true, completion: nil)
        
    }
    
    func dataLoadError(error: DataError) {
        DispatchQueue.main.async {
            let alertController = UIAlertController.init(title: "Error Occurred", message: error.localizedDescription, preferredStyle: .alert)
            
            let okAction = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
