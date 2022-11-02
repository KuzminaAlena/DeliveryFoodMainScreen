//
//  MainTabBarController.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    var menu: Menu?
    
    func setup() {
        let requestLoader = RequestLoader()
        let menuFactory = MenuURLRequestFactory()
        let menuService = MenuService(
            requestLoader: requestLoader,
            factory: menuFactory
        )
        let factory = MenuFactory()
        
      
        
        let tabBarApperance = UITabBar.appearance()
        tabBarApperance.tintColor = .redCustom
        tabBarApperance.unselectedItemTintColor = .grayCustom
        tabBarApperance.barTintColor = .whiteCustom
        tabBarApperance.backgroundColor = .whiteCustom
        
        let menuViewController = MenuAssembly().makeModule(
            menu: menu,
            menuService: menuService,
            factory: factory
        ).container
        
        let menuNavigationController = UINavigationController(rootViewController: menuViewController)
        menuNavigationController.tabBarItem.image = UIImage.menuMainTabBar
        menuNavigationController.tabBarItem.title = "Меню"
        
        let contactsViewController = ContactsAssembly().makeModule().container
        let contactsNavigationController = UINavigationController(rootViewController: contactsViewController)
        contactsNavigationController.tabBarItem.image = UIImage.contactsMainTabBar
        contactsNavigationController.tabBarItem.title = "Контакты"
        
        let profileViewController = ProfileAssembly().makeModule().container
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.tabBarItem.image = UIImage.profileMainTabBar
        profileNavigationController.tabBarItem.title = "Профиль"
        
        let basketViewController = BasketAssembly().makeModule().container
        let basketNavigationController = UINavigationController(rootViewController: basketViewController)
        basketNavigationController.tabBarItem.image = UIImage.basketMainTabBar
        basketNavigationController.tabBarItem.title = "Корзина"
        
        viewControllers = [
            menuNavigationController,
            contactsNavigationController,
            profileNavigationController,
            basketNavigationController
        ]
    }
}
