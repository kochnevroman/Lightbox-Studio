//
//  FullSizeColorViewController.swift
//  SideMenuTutorial
//
//  Created by Roman Kochnev on 16/09/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

class FullSizeColorViewController: UIViewController {
    
    @IBOutlet weak var imageViewFullDemonstrated: UIImageView!
    
    
    @IBAction func closeFullSizeVCButton(_ sender: UIButton) {
        let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
        lightImpactFeedbackGenerator.prepare()
        lightImpactFeedbackGenerator.impactOccurred()
        dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var colorValue: UIColor?
    var imageValue: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewFullDemonstrated.backgroundColor = colorValue
        if let image = imageValue {
            imageViewFullDemonstrated.image = image
        }
        
    }
    

    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
}
