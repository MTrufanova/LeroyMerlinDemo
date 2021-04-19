//
//  ProductCell.swift
//  LeroyMerlinDemo
//
//  Created by msc on 19.04.2021.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    //MARK:- UI
    lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var leftPriceLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    lazy var rightPriceLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    lazy var productNameLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
