//
//  CustomTabBar.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 18.02.2023.
//

import UIKit

class CustomTabBar: UITabBar {

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let pointIsInside = super.point(inside: point, with: event)
        if pointIsInside == false {
            for subview in subviews {
                let pointInSubview = subview.convert(point, from: self)
                if subview.point(inside: pointInSubview, with: event) {
                    return true
                }
            }
        }
        return pointIsInside
    }
}
