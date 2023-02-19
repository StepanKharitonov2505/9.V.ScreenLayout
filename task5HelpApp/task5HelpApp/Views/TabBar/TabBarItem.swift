//
//  TabBarItem.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 16.02.2023.
//

import Foundation

enum TabBarItem: Int {
    case news
    case search
    case help
    case history
    case profile

    var title: String {
        switch self {
        case .news:
            return Constants.titleNewsController
        case .search:
            return Constants.titleSearchController
        case .help:
            return Constants.titleHelpCatScreen
        case .history:
            return Constants.titleHistoryController
        case .profile:
            return Constants.titleProfileController
        }
    }
    var image: String {
        switch self {
        case .news:
            return Constants.imageNameTabBarNewsController
        case .search:
            return Constants.imageNameTabBarSearchController
        case .help:
            return Constants.imageNameTabBarHelpController
        case .history:
            return Constants.imageNameTabBarHistoryController
        case .profile:
            return Constants.imageNameTabBarProfileController
        }
    }
    var selectedImage: String {
        switch self {
        case .news:
            return Constants.imageNameSelectedTabBarNewsController
        case .search:
            return Constants.imageNameSelectedTabBarSearchController
        case .help:
            return Constants.imageNameTabBarHelpController
        case .history:
            return Constants.imageNameSelectedTabBarHistoryController
        case .profile:
            return Constants.imageNameSelectedTabBarProfileController
        }
    }
}
