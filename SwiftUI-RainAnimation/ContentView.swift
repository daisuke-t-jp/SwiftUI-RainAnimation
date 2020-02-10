//
//  ContentView.swift
//  SwiftUI-RainAnimation
//
//  Created by Daisuke TONOSAKI on 2020/02/09.
//  Copyright © 2020 Daisuke TONOSAKI. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Const, Enum
    static let framesPerSecond: Int = 60
    static let dropMax: Int = 1000
    static let dropSizeMin = 7
    static let dropSizeMax = 10
    static let dropCountMin = 60
    static let dropCountMax = 90
    static let dropChance = 1
    static var colorArray = [Color(UIColor.systemBlue),
                             Color(UIColor.systemIndigo),
                             Color(UIColor.systemTeal)]

    
    // MARK: Property
    @State var drops: [Drop] = []
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: TimeInterval(1.0 / TimeInterval(ContentView.framesPerSecond)),
                             repeats: true) {_ in
                                self.rainUpdate()
        }
    }
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ForEach(self.drops) { drop in
                Circle()
                    .fill(drop.color)
                    .frame(width: drop.size, height: drop.size)
                    .position(x: drop.x, y: drop.y)
                    .opacity(drop.opacity)
            }
        }
        .onAppear() {
            _ = self.timer
        }
    }
    
}


// MARK: - Rain
extension ContentView {
    func rainUpdate() {
        guard let viewSize = UIApplication.viewSize() else {
            return
        }
        
        if (drops.count < ContentView.dropMax) {
            if Int.random(in: 0..<ContentView.dropChance) == 0 {
                var drop = Drop()
                drop.x = CGFloat(Int.random(in: 0..<Int(viewSize.width)))
                drop.size = CGFloat(Int.random(in: ContentView.dropSizeMin...ContentView.dropSizeMax))
                drop.color = ContentView.colorArray[Int.random(in: 0..<ContentView.colorArray.count)]
                drop.countMax = Int.random(in: ContentView.dropCountMin..<ContentView.dropCountMax)
                drops.append(drop)
            }
        }

        var drops2:[Drop] = []
        
        for drop in drops {
            if drop.y > viewSize.height {
                continue
            }
            
            let v = Interpolation.interpolationSlowFast(Float(Float(drop.count) / Float(drop.countMax)))
            let arc = Interpolation.interpolationArc(Float(Float(drop.count) / Float(drop.countMax)))
            
            var drop2 = Drop(drop)
            drop2.y = CGFloat(v) * viewSize.height
            drop2.count = drop2.count + 1
            drop2.opacity = Double(arc)
            
            drops2.append(drop2)
        }
        
        drops = drops2
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
