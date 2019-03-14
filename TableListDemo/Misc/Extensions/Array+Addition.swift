//
//  Array+Addition.swift
//  TableListDemo
//
//  Created by CognizantMcBook on 3/14/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        guard let index = index(of: object) else {return}
        remove(at: index)
    }
}
