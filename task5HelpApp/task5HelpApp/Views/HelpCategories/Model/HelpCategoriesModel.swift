//
//  HelpCategoriesModel.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 25.01.2023.
//

import UIKit

final class HelpCategoriesModel {

    lazy var data: [Cathegory] = {
        return ModelData().cathegories
    }()
}
