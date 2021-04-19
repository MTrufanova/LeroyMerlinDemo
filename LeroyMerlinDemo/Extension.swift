//
//  Extension.swift
//  LeroyMerlinDemo
//
//  Created by msc on 19.04.2021.
//

import Foundation
import UIKit

func createViewMenu(nameLabel: String, textColor: UIColor, backgroundColor: UIColor, image: UIImage, wh: Int) -> UIView {
    
    let label = UILabel()
    label.font = .systemFont(ofSize: 14, weight: .medium)
    label.text = nameLabel
    label.numberOfLines = 0
    label.textColor = textColor
    
    let imageMenu = UIImageView(image: image)
    imageMenu.contentMode = .scaleAspectFit
    
    let viewMenu = UIView()
    viewMenu.backgroundColor = backgroundColor
    viewMenu.layer.cornerRadius = 5
    viewMenu.addSubview(label)
    viewMenu.addSubview(imageMenu)
    label.snp.makeConstraints { (make) in
        make.top.equalTo(viewMenu.snp.top).offset(10)
        make.leading.trailing.equalToSuperview().inset(10)
    }
    imageMenu.snp.makeConstraints { (make) in
        if wh > 60 {
        make.bottom.equalTo(viewMenu.snp.bottom)
        make.trailing.equalTo(viewMenu.snp.trailing)
        } else {
            make.bottom.equalTo(viewMenu.snp.bottom).offset(-8)
            make.trailing.equalTo(viewMenu.snp.trailing).offset(-8)
        }
        make.height.width.equalTo(wh)
    }
    viewMenu.snp.makeConstraints { (make) in
        make.width.equalTo(120)
        make.height.equalTo(120)
    }
    return viewMenu
}
