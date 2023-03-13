//
//  File.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 04.03.2023.
//

import Foundation

enum Month: String, CustomStringConvertible {
    case january = "01"
    case february = "02"
    case mart = "03"
    case april = "04"
    case may = "05"
    case june = "06"
    case july = "07"
    case august = "08"
    case september = "09"
    case october = "10"
    case november = "11"
    case december = "12"
    var description: String {
        switch self {
        case .january: return "Январь"
        case .february: return "Февраль"
        case .mart: return "Март"
        case .april: return "Апрель"
        case .may: return "Май"
        case .june: return "Июнь"
        case .july: return "Июль"
        case .august: return "Август"
        case .september: return "Сентябрь"
        case .october: return "Октябрь"
        case .november: return "Ноябрь"
        case .december: return "Декабрь"
        }
    }
}

func formattedDate(jsonStartDate: String, jsonFinishDate: String) -> String {
    let dayMonthStartDate = jsonStartDate.components(separatedBy: "-")
    let yearStartDate = dayMonthStartDate[2].components(separatedBy: "T")
    let day = dayMonthStartDate[0]
    let month = dayMonthStartDate[1]
    let convertedMonth = Month(rawValue: month)!
    let year = yearStartDate[0]
    let stroke: String = "\(convertedMonth) \(day), \(year)"
    return stroke
}
