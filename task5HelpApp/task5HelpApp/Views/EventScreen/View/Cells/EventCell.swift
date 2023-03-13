//
//  EventCell.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 24.02.2023.
//

import UIKit
import SnapKit

class EventCell: UITableViewCell {

    // MARK: Subviews
    private var customBackgroundView = UIView()
    private var imageViewBackground = UIImageView()
    private var mainTitle = UILabel()
    private var separatorView = UIImageView()
    private var customDescription = UILabel()
    private var customBottomView = UIView()
    private var hContainerView = UIView()
    private var dateImage = UIImageView()
    private var date = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func config(imageName: String,
                mainTitle: String,
                description: String,
                dateStart: String,
                dateFinish: String) {
            self.imageViewBackground.image = UIImage(named: imageName)
            self.mainTitle.attributedText = loadText(myString: mainTitle, lineHeight: 23)
            self.customDescription.attributedText = loadText(myString: description, lineHeight: 20)
            self.date.text = formattedDate(jsonStartDate: dateStart, jsonFinishDate: dateFinish)
        }

    private func configureUI() {
        self.contentView.backgroundColor = UIColor.eventViewLightGreyColor
        self.contentView.addSubview(self.customBackgroundView)
        self.customBackgroundView.addSubview(self.imageViewBackground)
        self.customBackgroundView.addSubview(self.mainTitle)
        self.customBackgroundView.addSubview(self.separatorView)
        self.customBackgroundView.addSubview(self.customDescription)
        self.customBackgroundView.addSubview(self.customBottomView)
        self.customBottomView.addSubview(self.hContainerView)
        self.hContainerView.addSubview(self.dateImage)
        self.hContainerView.addSubview(self.date)
        fullConfigureSubview()
    }

    // MARK: Configure subviews
    private func fullConfigureSubview() {
        self.setupConstraint()
        self.configureCustomBackgroundView()
        self.configureImageViewBackground()
        self.configureMainTtitle()
        self.configureSeparator()
        self.configureCustomDescription()
        self.configureCustomBottomView()
        self.configureDateImage()
        self.configureDate()
        self.configureHContainer()
    }

    private func configureCustomBackgroundView() {
        self.customBackgroundView.layer.cornerRadius = 10
        self.customBackgroundView.layer.shadowColor = UIColor.gray.cgColor
        self.customBackgroundView.layer.shadowRadius = CGFloat(1)
        self.customBackgroundView.layer.shadowOffset = CGSize.zero
        self.customBackgroundView.layer.shadowOpacity = Float(0.5)
        self.customBackgroundView.backgroundColor = UIColor.white
    }

    private func configureImageViewBackground() {
        self.imageViewBackground.contentMode = .scaleAspectFill
        self.imageViewBackground.clipsToBounds = true
        self.imageViewBackground.layer.cornerRadius = 7
    }

    private func configureMainTtitle() {
        self.mainTitle.font = UIFont(name: "OfficinaSansExtraBoldSCC", size: 21)!
        self.mainTitle.textColor = UIColor.eventViewBlueGrayColor
        self.mainTitle.numberOfLines = 2
    }

    private func configureSeparator() {
        self.separatorView.contentMode = .scaleAspectFit
        self.separatorView.image = UIImage(named: Constants.separatorNameEventCell)
    }

    private func configureCustomDescription() {
        self.customDescription.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        self.customDescription.textColor = UIColor.eventViewDarkSlateBlue
        self.customDescription.numberOfLines = 3
    }

    private func configureCustomBottomView() {
        self.customBottomView.backgroundColor = UIColor.backgroundColorNavigationBar
        let rectCorner: UIRectCorner = [.bottomLeft, .bottomRight]
        self.customBottomView.layer.maskedCorners = CACornerMask(rawValue: rectCorner.rawValue)
        self.customBottomView.layer.cornerRadius = 10
    }

