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
    
    var dataModel: DataModel? {
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
        return dataModel?.rows?.count ?? 0
    }
    
    func getUsersList() {
        
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
                
                if let latinString = String(data: response.data!, encoding: String.Encoding.isoLatin1) {
                    let dataUT8 = latinString.data(using: String.Encoding.utf8)
                    do {
                        let listData = try JSONDecoder().decode(DataModel.self, from: dataUT8!)
                        print(listData.title ?? "")
                        print(listData.rows ?? "")
                        
                        weakSelf.dataModel = listData
                    }
                    catch let error {
                        print("Unable to decode")
                        weakSelf.listVMDelegate.userDataChanged(error.localizedDescription)
                    }
                }
        }
    }
}
