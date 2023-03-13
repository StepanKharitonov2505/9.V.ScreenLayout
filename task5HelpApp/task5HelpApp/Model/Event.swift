//
//  Event.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 19.02.2023.
//

import Foundation

struct Event: Codable {
    let id: String
    let futureEvents: [FutureEvents]
    let pastEvents: [PastEvents]
}

struct FutureEvents: Codable {
    let name: String
    let description: String
    let imageName: String
    let startDate: String
    let finishDate: String
}

struct PastEvents: Codable {
    let name: String
    let description: String
    let imageName: String
    let startDate: String
    let finishDate: String
}
