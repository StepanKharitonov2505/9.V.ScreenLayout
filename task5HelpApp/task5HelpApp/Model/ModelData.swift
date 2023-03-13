//
//  ModelData.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 19.02.2023.
//

import Foundation

final class ModelData {
    var events: [Event] = load("eventsData.json")
    var cathegories: [Cathegory] = load("cathegoriesData.json")
}

func load<Element: Decodable>(_ filename: String) -> Element {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(Element.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(Element.self):\n\(error)")
    }
}
