//
//  ListViewController.swift
//  TableListDemo
//
//  Created by Darshan on 09/03/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {


    var listVM = ListViewModel()
    let tableView : UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    deinit {
        print("deinit called")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listVM.listVMDelegate = self
        
        // add the table view to self.view
        self.view.addSubview(tableView)
        
        // constrain the table view to 0-pts on the top,
        //  0-pts on left, right and bottom (just to demonstrate size/position)
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        // set delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        // register a defalut cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVM.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = listVM.dataModel?.rows?[indexPath.row].title
        return cell
    }
}

extension ListViewController: ListVMDelegate {
    
    func userDataChanged(_ error: String?) {
        if error == nil {
            self.title = listVM.dataModel?.title
            tableView.reloadData()
        }
    }
}
