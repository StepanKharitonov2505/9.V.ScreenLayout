//
//  SplashScreenView.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 26.01.2023.
//

import UIKit

final class SplashScreenView: UIView {
    @IBOutlet var view: SplashScreenView!
    @IBOutlet weak var labelLoad: UILabel!

    private let nameNib: String = "SplashScreenView"
    private let labelLoadingText: String = "Загрузка..."

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func commonInit() {
        let bundle = Bundle(for: SplashScreenView.self)
        let someView = bundle.loadNibNamed(nameNib, owner: self)
        guard let contentView = someView?.first as? SplashScreenView else {
            return
        }
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.labelLoad.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        contentView.labelLoad.adjustsFontSizeToFitWidth = true
        contentView.labelLoad.text = labelLoadingText
        contentView.backgroundColor = UIColor.backgroundColorSplashScr
    }

}
