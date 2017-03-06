//
//  Acceleration.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/24.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Acceleration
{
    struct accContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var accContents:[accContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.accContents = [
            accContent(longDescription: longFormatter.string(from: UnitAcceleration.metersPerSecondSquared).capitalized, shortDescription: shortFormatter.string(from: UnitAcceleration.metersPerSecondSquared), ratio: 1),
            accContent(longDescription: longFormatter.string(from: UnitAcceleration.gravity).capitalized, shortDescription: shortFormatter.string(from: UnitAcceleration.gravity), ratio: 9.81)
        ]
    }
}
