//
//  ListViewModel.swift
//  TableListDemo
//
//  Created by Darshan on 09/03/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit
import Alamofire

class ListViewModel: ListViewModelProtocol {
    
    var users: [Rows]? {
        didSet {
            listVMDelegate.userDataChanged(nil)
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
        
        Alamofire.request(URL(string: baseUrl)!,
                          method: .get,
                          parameters: nil)
            .validate().responseData { [weak self] (response) in
                
                guard let weakSelf = self else { return }
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms")
                    weakSelf.listVMDelegate.userDataChanged(response.result.error.debugDescription)
                    return
                }

                do {
                    _ = try JSONDecoder().decode(DataModel.self, from: response.data!)
                    weakSelf.listVMDelegate.userDataChanged("Unable to decode")
                }
                catch let error {
                    print("Unable to decode")
                weakSelf.listVMDelegate.userDataChanged(error.localizedDescription)
                }
        }
    }
    
}
