//
//  TextureCollectionViewCell.swift
//  Lightbox Studio
//
//  Created by Roman Kochnev on 22/11/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

class TextureCollectionViewCell: UICollectionViewCell {
    static let reuseID = String(describing: TextureCollectionViewCell.self)
    static let nib = UINib(nibName: String(describing: TextureCollectionViewCell.self), bundle: nil)
    
    @IBOutlet  weak var stackView: UIStackView!
    @IBOutlet  weak var ibImageView: UIImageView!
    @IBOutlet  weak var ibLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 4
        ibLabel.font = UIFont.systemFont(ofSize: 18)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateContentStyle()
    }
    
    func update(title: String, image: UIImage) {
        ibImageView.image = image
        ibLabel.text = title
    }
    
    private func updateContentStyle() {
        let isHorizontalStyle = bounds.width > 2 * bounds.height
        let oldAxis = stackView.axis
        let newAxis: NSLayoutConstraint.Axis = isHorizontalStyle ? .horizontal : .vertical
        guard oldAxis != newAxis else { return }

        stackView.axis = newAxis
        stackView.spacing = isHorizontalStyle ? 16 : 4
        ibLabel.textAlignment = isHorizontalStyle ? .left : .center
        let fontTransform: CGAffineTransform = isHorizontalStyle ? .identity : CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.3) {
            self.ibLabel.transform = fontTransform
            self.layoutIfNeeded()
        }
    }
}
