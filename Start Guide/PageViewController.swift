//
//  PageViewController.swift
//  Lightbox Studio
//
//  Created by Roman Kochnev on 04/11/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
      
      var headersArray = ["Set color", "Full screen dimension", "Textures", "Photo upload"]
      var subheadersArray = ["Use buttons or move the slider to choose one of the hundreds of colors from Kelvin temperature", "Create your own softbox for amazing photos", "Use pack with 12 amazing textures", "Download your personal photos as the background"]
      var imagesArray = ["setColor", "fullScreen", "textures", "photoCamera"]
      
      override func viewDidLoad() {
        super.viewDidLoad()
//        dataSource = self
        
        if let firstVC = displayViewController(atIndex: 0) {
          setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
      }
      
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
      }
      
      func displayViewController(atIndex index: Int) -> ContentViewController? {
        guard index >= 0 else { return nil }
        guard index < headersArray.count else { return nil }
        guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "contentViewController") as? ContentViewController else { return nil }
        
        contentVC.imageFile = imagesArray[index]
        contentVC.header = headersArray[index]
        contentVC.subheader = subheadersArray[index]
        contentVC.index = index
        
        return contentVC
      }
        
    func nextVC(atIndex index: Int) {
        if let contentVC = displayViewController(atIndex: index + 1) {
                setViewControllers([contentVC], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension PageViewController: UIPageViewControllerDataSource {
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    var index = (viewController as! ContentViewController).index
    index -= 1
    return displayViewController(atIndex: index)
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    var index = (viewController as! ContentViewController).index
    index += 1
    return displayViewController(atIndex: index)
    
  }
    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return headersArray.count
//    }
//
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        let contentVC = storyboard?.instantiateViewController(withIdentifier: "contentViewController") as? ContentViewController
//        return contentVC!.index
//    }
}
