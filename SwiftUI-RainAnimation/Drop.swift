//
//  Drop.swift
//  SwiftUI-RainAnimation
//
//  Created by Daisuke TONOSAKI on 2020/02/10.
//  Copyright © 2020 Daisuke TONOSAKI. All rights reserved.
//

import UIKit
import SwiftUI

struct Drop: Identifiable {
    let id = UUID()
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    var size: CGFloat = 0
    var color: Color = .blue
    var opacity: Double = 1
    var count: Int = 0
    var countMax: Int = 0
    
    init() {
    }
    
    init(_ drop: Drop) {
        x = drop.x
        y = drop.y
        size = drop.size
        opacity = drop.opacity
        color = drop.color
        count = drop.count
        countMax = drop.countMax
    }
}

