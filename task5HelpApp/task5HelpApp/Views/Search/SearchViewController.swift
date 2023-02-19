//
//  SearchViewController.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 12.02.2023.
//

import UIKit

final class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.backgroundColorNavigationBar
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.compactAppearance = appearance

        let labelTitle: UILabel = UILabel()
        labelTitle.text = Constants.titleSearchController
        labelTitle.textColor = UIColor.white
        labelTitle.font = UIFont(name: "OfficinaSansExtraBoldSCC", size: 21)!
        labelTitle.heightAnchor.constraint(equalToConstant: Constants.headerHelpCatHeight).isActive = true
        self.navigationItem.titleView = labelTitle

        let exitButtonItem = UIBarButtonItem(
            image: UIImage(named: Constants.helpCatBackImageName),
            style: .plain, target: nil,
            action: #selector(NSXPCConnection.suspend))
        exitButtonItem.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = exitButtonItem
    }
}
