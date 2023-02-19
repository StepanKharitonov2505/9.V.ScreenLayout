//
//  HelpCategoriesCollectionCell.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 31.01.2023.
//

import UIKit
import SnapKit

final class HelpCategoriesCollectionCell: UICollectionViewCell {

    // MARK: Subviews
    let imageView = UIImageView()
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }

    // MARK: UI
    private func configureUI() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = true
        self.backgroundColor = UIColor.backgroundColorHelpCategoriesCell
        self.addLabel()
        self.addImageView()
        self.setupConstraints()
    }

    private func addImageView() {
        self.contentView.addSubview(self.imageView)
    }

    private func addLabel() {
        self.label.font = UIFont(name: "OfficinaSansExtraBoldSCC", size: Constants.textSizeHelpCatCellLabel)
        self.label.textColor = UIColor.helpCategoriesCellTextColor
        self.label.textAlignment = .center
        self.contentView.addSubview(self.label)
    }

    private func setupConstraints() {
        self.imageView.snp.makeConstraints { make in
            make.centerX.equalTo(self.contentView.snp.centerXWithinMargins)
            make.top.equalTo(self.contentView.snp.top).offset(Constants.topOffsetImageHelpCatCell)
        }
        self.label.snp.makeConstraints { make in
            make.centerX.equalTo(self.contentView.snp.centerXWithinMargins)
            make.bottom.equalTo(Constants.bottonOffsetLabelHelpCatCell)
            make.height.equalTo(Constants.heightHelpCell)
        }
    }
}
