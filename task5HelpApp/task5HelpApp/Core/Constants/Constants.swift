//
//  Constants.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 31.01.2023.
//

import Foundation

public struct Constants {
    // MARK: Tab bar
        /// Middle Button
            static let middleButtonDiameter: CGFloat = 42
            static let middleShadowCircleDiameter: CGFloat = 54
            static let centerOffsetCoefShadowCircle: CGFloat = 12/49
    // MARK: HelpCat Controller
        /// Colections Insets Edge HelpCat
            static let coefInsetAllSide: Double = 9/375
        /// Cell HelpCat
            static let helpCategoriesCellReuseID: String = "reuseIDHelpCategories"
            static let textSizeHelpCatCellLabel: CGFloat = 15
            static let topOffsetImageHelpCatCell: Int = 37
            static let bottonOffsetLabelHelpCatCell: Int = -10
            static let relationHeightOfWidthHelpCell: Double = 160/174
            static let coeffWidthHelpCell: Double = 174/375
            static let heightHelpCell: Int = 25
        /// Header HelpCat
            static let helpCatCellHeaderReuseID: String = "reuseIDHelpCategoriesHeader"
            static let headerHelpCatText: String = "Выберите категорию помощи"
            static let headerHelpCatFontSize: CGFloat = 17
            static let headerHelpCatHeight: CGFloat  = 57
        /// Title HelpCat Controller
            static let titleHelpCatScreen: String = "Помочь"
            static let titleHelpCatHeaigh: Int = 30
        /// Image Name tab bar
            static let imageNameTabBarHelpController: String = "heart"
        /// Back button HelpCat
            static let helpCatBackImageName: String = "backButtonHelpScr"
    // MARK: News Controller
        /// Title News Controller
            static let titleNewsController: String = "Новости"
        /// Image Name tab bar
            static let imageNameTabBarNewsController: String = "icon-news-grey"
            static let imageNameSelectedTabBarNewsController: String = "icon-news-green"
    // MARK: Search Conroller
        /// Title Search Controller
            static let titleSearchController: String = "Поиск"
        /// Image Name tab bar
            static let imageNameTabBarSearchController: String = "icon-search-grey"
            static let imageNameSelectedTabBarSearchController: String = "icon-search-green"
    // MARK: History Controller
        /// Title History Controller
            static let titleHistoryController: String = "История"
        /// Image Name tab bar
            static let imageNameTabBarHistoryController: String = "icon-grey-history"
            static let imageNameSelectedTabBarHistoryController: String = "icon-green-history"
    // MARK: Profile Controller
        /// Title Profile Controller
            static let titleProfileController: String = "Профиль"
        /// Image Name tab bar
            static let imageNameTabBarProfileController: String = "icon-grey-profile"
            static let imageNameSelectedTabBarProfileController: String = "icon-green-profile"
    // MARK: Event Controller
        /// Stumble
            static let stumbleBetweenSections: CGFloat = 10
            static let offsetImageFromBackground: CGFloat = 4
            static let offsetBackgroungFromCell: CGFloat = 8
        /// Filter Button
            static let filterButtonImageName: String = "filter"
        /// Cell
            static let reuseIDEventCell: String = "reuseIDEventCell"
        /// Separator between MainTtiel and Descritption
            static let separatorNameEventCell: String = "separator"
            static let offsetSeparatorFromMainTitle: CGFloat = 8
        /// Description
            static let offsetDescriptionFromSeparator: CGFloat = 8
        /// Image Date on bottomView
            static let dateDurationImageName: String = "dateDuration"
        /// Main Title Label
            static let heightLabelMainTitle: CGFloat = 46
            static let widthLabelMainTitle: CGFloat = 267
            static let offsetBottomMainTitleFromBottomImage: CGFloat = 35
        /// Font size segmented control
            static let fontSizeSegmentedControl: CGFloat = 13
        /// Offset Segmented Control
            static let offsetTopSegmentedControl: CGFloat = 10
            static let offsetBottomSegmentedControl: CGFloat = -9.5
            static let offsetTrailingLeadingSegmentedControl: CGFloat = 16
        /// Relation
            static let relationHeightImageOfHeightCell: CGFloat = 231/413
            static let relationHeightShadowOfHeightImage: CGFloat = 141/231
            static let relationHeightOfWidthEventCell: CGFloat = 413/375
            static let relationHeightCellOfBottomView: CGFloat = 31/413
            static let relationHeightOfWidthSegmentedView: CGFloat = 43/375
}
