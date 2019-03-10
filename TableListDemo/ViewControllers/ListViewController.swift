//
//  ListViewController.swift
//  TableListDemo
//
//  Created by Darshan on 09/03/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var tableView: UITableView!
    var listVM = ListViewModel()
    
    deinit {
        print("deinit called")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listVM.listVMDelegate = self
    }
}

extension ListViewController: ListVMDelegate {
    func userDataChanged(_ error: String?) {
        print(error ?? "nil")
    }
}
