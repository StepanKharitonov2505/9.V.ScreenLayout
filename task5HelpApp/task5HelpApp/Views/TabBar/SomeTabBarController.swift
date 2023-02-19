//
//  SomeTabBarController.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 15.02.2023.
//

import UIKit

class SomeTabBarController: UITabBarController {

    private lazy var middleButton: UIButton = {
        let middleButton = UIButton()
        let diameter = Constants.middleButtonDiameter
        middleButton.layer.cornerRadius = diameter / 2
        middleButton.backgroundColor = UIColor.selectedItemTabBarColor
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        middleButton.addTarget(self, action: #selector(didPressMiddleButton), for: .touchUpInside)
        return middleButton
    }()

    private lazy var heartImageView: UIImageView = {
        let heartImageView = UIImageView()
        let imageName = Constants.imageNameTabBarHelpController
        heartImageView.image = UIImage(named: imageName)
        heartImageView.tintColor = .white
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        return heartImageView
    }()

    let customTabBar: UITabBar = CustomTabBar()

    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(customTabBar, forKey: "tabBar")
        setupTabBar()
    }
    // MARK: Create Tab Bar
    private func setupTabBar() {

        let dataSource: [TabBarItem] = [
            .news,
            .search,
            .help,
            .history,
            .profile]

        self.viewControllers = dataSource.map {
            switch $0 {
            case .news:
                let rootVC = NewsViewController()
                return self.wrappedInNavigationController(rootVC: rootVC, title: $0.title)
            case .search:
                let rootVC = SearchViewController()
                return self.wrappedInNavigationController(rootVC: rootVC, title: $0.title)
            case .help:
                let configurator = HelpScreenConfigurator()
                let rootVC = configurator.configure()
                return self.wrappedInNavigationController(rootVC: rootVC, title: $0.title)
            case .history:
                let rootVC = HistoryViewController()
                return self.wrappedInNavigationController(rootVC: rootVC, title: $0.title)
            case .profile:
                let rootVC = ProfileViewController()
                return self.wrappedInNavigationController(rootVC: rootVC, title: $0.title)
            }
        }

        self.viewControllers?.enumerated().forEach {
            $1.tabBarItem.title = dataSource[$0].title
            $1.tabBarItem.image = UIImage(named: dataSource[$0].image)
            $1.tabBarItem.selectedImage = UIImage(named: dataSource[$0].selectedImage)
        }

        let width = tabBar.bounds.width

        let substrateLayer = createSubstrate()

        self.tabBar.layer.insertSublayer(substrateLayer, at: 0)
        self.tabBar.itemWidth = width / 5
        self.tabBar.itemPositioning = .centered
        self.tabBar.tintColor = UIColor.selectedItemTabBarColor
        self.tabBar.unselectedItemTintColor = UIColor.unselectedItemTabBarColor
        self.selectedIndex = 2

        self.createMiddleButton()
    }

    private func wrappedInNavigationController(rootVC: UIViewController, title: Any?) -> UINavigationController {
            return UINavigationController(rootViewController: rootVC)
        }

    // MARK: Create SubLayers
    private func createSubstrate() -> CAShapeLayer {

        let width = tabBar.bounds.width
        let height = tabBar.bounds.height

        let customLayer = CAShapeLayer()
        let circleLayer = CAShapeLayer()

        let bezierPathSubstrate = UIBezierPath(
            rect: CGRect(
                x: tabBar.bounds.origin.x,
                y: tabBar.bounds.minY,
                width: width,
                height: height*2))

        customLayer.path = bezierPathSubstrate.cgPath
        customLayer.fillColor = UIColor.white.cgColor
        customLayer.shadowColor = UIColor.black.cgColor
        customLayer.shadowRadius = CGFloat(1)
        customLayer.shadowOffset = CGSize.zero
        customLayer.shadowOpacity = Float(0.2)

        let offsetY = Constants.centerOffsetCoefShadowCircle * self.tabBar.bounds.height

        let bezierPathCircleShadow = UIBezierPath(
            arcCenter: CGPoint(
                x: self.tabBar.bounds.midX,
                y: self.tabBar.bounds.minY+offsetY),
            radius: Constants.middleShadowCircleDiameter / 2,
            startAngle: 180 * .pi / 180,
            endAngle: 0 * 180 / .pi,
            clockwise: true)

        circleLayer.path = bezierPathCircleShadow.cgPath
        circleLayer.fillColor = UIColor.white.cgColor
        circleLayer.shadowColor = UIColor.black.cgColor
        circleLayer.shadowRadius = CGFloat(0.01)
        circleLayer.shadowOffset = CGSize(width: 0, height: -1)
        circleLayer.shadowOpacity = Float(0.1)

        customLayer.addSublayer(circleLayer)

        return customLayer
    }

    // MARK: Create Middle Button
    private func createMiddleButton() {
        self.tabBar.addSubview(middleButton)
        middleButton.addSubview(heartImageView)

        let diameter = Constants.middleButtonDiameter

            NSLayoutConstraint.activate([
                middleButton.heightAnchor.constraint(equalToConstant: diameter),
                middleButton.widthAnchor.constraint(equalToConstant: diameter),
                middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
                middleButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -10)
            ])

            NSLayoutConstraint.activate([
                heartImageView.heightAnchor.constraint(equalToConstant: 15),
                heartImageView.widthAnchor.constraint(equalToConstant: 18),
                heartImageView.centerXAnchor.constraint(equalTo: middleButton.centerXAnchor),
                heartImageView.centerYAnchor.constraint(equalTo: middleButton.centerYAnchor)
            ])
    }

    @objc private func didPressMiddleButton() {
        selectedIndex = 2
        middleButton.backgroundColor = UIColor.selectedItemTabBarColor
    }
}

extension SomeTabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let selectedIndex = self.tabBar.items?.firstIndex(of: item)
        if selectedIndex != 2 {
            middleButton.backgroundColor = UIColor.redColorMiddleButton
        } else {
            middleButton.backgroundColor = UIColor.selectedItemTabBarColor
        }
    }
}
