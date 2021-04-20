//
//  ProductCell.swift
//  LeroyMerlinDemo
//
//  Created by msc on 19.04.2021.
//

import UIKit
import SnapKit

class ProductCell: UICollectionViewCell {
    
    //MARK:- UI
    lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var leftPriceLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    lazy var rightPriceLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()
    
    lazy var productNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()
    
    lazy var priceStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftPriceLabel, rightPriceLabel])
        stack.spacing = 0
        stack.axis = .horizontal
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ model: ProductModel) {
        productImage.image = model.productImage
        leftPriceLabel.text = model.leftPrice
        rightPriceLabel.text = model.rightPrice
        productNameLabel.text = model.productName
    }
    
    private func setupLayout() {
        addSubview(productImage)
        addSubview(priceStack)
        addSubview(productNameLabel)
        
        productImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalTo(priceStack.snp.top).offset(16)
        }
        priceStack.snp.makeConstraints { (make) in
            make.top.equalTo(productImage.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(8)
        }
        productNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(priceStack.snp.bottom).offset(16)
            make.bottom.equalToSuperview().offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        
    }
    
}