    private func configureDateImage() {
        self.dateImage.contentMode = .scaleAspectFit
        self.dateImage.image = UIImage(named: Constants.dateDurationImageName)
        self.dateImage.tintColor = UIColor.white
    }

    private func configureDate() {
        self.date.textColor = UIColor.white
        self.date.font = UIFont.systemFont(ofSize: 11, weight: .medium)
    }

    private func configureHContainer() {
        self.hContainerView.backgroundColor = .clear
    }

    // MARK: Constraints
    private func setupConstraint() {
        self.customBackgroundView.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView.snp.leading).offset(Constants.offsetBackgroungFromCell)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-Constants.offsetBackgroungFromCell)
            make.top.equalTo(self.contentView.snp.top)
            make.bottom.equalTo(self.contentView.snp.bottom)
        }
        self.imageViewBackground.snp.makeConstraints { make in
            make.top.equalTo(self.customBackgroundView.snp.top).offset(Constants.offsetImageFromBackground)
            make.leading.equalTo(self.customBackgroundView.snp.leading).offset(Constants.offsetImageFromBackground)
            make.trailing.equalTo(self.customBackgroundView.snp.trailing).offset(-Constants.offsetImageFromBackground)
            make.height.equalTo(self.contentView.snp.height).multipliedBy(Constants.relationHeightImageOfHeightCell)
        }
        self.mainTitle.snp.makeConstraints { make in
            make.height.equalTo(Constants.heightLabelMainTitle)
            make.width.equalTo(Constants.widthLabelMainTitle)
            make.centerX.equalTo(self.imageViewBackground.snp.centerX)
            make.bottom.equalTo(self.imageViewBackground.snp.bottom).offset(
                Constants.offsetBottomMainTitleFromBottomImage)
        }
        self.separatorView.snp.makeConstraints { make in
            make.top.equalTo(self.mainTitle.snp.bottom).offset(Constants.offsetSeparatorFromMainTitle)
            make.centerX.equalTo(self.customBackgroundView.snp.centerX)
            make.height.equalTo(20)
            make.width.equalTo(113)
        }
        self.customDescription.snp.makeConstraints { make in
            make.top.equalTo(self.separatorView.snp.bottom).offset(Constants.offsetDescriptionFromSeparator)
            make.centerX.equalTo(self.customBackgroundView.snp.centerX)
            make.height.equalTo(60)
            make.width.equalTo(313)
        }
        self.customBottomView.snp.makeConstraints { make in
            make.bottom.equalTo(self.customBackgroundView.snp.bottom)
            make.trailing.equalTo(self.customBackgroundView.snp.trailing)
            make.leading.equalTo(self.customBackgroundView.snp.leading)
            make.height.equalTo(self.contentView.snp.height).multipliedBy(Constants.relationHeightCellOfBottomView)
        }
        self.dateImage.snp.makeConstraints { make in
            make.centerY.equalTo(self.hContainerView.snp.centerY)
            make.trailing.equalTo(self.date.snp.leading).offset(-10)
            make.leading.equalTo(self.hContainerView.snp.leading)
            make.height.equalTo(12.7)
            make.width.equalTo(14)
        }
        self.date.snp.makeConstraints { make in
            make.centerY.equalTo(self.hContainerView.snp.centerY)
            make.trailing.equalTo(self.hContainerView.snp.trailing)
        }
        self.hContainerView.snp.makeConstraints { make in
            make.centerX.equalTo(self.customBottomView.snp.centerX)
            make.centerY.equalTo(self.customBottomView.snp.centerY)

        }
    }

    // MARK: Additional functions
    private func loadText(myString: String, lineHeight: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: myString)
        let style = NSMutableParagraphStyle()
        style.minimumLineHeight = lineHeight
        style.alignment = .center
        attributedString.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: style,
            range: NSMakeRange(0, attributedString.length))
        return attributedString
    }

    func applyGradientPattern() {
            let gradientPatternImage = UIImage(named: "ShadowPattern")
            self.imageViewBackground.applyGradientPattern(gradientPatternImage!)
        }
}
