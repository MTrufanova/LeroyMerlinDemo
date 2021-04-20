//
//  SearchViewController.swift
//  LeroyMerlinDemo
//
//  Created by msc on 19.04.2021.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    let viewBackColor = UIColor.lightGray.withAlphaComponent(0.2)
    let product = Product()
    
    //MARK:- UI NavigationBar
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
    
    //MARK:- UI CatalogView
    let image = UIImage(systemName: "list.dash")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    lazy var catalogView = createViewMenu(nameLabel: "Каталог", textColor: .white, backgroundColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), image: image ?? UIImage(), wh: 50)
    lazy var gardenView = createViewMenu(nameLabel: "Сад", textColor: .black, backgroundColor: viewBackColor, image: UIImage(named: "garden") ?? UIImage(), wh: 70)
    lazy var lightView = createViewMenu(nameLabel: "Освещение", textColor: .black, backgroundColor: viewBackColor, image: UIImage(named: "light") ?? UIImage(), wh: 70)
    lazy var toolView = createViewMenu(nameLabel: "Инструменты", textColor: .black, backgroundColor: viewBackColor, image: UIImage(named: "tool") ?? UIImage(), wh: 70)
    lazy var buildingView = createViewMenu(nameLabel: "Строймате- риалы", textColor: .black, backgroundColor: viewBackColor, image: UIImage(named: "building") ?? UIImage(), wh: 70)
    lazy var decorView = createViewMenu(nameLabel: "Декор", textColor: .black, backgroundColor: viewBackColor, image: UIImage(named: "decor") ?? UIImage(), wh: 70)
    
   lazy var allView: UIView = {
       let view = UIView()
       view.backgroundColor = viewBackColor
       view.layer.cornerRadius = 5
       return view
   }()
   
   lazy var moreImage: UIImageView = {
      let imageView = UIImageView(image: UIImage(named: "more"))
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        imageView.contentMode = .scaleAspectFit
       return imageView
   }()
     
   lazy var moreLabel: UILabel = {
       let label = UILabel()
       label.font = .systemFont(ofSize: 14, weight: .medium)
       label.text = "Смотреть всё"
       label.textColor = .black
       return label
   }()
   
   lazy var moreStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [moreImage, moreLabel])
       stack.axis = .vertical
       stack.spacing = 8
       return stack
   }()
   
   lazy var catalogStack: UIStackView = {
      let stack = UIStackView(arrangedSubviews: [catalogView, gardenView, lightView, toolView, buildingView, decorView, allView])
       stack.axis = .horizontal
       stack.spacing = 10
       return stack
   }()
    
    lazy var menuScrollView = UIScrollView()
    
    //MARK: - UI Recently viewed
    lazy var viewedLabel: UILabel = {
        let label = UILabel()
        label.text = "Недавно просмотренные"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    lazy var viewedCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: Keys.recentlyViewed.rawValue)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    //MARK: - UI Limited offer
    lazy var limitedLabel: UILabel = {
        let label = UILabel()
        label.text = "Предложение ограничено"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    //MARK: - UI Best price
    lazy var bestPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Лучшая цена"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Поиск товаров"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: barcodeButton)
        setupSearchBar()
        setupLayout()
        setupScroll()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        customStatusBar()
    }
    
    func setupLayout() {
        view.addSubview(menuScrollView)
        menuScrollView.addSubview(catalogStack)
        allView.addSubview(moreStack)
        menuScrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(220)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        catalogStack.snp.makeConstraints { (make) in
            make.top.equalTo(menuScrollView.snp.top)
            make.leading.trailing.equalTo(menuScrollView.contentSize)
            make.bottom.equalTo(menuScrollView.safeAreaLayoutGuide)
        }
        
        allView.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        
        moreStack.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        view.addSubview(viewedLabel)
        viewedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(menuScrollView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(10)
        }
        
       /* view.addSubview(viewedCollectionView)
        viewedCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(viewedLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
          
        }*/
       
    }
    
    private func setupScroll() {
        menuScrollView.contentSize = CGSize(width: catalogStack.frame.size.width, height: catalogStack.frame.size.height)
        menuScrollView.showsHorizontalScrollIndicator = false
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

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
       
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.recentlyViewed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Keys.recentlyViewed.rawValue, for: indexPath) as! ProductCell
        cell.setupCell(product.recentlyViewed[indexPath.item])
        return cell
    }
    
    
}
