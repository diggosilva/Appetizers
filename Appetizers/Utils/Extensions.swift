//
//  Extensions.swift
//  Appetizers
//
//  Created by Diggo Silva on 17/01/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach({ self.addSubview($0) })
    }
}
