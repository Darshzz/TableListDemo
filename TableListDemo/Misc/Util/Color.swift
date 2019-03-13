//
//  Color.swift
//  TableListDemo
//
//  Created by CognizantMcBook on 3/13/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

struct Color {
    static func rgba(_ r : Float ,_ g : Float ,_ b : Float,_ alfa : Float) -> UIColor {
        
        return UIColor(red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue: CGFloat(b/255.0), alpha: CGFloat(alfa))
    }
}
