//
//  Custom+UIView.swift
//  TableListDemo
//
//  Created by CognizantMcBook on 3/12/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation
import QuartzCore
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
