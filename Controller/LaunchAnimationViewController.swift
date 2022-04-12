//
//  LaunchAnimationViewController.swift
//  SideMenuTutorial
//
//  Created by Roman Kochnev on 18/09/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

class LaunchAnimationViewController: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var upperStarImage: UIImageView!
    @IBOutlet weak var bottomStarImage: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    
    var delegate: HomeControllerDelegate?
    var timer = Timer()
    let timeInterval = 3.1
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(nextView), userInfo: nil, repeats: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logoRotation()
    }
    
    func logoRotation(){
        let rotationAnimationforLogo = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimationforLogo.fromValue = 0.0
        rotationAnimationforLogo.toValue = Double.pi
        rotationAnimationforLogo.duration = 3
        
        let rotationAnimationforStars = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimationforStars.fromValue = 0.0
        rotationAnimationforStars.toValue = Double.pi
        rotationAnimationforStars.duration = 3
        
        self.logoImage.layer.add(rotationAnimationforLogo, forKey: nil)
        self.upperStarImage.layer.add(rotationAnimationforStars, forKey: nil)
        self.bottomStarImage.layer.add(rotationAnimationforStars, forKey: nil)
        
        self.appNameLabel.alpha = 0
        self.versionLabel.alpha = 0
        UIView.animate(withDuration: 3, animations: {
            self.appNameLabel.alpha = 4.0
            self.versionLabel.alpha = 4.0
        })
    }
    
    @objc func nextView() {
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = ContainerController()
//        viewController.controller = UIStoryboard(name: "Main", bundle: nil).
//        viewController.isModalInPresentation = true
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "ContainerVC") as! ContainerController
        let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeController
//        let yourVC = mainStoryboard.instantiateInitialViewController() as! ContainerController
//        appDelegate.window?.rootViewController = yourVC
//        yourVC.configureHomeController()
         yourVC.delegate?.handleMenuToggle(forMenuOption: nil)
        
//        dismiss(animated: true, completion: nil)
//        present(yourVC, animated: true, completion: nil)
        
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(true, forKey: "keyforLaunch")
//        userDefaults.synchronize()
            
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
