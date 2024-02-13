//
//  AppetizerTabBar.swift
//  Appetizers
//
//  Created by Diggo Silva on 02/12/23.
//

import UIKit

class AppetizerTabBar: UITabBarController {
    
    let vc1 = UINavigationController(rootViewController: AppetizerViewController())
    let vc2 = UINavigationController(rootViewController: OrderViewController())
    let vc3 = UINavigationController(rootViewController: AccountViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
    }
    
    private func configTabBar() {
        self.delegate = self
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        vc1.title = "Home"
        
        vc2.tabBarItem.image = UIImage(systemName: "bag")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "bag.fill")
        vc2.title = "Pedido"
        
        vc3.tabBarItem.image = UIImage(systemName: "person")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        vc3.title = "Conta"
        
        OrderSingleton.shared.listaProdutos.bind { listAppetizer in
            if listAppetizer.count > 0 {
                self.vc2.tabBarItem.badgeValue = "\(listAppetizer.count)"
            } else {
                self.vc2.tabBarItem.badgeValue = nil
            }
        }
        
        setViewControllers([vc1, vc2, vc3], animated: true)
    }
}

extension AppetizerTabBar: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
            animateTabBarItem(index: index)
        }
    }
    
    private func animateTabBarItem(index: Int) {
        guard let tabBarItems = tabBar.items, index < tabBarItems.count else {
            return
        }
        
        let selectedItem = tabBarItems[index]
        
        if let iconView = selectedItem.value(forKey: "view") as? UIView {
            let animation = CABasicAnimation(keyPath: "transform.scale")
            animation.duration = 0.12
            animation.fromValue = 1.0
            animation.toValue = 1.2
            animation.autoreverses = true
            iconView.layer.add(animation, forKey: "zoomAnimation")
        }
    }
}
