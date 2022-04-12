//
//  ContentViewController.swift
//  Lightbox Studio
//
//  Created by Roman Kochnev on 04/11/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//
//
import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subheaderLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageButton: UIButton!
    
    var header = ""
    var subheader = ""
    var imageFile = ""
    var index = 0
    
    @IBAction func pageButtonPressed(_ sender: UIButton) {
      switch index {
      case 0:
          let pageVC = parent as! PageViewController
          pageVC.nextVC(atIndex: index)
      case 1:
          let pageVC = parent as! PageViewController
          pageVC.nextVC(atIndex: index)
      case 2:
      let pageVC = parent as! PageViewController
      pageVC.nextVC(atIndex: index)
      case 3:
          let userDefaults = UserDefaults.standard
          userDefaults.set(true, forKey: "wasIntroWatched")
          userDefaults.synchronize()
              
          dismiss(animated: true, completion: nil)
      default:
          break
      }
    }
      
    override func viewDidLoad() {
      super.viewDidLoad()
       if let appDomain = Bundle.main.bundleIdentifier {
      UserDefaults.standard.removePersistentDomain(forName: appDomain)
       }
      
      pageButton.layer.cornerRadius = 15
      pageButton.clipsToBounds = true
      pageButton.layer.borderWidth = 2
      pageButton.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.7450980392, blue: 0.7882352941, alpha: 1)
      pageButton.layer.borderColor = (#colorLiteral(red: 0.6705882353, green: 0.7450980392, blue: 0.7882352941, alpha: 1)).cgColor
      
      switch index {
      case 0: pageButton.setTitle("Cool!", for: .normal)
      case 1: pageButton.setTitle("Got it!", for: .normal)
      case 2: pageButton.setTitle("Super!", for: .normal)
      case 3: pageButton.setTitle("Start!", for: .normal)
      default:
          break
      }
      
      headerLabel.text = header
      subheaderLabel.text = subheader
      imageView.image = UIImage(named: imageFile)
      pageControl.numberOfPages = 2
      pageControl.currentPage = index
    }
    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }

}
