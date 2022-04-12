//
//  AboutViewController.swift
//  LightPad Pro
//
//  Created by Roman Kochnev on 25/07/2019.
//  Copyright © 2019 Roman Kochnev. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!
    
    // MARK: - Properties
    @IBOutlet weak var closeAboutVCButton: UIButton!
    @IBAction func closeAboutVCButton(_ sender: UIButton) {
        let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
        lightImpactFeedbackGenerator.prepare()
        lightImpactFeedbackGenerator.impactOccurred()
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeButtonAnimation()
//        logoRotation()
    }
    
    func logoRotation(){
        let rotationAnimationforLogo = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimationforLogo.fromValue = 0.0
        rotationAnimationforLogo.toValue = Double.pi
        rotationAnimationforLogo.duration = 3
        
        self.logoImage.layer.add(rotationAnimationforLogo, forKey: nil)
    }
    
    func closeButtonAnimation() {
        UIView.animate(withDuration: 1.6,
                       animations: {
                        self.logoImage.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                        self.logoImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        },
                       completion: { _ in
                        UIView.animate(withDuration: 4) {
                            self.logoImage.transform = CGAffineTransform.identity
                        }
        })
    }
}
