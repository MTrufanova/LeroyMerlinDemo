//
//  CatalogCell.swift
//  LeroyMerlinDemo
//
//  Created by msc on 27.04.2021.
//

import UIKit

class CatalogCell: UICollectionViewCell {
    
    static let reuseId = "CatalogCell"
    let viewBackColor = UIColor.lightGray.withAlphaComponent(0.2)
    
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
         setupLayout()
        layer.cornerRadius = 5
        backgroundColor = viewBackColor
        catalogLabel.textColor = .black
    }
    
    func setupCell(_ model: ProductModel)  {
        catalogLabel.text = model.productName
        imageMenu.image = model.productImage
    }
    private func setupLayout() {
        contentView.addSubview(catalogLabel)
        contentView.addSubview(imageMenu)
        
        catalogLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        imageMenu.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.width.equalTo(70)
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
