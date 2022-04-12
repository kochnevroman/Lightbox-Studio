//
//  TexturesViewController.swift
//  Lightbox Studio
//
//  Created by Roman Kochnev on 22/11/2019.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

class TexturesViewController: UICollectionViewController {
    var currentTextureHere: UIImage!
    
    private enum PresentationStyle: String, CaseIterable {
        case table
        case defaultGrid
        case customGrid
        
        var buttonImage: UIImage {
            switch self {
            case .table: return #imageLiteral(resourceName: "table")
            case .defaultGrid: return #imageLiteral(resourceName: "default_grid")
            case .customGrid: return #imageLiteral(resourceName: "custom_grid")
            }
        }
        
        var closeButton: UIImage {
            return #imageLiteral(resourceName: "cancel")
        }
    }
    
    private var selectedStyle: PresentationStyle = .defaultGrid {
        didSet { updatePresentationStyle() }
    }
    private var styleDelegates: [PresentationStyle: CollectionViewSelectableItemDelegate] = {
        let result: [PresentationStyle: CollectionViewSelectableItemDelegate] = [
            .table: TabledContentCollectionViewDelegate(),
            .defaultGrid: DefaultGriddedContentCollectionViewDelegate(),
            .customGrid: CustomGriddedContentCollectionViewDelegate(),
        ]
        result.values.forEach {
            
            $0.didSelectItem = { _ in
                print("Item selected")
                
//                currentTexture = $0
            }
        }
        return result
    }()
    
    private var datasource: [Texture] = FruitsProvider.get()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(TextureCollectionViewCell.nib,
                                      forCellWithReuseIdentifier: TextureCollectionViewCell.reuseID)
        collectionView.contentInset = .zero
        updatePresentationStyle()
        
        setNavigationBar()
    }
    
    func setNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: selectedStyle.buttonImage, style: .plain, target: self, action: #selector(changeContentLayout))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: selectedStyle.closeButton, style: .done, target: self, action: #selector(closeTexturesVCButton))
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.431372549, green: 0.5254901961, blue: 0.568627451, alpha: 1)
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.431372549, green: 0.5254901961, blue: 0.568627451, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Rubik-Regular", size: 18)!]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.431372549, green: 0.5254901961, blue: 0.568627451, alpha: 1)]
        self.navigationController?.navigationBar.barStyle = UIBarStyle.default
    }
    
    private func updatePresentationStyle() {
        collectionView.delegate = styleDelegates[selectedStyle]
        collectionView.performBatchUpdates({
            collectionView.reloadData()
        }, completion: nil)

        navigationItem.rightBarButtonItem?.image = selectedStyle.buttonImage
    }
    
    @objc private func changeContentLayout() {
        let allCases = PresentationStyle.allCases
        guard let index = allCases.firstIndex(of: selectedStyle) else { return }
        let nextIndex = (index + 1) % allCases.count
        selectedStyle = allCases[nextIndex]
        
    }
    
    @objc private  func closeTexturesVCButton() {
        let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
        lightImpactFeedbackGenerator.prepare()
        lightImpactFeedbackGenerator.impactOccurred()
        dismiss(animated: true, completion: nil)
    }
}

// MARK: UICollectionViewDataSource & UICollectionViewDelegate
extension TexturesViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextureCollectionViewCell.reuseID,
                                                            for: indexPath) as? TextureCollectionViewCell else {
            fatalError("Wrong cell")
        }
        let fruit = datasource[indexPath.item]
        cell.update(title: fruit.name, image: fruit.icon)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
