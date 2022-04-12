//
//  MenuController.swift
//  SideMenuTutorial
//
//  Created by Stephen Dowless on 12/12/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

import UIKit

private let reuseIdentifer = "MenuOptionCell"

class MenuController: UIViewController {
    
    // MARK: - Properties
    var tableView: UITableView!
    var delegate: HomeControllerDelegate?
    
    // MARK: - Init
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: - Handlers
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifer)
        tableView.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.7450980392, blue: 0.7882352941, alpha: 1)
        tableView.separatorStyle = .none
        tableView.rowHeight = 50

        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! MenuOptionCell
        
        if indexPath.row == 0 {
            cell.descriptionLabel.font = UIFont.init(name: "AppleSDGothicNeo-Medium", size: 16)
            cell.descriptionLabel.textAlignment = .left
            cell.iconImageView.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 15).isActive = true
        }
    
            let menuOption = MenuOption(rawValue: indexPath.row)
            cell.descriptionLabel.text = menuOption?.description
            cell.iconImageView.image = menuOption?.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
    
}
