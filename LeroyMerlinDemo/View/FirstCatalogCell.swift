//
//  FirstCatalogCell.swift
//  LeroyMerlinDemo
//
//  Created by msc on 29.04.2021.
//

import UIKit

class FirstCatalogCell: UICollectionViewCell {
    
    static let reuseId = "FirstCatalogCell"
    lazy var catalogLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var imageMenu: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        layer.cornerRadius = 5
        catalogLabel.textColor = .white
        setupLayout()
    }
    
    func setupCell(_ model: ProductModel)  {
        catalogLabel.text = model.productName
        imageMenu.image = model.productImage
    }
    
    func setupLayout() {
        contentView.addSubview(catalogLabel)
        contentView.addSubview(imageMenu)
        catalogLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        imageMenu.snp.makeConstraints { (make) in
            make.trailing.bottom.equalToSuperview().inset(8)
            make.height.width.equalTo(50)
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
