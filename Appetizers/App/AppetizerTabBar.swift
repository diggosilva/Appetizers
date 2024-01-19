//
//  AppetizerTabBar.swift
//  Appetizers
//
//  Created by Diggo Silva on 02/12/23.
//

import UIKit

class AppetizerTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
    }
    
    private func configTabBar() {
        let vc1 = UINavigationController(rootViewController: AppetizerViewController())
        let vc2 = UINavigationController(rootViewController: AccountViewController())
        let vc3 = UINavigationController(rootViewController: OrderViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        vc1.title = "Home"
        
        vc2.tabBarItem.image = UIImage(systemName: "person")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        vc2.title = "Conta"
    
        vc3.tabBarItem.image = UIImage(systemName: "bag")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "bag.fill")
        vc3.title = "Pedido"
        vc3.tabBarItem.badgeValue = "2"
        
        setViewControllers([vc1, vc2, vc3], animated: true)
    }
}
