//
//  UIApplication+Ext.swift
//  SwiftUI-RainAnimation
//
//  Created by Daisuke TONOSAKI on 2020/02/10.
//  Copyright © 2020 Daisuke TONOSAKI. All rights reserved.
//

import UIKit

extension UIApplication {
    static func viewSize() -> CGSize? {
        guard let keyWindow = shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first else {
                return nil
        }
        
        guard let rootViewController = keyWindow.rootViewController else {
            return nil
        }
        
        guard let view = rootViewController.view else {
            return nil
        }
        
        return view.frame.size
    }
}
