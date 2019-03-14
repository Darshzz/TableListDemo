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
    
    let tableView: UITableView = {
        let tble = UITableView()
        tble.translatesAutoresizingMaskIntoConstraints = false
        return tble
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(handleRefresh(_:)),
                                 for: .valueChanged)
        refreshControl.tintColor = UIColor.gray
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listVM.listVMDelegate = self
        
        // add the table view to self.view
        self.view.addSubview(tableView)
        // add the refreshControl to self.view
        self.tableView.addSubview(self.refreshControl)
        
        setUpTableView()
    }
    
    private func setUpTableView() {
        // constrain the table view to 0-pts on the top,
        //  0-pts on left, right and bottom (just to demonstrate size/position)
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        // set delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 150 // Just an estimated value for calculating scroll indicator
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        
        // register a defalut cell
        tableView.register(ListViewCell.self)
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        // hit api again to get new data.
        listVM.getUsersList()
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVM.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ListViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.selectionStyle = .none
        
        cell.configureCell(listVM.dataModel?.rows?[indexPath.row])
        return cell
    }
}

extension ListViewController: ListVMDelegate {
    
    // Delegate will called when api is successfully hitted.
    func userDataChanged(_ error: String?) {
        if error == nil {
            self.title = listVM.dataModel?.title
            tableView.reloadData()
            refreshControl.endRefreshing()
            tableView.separatorStyle = .singleLine
        }
    }
}
