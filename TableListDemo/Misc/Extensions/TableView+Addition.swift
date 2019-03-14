//
//  TableView+Addition.swift
//  TableListDemo
//
//  Created by CognizantMcBook on 3/12/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

// UITableView + Reusable cell
extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableViewProtocol {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableViewProtocol {
        register(T.self)
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}
