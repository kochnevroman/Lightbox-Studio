//
//  ContainerController.swift
//  SideMenuTutorial
//
//  Created by Stephen Dowless on 12/12/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    // MARK: - Properties
    
    var controller: UIViewController!
    var menuController: MenuController!
    //var centerController: UIViewController!
    var isExpanded = false
    var identifier = "ContainerVC"
//    ContainerController.instantiateViewControllerWithIdentifier = "ContainerVC"
    
    
//    var timer = Timer()
//    let timeInterval = 3.1
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
//        if #available(iOS 13.0, *) {
//            controller.isModalInPresentation = true
//            self.isModalInPresentation = true
//        }
//        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(assafsaf), userInfo: nil, repeats: false)

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .lightContent
        }
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    // MARK: - Handlers
    
    func configureHomeController() {
        
            let homeController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeController
            
//        let homeController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LaunchVC") as! LaunchAnimationViewController
        homeController.delegate = self
        homeController.modalPresentationStyle = .overFullScreen
//
//        let homeController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: <#T##String#>)
        controller = homeController
        view.addSubview(controller.view)
        addChild(controller)
    }
    
    
//   @objc func assafsaf() {
//    let homeController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC") as! HomeController
//        homeController.delegate = self
//
//        controller = homeController
//        view.addSubview(controller.view)
//        addChild(controller)
//    }
//
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
//            menuController.isModalInPresentation = true
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.controller.view.frame.origin.x = self.controller.view.frame.width - 80
            }, completion: nil)
            
        } else {
            // hide menu
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.controller.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .Logo:
            print("logo")
        case .Space:
            print("space")
        case .Home:
            print("home")
        case .Textures:
            print("textures")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "TexturesVC") as UIViewController
            let viewcontroller = storyboard.instantiateViewController(withIdentifier: "TexturesVC")
            let navigationController = UINavigationController(rootViewController: viewcontroller)
            navigationController.modalPresentationStyle = .overFullScreen
            self.present(navigationController, animated: true, completion: nil)
        case .Guide:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "pageViewController") as UIViewController
            present(controller, animated: true, completion: nil)
            print("guide")
        case .About:
            print("about")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "AboutVC") as UIViewController
            present(controller, animated: true, completion: nil)
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
//            if #available(iOS 13.0, *) {
                configureMenuController()
//            }
        }
        
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
}
