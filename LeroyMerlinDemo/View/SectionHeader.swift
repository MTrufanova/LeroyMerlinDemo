//
//  SectionHeader.swift
//  LeroyMerlinDemo
//
//  Created by msc on 27.04.2021.
//

import UIKit
import SnapKit

class SectionHeader: UICollectionReusableView {
    
    static let reuseId = "SectionHeader"
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(title)
        
        title.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
