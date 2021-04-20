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
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    lazy var rightPriceLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 13)
        label.textAlignment = .left
        return label
    }()
    
    lazy var productNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 2
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
        setupLayout()
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
            make.leading.trailing.equalToSuperview().inset(16)
            //make.bottom.equalTo(priceStack.snp.top).offset(16)
            make.height.equalTo(productImage.snp.width)
        }
        priceStack.snp.makeConstraints { (make) in
            make.top.equalTo(productImage.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
        }
        productNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(priceStack.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        
    }
    
}
