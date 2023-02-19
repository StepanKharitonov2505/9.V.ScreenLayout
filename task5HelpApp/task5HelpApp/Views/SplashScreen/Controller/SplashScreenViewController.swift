//
//  SplashScreenViewController.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 26.01.2023.
//

import UIKit

final class SplashScreenViewController: UIViewController {

    // MARK: Private Properties
    private let splashScreenView = SplashScreenView()

    // MARK: LifeCycle
    override func loadView() {
        self.view = splashScreenView
    }

    override func viewDidAppear(_ animated: Bool) {
        nextVC()
    }

    // MARK: Private Func
    private func nextVC() {
        sleep(1)
        let nextVCTabBar = SomeTabBarController()
        nextVCTabBar.modalPresentationStyle = .fullScreen
        nextVCTabBar.modalTransitionStyle = .flipHorizontal
        self.present(nextVCTabBar, animated: true)
    }

}
