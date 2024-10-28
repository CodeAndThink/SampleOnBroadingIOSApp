//
//  PageViewController.swift
//  OnBroading
//
//  Created by admin on 21/10/24.
//

import Foundation
import UIKit

class PageViewController : UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    private var pageViewController : UIPageViewController!
    private var pages : [UIViewController] = []
    private let initialPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        if let firstPageScreen = storyboard?.instantiateViewController(withIdentifier: "FirstScreen"),
            let secondPageScreen = storyboard?.instantiateViewController(withIdentifier: "SecondScreen"),
            let thirdPageScreen = storyboard?.instantiateViewController(withIdentifier: "ThirdScreen")
        {
            pages = [firstPageScreen, secondPageScreen, thirdPageScreen]
            pageViewController.setViewControllers([firstPageScreen], direction: .forward, animated: true, completion: nil)
            
        }
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.view.frame = view.bounds
        pageViewController.didMove(toParent: self)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentPage = pages.firstIndex(of: viewController) else {return nil}
        if currentPage == 0 {
            return pages.last
        } else {
            return pages[currentPage - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentPage = pages.firstIndex(of: viewController) else {return nil}
        if currentPage == pages.count - 1 {
            return pages.first
        } else {
            return pages[currentPage + 1]
        }
    }
}
