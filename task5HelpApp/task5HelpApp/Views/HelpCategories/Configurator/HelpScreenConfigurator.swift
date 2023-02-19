//
//  HelpScreenConfigure.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 12.02.2023.
//

import UIKit

final class HelpScreenConfigurator {
    func configure() -> HelpCategoriesViewController {
        let returnedController = HelpCategoriesViewController(viewModel: HelpCategoriesModel())
        return returnedController
    }
}
