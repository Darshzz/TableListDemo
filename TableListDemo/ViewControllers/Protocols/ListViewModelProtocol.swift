//
//  ListViewModelProtocol.swift
//  TableListDemo
//
//  Created by Darshan on 09/03/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

protocol ListViewModelProtocol {
    var users: [Rows]? { get set }
    var listVMDelegate: ListVMDelegate! { get set }
    var numberOfItems: Int! { get }
}
