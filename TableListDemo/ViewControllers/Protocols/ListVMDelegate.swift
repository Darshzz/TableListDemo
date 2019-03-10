//
//  ListVMDelegate.swift
//  TableListDemo
//
//  Created by Darshan on 09/03/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

protocol ListVMDelegate {
    static var reuseIdentifier: String { get }
    func userDataChanged(_ error: String?)
}

extension ListVMDelegate {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
