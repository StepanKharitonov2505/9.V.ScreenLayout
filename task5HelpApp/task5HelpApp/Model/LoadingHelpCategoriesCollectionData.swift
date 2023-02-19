//
//  HelpCategoriesCollectionModel.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 01.02.2023.
//
import UIKit

struct CellHelpCatCollectionStructure {
    let title: String
    let image: UIImage
}

final class LoadingHelpCategoriesCollectionData {
    private(set) var collectionsCell: [CellHelpCatCollectionStructure] = []

    init() {
        loadCollection()
    }

    private func loadCollection() {
        let firstElement = CellHelpCatCollectionStructure(title: "Дети", image: UIImage(named: "Children")!)
        let secondElement = CellHelpCatCollectionStructure(title: "Взрослые", image: UIImage(named: "Adults")!)
        let thirdelement = CellHelpCatCollectionStructure(title: "Пожилые", image: UIImage(named: "Eldery")!)
        let fourthElement = CellHelpCatCollectionStructure(title: "Животные", image: UIImage(named: "Animals")!)
        let fifthElement = CellHelpCatCollectionStructure(title: "Мероприятия", image: UIImage(named: "Activities")!)

        collectionsCell.append(firstElement)
        collectionsCell.append(secondElement)
        collectionsCell.append(thirdelement)
        collectionsCell.append(fourthElement)
        collectionsCell.append(fifthElement)
    }
}
