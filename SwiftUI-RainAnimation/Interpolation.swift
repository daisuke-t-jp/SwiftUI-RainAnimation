//
//  Interpolation.swift
//  SwiftUI-RainAnimation
//
//  Created by Daisuke TONOSAKI on 2020/02/10.
//  Copyright © 2020 Daisuke TONOSAKI. All rights reserved.
//

import Foundation

class Interpolation {
    
    static func interpolationFastSlow(_ v: Float) -> Float {
        return sin(Common.deg2rad(v * 90))
    }
    
    static func interpolationSlowFast(_ v: Float) -> Float {
        return 1.0 - cos(Common.deg2rad(v * 90))
    }
    
    static func interpolationArc(_ v: Float) -> Float {
        return sin(Common.deg2rad(v * 180))
    }

    static func interpolationFastSlowFast(_ v: Float) -> Float {
        return v < 0.5 ? sin(Common.deg2rad(v * 180)) * 0.5 : 1.0 - sin(Common.deg2rad(v * 180)) * 0.5 + 0.5
    }
    
    static func interpolationSlowFastSlow(_ v: Float) -> Float {
        return v < 0.5 ? 1.0 - cos(Common.deg2rad(v * 180.0)) * 0.5 : cos(Common.deg2rad(v * 180.0)) * -0.5 + 0.5
    }
    
}
