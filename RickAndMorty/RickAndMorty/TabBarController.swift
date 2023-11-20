//
//  TabBarController.swift
//  RickAndMorty
//
//  Created by Сергей Сырбу on 12.11.2023.
//

import UIKit

class TabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
      
    }
    
    func setupViewControllers() {
        let episidesVC = UINavigationController(rootViewController: EpisodesViewController())
        episidesVC.tabBarItem = UITabBarItem(title: "", image: .init(systemName: "house"), selectedImage: .init(systemName: "house.fill"))
        
        let favoriteVC = UINavigationController(rootViewController: FavoritesViewController())
        favoriteVC.tabBarItem = UITabBarItem(title: "", image: .init(systemName: "heart"), selectedImage: .init(systemName: "heart.fill"))
        
        viewControllers = [episidesVC, favoriteVC]
        
        self.tabBar.unselectedItemTintColor = .systemBlue
    }

}
