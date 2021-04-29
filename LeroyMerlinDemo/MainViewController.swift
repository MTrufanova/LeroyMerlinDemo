//
//  ViewController.swift
//  LeroyMerlinDemo
//
//  Created by msc on 17.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    let product = Product()
    let section = Section.sections
    
    lazy var searchController = UISearchController(searchResultsController: nil)
    
    lazy var barcodeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.layer.cornerRadius = 5
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let largeBoldCode = UIImage(systemName: "barcode", withConfiguration: largeConfig)
        button.setImage(largeBoldCode, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        
        //layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseId)
        collectionView.register(CatalogCell.self, forCellWithReuseIdentifier: CatalogCell.reuseId)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseId)

        return collectionView
    }()
    
    var dataSource: UICollectionViewDiffableDataSource< Section, ProductModel>?
    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Поиск товаров"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: barcodeButton)
        setupSearchBar()
        createCollectionView()
        createDataSource()
        reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        customStatusBar()
    }
    
    func createCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, ProductModel>(collectionView: collectionView, cellProvider: { [self] (collectionView, indexPath, item) -> UICollectionViewCell? in
            switch self.section[indexPath.section].type {
            case Keys.recentlyViewed.rawValue:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseId, for: indexPath) as? ProductCell
                cell?.setupCell(product.recentlyViewed[indexPath.item])
                return cell
            case Keys.limitedOffer.rawValue:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseId, for: indexPath) as? ProductCell
                cell?.setupCell(product.limitedOffer[indexPath.item])
                return cell
                
            case Keys.bestPrice.rawValue:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseId, for: indexPath) as? ProductCell
                cell?.setupCell(product.bestPrice[indexPath.item])
                return cell
            
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCell.reuseId, for: indexPath) as? CatalogCell
                cell?.setupCell(product.catalogItems[indexPath.item])
                return cell
            }
            
        })
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseId, for: indexPath) as? SectionHeader else {return nil}
            guard  let firstSection = self.dataSource?.itemIdentifier(for: indexPath) else { return nil }
            guard let section = self.dataSource?.snapshot().sectionIdentifier(containingItem: firstSection) else { return nil }
            sectionHeader.title.text = section.title
            return sectionHeader
        }
    }
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ProductModel>()
        snapshot.appendSections(section)
        
        for sect in section {
            snapshot.appendItems(sect.items, toSection: sect)
        }
        dataSource?.apply(snapshot)
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, enviroment) -> NSCollectionLayoutSection? in
            
            if sectionNumber == 0 {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 12, bottom: 0, trailing: 0)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.35), heightDimension: .estimated(120))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets.init(top: 30, leading: 4, bottom: 50, trailing: 12)
            section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
           
            let header = self.createSectionHeader()
            section.boundarySupplementaryItems = [header]
            return section
            } else {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 5, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.35), heightDimension: .estimated(80))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets.init(top: 30, leading: 16, bottom: 170, trailing: 12)
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
               
                let header = self.createSectionHeader()
                section.boundarySupplementaryItems = [header]
                return section
            }
        }
    }
    
    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: size, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layoutSectionHeader
    }
    
   
    
    private func customStatusBar() {
        let statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame
        if let statusFrame = statusBarFrame {
        let statusBarView = UIView(frame: statusFrame)
        let statusBarColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
        }
    }
    
    private func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.showsCancelButton = false
        definesPresentationContext = true
       // searchController.searchBar.searchTextField.leftView = nil
        navigationItem.searchController = searchController
    }
    
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
       
    }
}
