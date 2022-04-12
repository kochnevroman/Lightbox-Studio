//
//  TexturesProvider.swift
//  Lightbox Studio
//
//  Created by Roman Kochnev on 22/11/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import Foundation

struct FruitsProvider {
    static func get() -> [Texture] {
        return [
            Texture(name: "Honeycomb", icon: #imageLiteral(resourceName: "11")),
            Texture(name: "Sphere", icon: #imageLiteral(resourceName: "12")),
            Texture(name: "Dalmatian", icon: #imageLiteral(resourceName: "13")),
            Texture(name: "Metal", icon: #imageLiteral(resourceName: "14")),
            Texture(name: "Collapsar", icon: #imageLiteral(resourceName: "15")),
            Texture(name: "Ring", icon: #imageLiteral(resourceName: "16")),
            Texture(name: "Pattern", icon: #imageLiteral(resourceName: "17")),
            Texture(name: "Glass", icon: #imageLiteral(resourceName: "18")),
            Texture(name: "Blowball", icon: #imageLiteral(resourceName: "19")),
            Texture(name: "Diamonds", icon: #imageLiteral(resourceName: "20")),
            Texture(name: "Soccer ball", icon: #imageLiteral(resourceName: "21")),
            Texture(name: "Milky Way", icon: #imageLiteral(resourceName: "22"))
        ]
    }
}
