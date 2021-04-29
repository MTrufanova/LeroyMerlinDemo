//
//  TabBarController.swift
//  LeroyMerlinDemo
//
//  Created by msc on 20.04.2021.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        self.tabBar.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        self.tabBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        self.tabBar.tintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
       // let searchVC = SearchViewController()
        let mainVC = MainViewController()
        let listVC = UIViewController()
        let mapVC = UIViewController()
        let profileVC = UIViewController()
        let cartVC = UIViewController()
        viewControllers = [generateNavigationContoller(rootViewController: mainVC, title: "Главная", image: UIImage(systemName: "magnifyingglass") ?? UIImage()), generateNavigationContoller(rootViewController: listVC, title: "Мой список", image: UIImage(named: "ticket") ?? UIImage()), generateNavigationContoller(rootViewController: mapVC, title: "Магазины", image: UIImage(named: "store") ?? UIImage()), generateNavigationContoller(rootViewController: profileVC, title: "Профиль", image: UIImage(named: "avatar") ?? UIImage()), generateNavigationContoller(rootViewController: cartVC, title: "Корзина", image: UIImage(named: "cart") ?? UIImage())]
    }
    
    private func generateNavigationContoller(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }

}
