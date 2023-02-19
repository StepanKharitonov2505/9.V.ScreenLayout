//
//  UIColor.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 28.01.2023.
//
import UIKit

public extension UIColor {
    // MARK: Screen Color
        static let backgroundColorSplashScr = UIColor.rgb(239.0, 243.0, 246.0)
        static let backgroundColorHelpCategoriesScr = UIColor.rgb(255, 255, 255)
    // MARK: Color HelpCat Collection Cell
        static let backgroundColorHelpCategoriesCell = UIColor.rgb(234, 237, 232)
        static let helpCategoriesCellTextColor = UIColor.rgb(158, 191, 80)
        static let headerTextHelpCatCollectionColor = UIColor.rgb(73, 74, 74)
    // MARK: NavBar Color
        static let backgroundColorNavigationBar = UIColor.rgb(117, 164, 71)
    // MARK: TabBar Color
        static let selectedItemTabBarColor = UIColor.rgb(102, 166, 54)
        static let unselectedItemTabBarColor = UIColor.rgb(146, 146, 146)
        static let redColorMiddleButton = UIColor.rgb(254, 116, 96)
}

public extension UIColor {
    static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor.rgba(r, g, b, 1.0)
    }
    static func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
}
