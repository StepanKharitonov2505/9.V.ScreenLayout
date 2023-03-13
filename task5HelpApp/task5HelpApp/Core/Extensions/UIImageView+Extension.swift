//
//  UIImageView+Extension.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 26.02.2023.
//

import UIKit

extension UIImageView {
   func applyGradientPattern(_ pattern: UIImage) {
       let size = frame.size
       let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
       let patternSize = CGSize(width: frame.width,
                                       height: frame.height*Constants.relationHeightShadowOfHeightImage)
       let patternRect: CGRect = CGRect(origin: CGPoint(x: 0,
                                                        y: frame.maxY*(1-Constants.relationHeightShadowOfHeightImage)),
                                               size: patternSize)
       UIGraphicsBeginImageContext(size)
       self.image!.draw(in: rect)
       pattern.draw(in: patternRect, blendMode: .destinationOut, alpha: 1.0)
       let newImage = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()
       self.image = newImage
   }
}
