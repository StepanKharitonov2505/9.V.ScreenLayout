//
//  HeaderCollectionReusableView.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 12.02.2023.
//

import UIKit

final class HeaderCollectionReusableView: UICollectionReusableView {

    private let label: UILabel = {
        let label = UILabel()
        label.text = Constants.headerHelpCatText
        label.textColor = UIColor.headerTextHelpCatCollectionColor
        label.font = UIFont.systemFont(
            ofSize: Constants.headerHelpCatFontSize,
            weight: .regular)
        label.textAlignment = .center
        return label
    }()

    public func configure() {
        self.backgroundColor = UIColor.clear
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(label)
        self.label.frame = self.bounds
    }
}
