//
//  ListModel.swift
//  TableListDemo
//
//  Created by Darshan on 09/03/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

struct DataModel: Decodable {
    let title: String?
    var rows: [ListModel]?
}

struct ListModel: Decodable, Equatable {
    let title: String?
    let description: String?
    let imageHref: String?
}
