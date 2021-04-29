//
//  SectionModel.swift
//  LeroyMerlinDemo
//
//  Created by msc on 25.04.2021.
//

import Foundation
import UIKit

let item = Product()
struct Section: Hashable {
  
    let type: String
    let title: String
    let items: [ProductModel]
    
    static let sections: [Section] = [
        Section(type: Keys.catalogMenu.rawValue, title: "", items: item.catalogItems ),
     Section(type: Keys.recentlyViewed.rawValue, title: "Недавно просмотренные", items: item.recentlyViewed),
    Section(type: Keys.limitedOffer.rawValue, title: "Предложение ограничено", items: item.limitedOffer),
   Section(type: Keys.bestPrice.rawValue, title: "Лучшая цена", items: item.bestPrice)
    ]
}




