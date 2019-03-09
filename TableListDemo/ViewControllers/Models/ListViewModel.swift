//
//  ListViewModel.swift
//  TableListDemo
//
//  Created by Darshan on 09/03/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class ListViewModel: ListViewModelProtocol {
    
    var users: [ListModel]? {
        didSet {
            listVMDelegate.userDataChanged()
        }
    }
    
    var listVMDelegate: ListVMDelegate! {
        didSet {
            getUsersList()
        }
    }
    
    var numberOfItems: Int! {
        return users?.count ?? 0
    }
    
    private func getUsersList() {
        listVMDelegate.userDataChanged()
    }
    
}
