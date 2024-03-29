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
            filterArrayItems()
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
        // Show laoder untill api returns a response.
        HudView.show()
        Alamofire.request(URL(string: baseUrl)!,
                          method: .get,
                          parameters: nil)
            .validate().responseData { [weak self] (response) in
                // Kill loader when api returns response.
                HudView.kill()
                
                guard let weakSelf = self else { return }
                guard response.result.isSuccess else {
                    weakSelf.listVMDelegate.userDataChanged(response.result.error.debugDescription)
                    return
                }
                
                if let latinString = String(data: response.data!, encoding: String.Encoding.isoLatin1) {
                    let dataUT8 = latinString.data(using: String.Encoding.utf8)
                    do {
                        let listData = try JSONDecoder().decode(DataModel.self, from: dataUT8!)
                        weakSelf.dataModel = listData
                    }catch let error {
                        weakSelf.listVMDelegate.userDataChanged(error.localizedDescription)
                    }
                }
        }
    }
    
    func filterArrayItems() {
        let emptyItems = dataModel?.rows?.filter({ $0.title == nil  && $0.imageHref == nil })
        _ = emptyItems?.map({ dataModel?.rows?.remove(object: $0) })
    }
}
