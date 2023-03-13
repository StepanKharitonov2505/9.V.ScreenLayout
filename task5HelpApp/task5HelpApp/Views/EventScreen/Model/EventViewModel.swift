//
//  EventViewModel.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 19.02.2023.
//

import Foundation

final class EventViewModel {
    var selectCathegoryID: Int

    lazy var data: [Event] = {
        return ModelData().events.filter {
            Int($0.id) == selectCathegoryID
        }
    }()

    init(selectCathegoryID: Int) {
        self.selectCathegoryID = selectCathegoryID
    }
}
