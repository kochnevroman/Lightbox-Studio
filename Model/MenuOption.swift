//
//  MenuOption.swift
//  SideMenuTutorial
//
//  Created by Stephen Dowless on 12/12/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    
    case Logo
    case Space
    case Home
    case Textures
    case Guide
    case About
    
    var description: String {
        switch self {
        case .Logo: return "Lightbox Studio"
        case .Space: return ""
        case .Home: return "Home"
        case .Textures: return "Textures"
        case .Guide: return "Guide"
        case .About: return "About"
            
        }
    }
    
    var image: UIImage {
        switch self {
        case .Logo: return UIImage(named: "sunRound_icon") ?? UIImage()
        case .Space: return UIImage(named: "") ?? UIImage()
        case .Home: return UIImage(named: "sunRound_icon") ?? UIImage()
        case .Textures: return UIImage(named: "texture_icon_white") ?? UIImage()
        case .Guide: return UIImage(named: "guide_icon") ?? UIImage()
        case .About: return UIImage(named: "about_icon") ?? UIImage()
            
        }
    }
}
