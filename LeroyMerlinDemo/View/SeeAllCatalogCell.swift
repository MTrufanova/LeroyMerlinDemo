//
//  SeeAllCatalogCell.swift
//  LeroyMerlinDemo
//
//  Created by msc on 29.04.2021.
//

import UIKit

class SeeAllCatalogCell: UICollectionViewCell {
    
    static let reuseId = "SeeAllCatalogCell"
    let viewBackColor = UIColor.lightGray.withAlphaComponent(0.2)
    
    lazy var catalogLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    lazy var imageMenu: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var moreStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageMenu, catalogLabel])
        stack.axis = .vertical
        stack.spacing = 8
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5
        backgroundColor = viewBackColor
        setupLayout()
    }
    
    func setupCell(_ model: ProductModel)  {
        catalogLabel.text = model.productName
        imageMenu.image = model.productImage
    }
    
    private func setupLayout() {
                    contentView.addSubview(moreStack)
                    moreStack.snp.makeConstraints { (make) in
                        make.leading.trailing.equalToSuperview()
                        //make.centerX.equalToSuperview()
                        make.centerY.equalToSuperview()
                    }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
