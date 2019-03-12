//
//  ReusableProtocol.swift
//  TableListDemo
//
//  Created by CognizantMcBook on 3/12/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

public protocol ReusableViewProtocol: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableViewProtocol where Self: UIView {
    public static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
