//
//  Collection.swift
//  LeroyMerlinDemo
//
//  Created by msc on 20.04.2021.
//

import Foundation
import UIKit

func createLabel(labelText: String) -> UILabel {
    let label = UILabel()
    label.text = labelText
    label.font = .boldSystemFont(ofSize: 20)
    label.textColor = .black
    return label
}

func createCollection() -> UICollectionView {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .clear
    collectionView.showsHorizontalScrollIndicator = false
    return collectionView

}
