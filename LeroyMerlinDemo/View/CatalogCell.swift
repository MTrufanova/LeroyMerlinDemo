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
    
    lazy var moreStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageMenu, catalogLabel])
        stack.axis = .vertical
        stack.spacing = 8
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
         layer.cornerRadius = 5
    }
    
    func setupCell(_ model: ProductModel)  {
        catalogLabel.text = model.productName
        imageMenu.image = model.productImage
        
        if catalogLabel.text == "Каталог"{
            backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            catalogLabel.textColor = .white
        } else {
             backgroundColor = viewBackColor
            catalogLabel.textColor = .black
        }
         
        if catalogLabel.text == "Смотреть всё" {
            contentView.addSubview(moreStack)
            imageMenu.snp.makeConstraints { (make) in
                make.height.width.equalTo(30)
            }
            moreStack.snp.makeConstraints { (make) in
                make.leading.trailing.equalToSuperview().inset(4)
                make.centerY.equalToSuperview()
            }
        } else if catalogLabel.text == "Каталог" {
                contentView.addSubview(catalogLabel)
                contentView.addSubview(imageMenu)
                catalogLabel.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(10)
                    make.leading.trailing.equalToSuperview().inset(10)
                }
                imageMenu.snp.makeConstraints { (make) in
                    make.bottom.equalToSuperview().offset(-8)
                    make.trailing.equalToSuperview().offset(-8)
                    make.height.width.equalTo(50)
                   
                }
            }
         else {
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
        
    }
    private func setupLayout() {
    
        
      
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
