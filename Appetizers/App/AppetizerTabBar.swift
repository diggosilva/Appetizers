//
//  AppetizerTabBar.swift
//  Appetizers
//
//  Created by Diggo Silva on 02/12/23.
//

import UIKit

class AppetizerTabBar: UITabBarController {
    
    let vc1 = UINavigationController(rootViewController: AppetizerViewController())
    let vc2 = UINavigationController(rootViewController: AccountViewController())
    let vc3 = UINavigationController(rootViewController: OrderViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
    }
    
    private func configTabBar() {
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        vc1.title = "Home"
        
        vc2.tabBarItem.image = UIImage(systemName: "person")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        vc2.title = "Conta"
        
        vc3.tabBarItem.image = UIImage(systemName: "bag")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "bag.fill")
        vc3.title = "Pedido"
        
        OrderSingleton.shared.listaProdutos.bind { listAppetizer in
            if listAppetizer.count > 0 {
                self.vc3.tabBarItem.badgeValue = "\(listAppetizer.count)"
            } else {
                self.vc3.tabBarItem.badgeValue = nil
            }
        }
        
        setViewControllers([vc1, vc2, vc3], animated: true)
    }
}
