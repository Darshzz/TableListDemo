//
//  ListModel.swift
//  TableListDemo
//
//  Created by Darshan on 09/03/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

struct DataModel: Decodable {
    
    let title: String
    let rows: [Rows]
}

struct Rows: Decodable {
    let title: String!
    let description: String!
    let imageHref: String!
}
