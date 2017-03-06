//
//  Speed.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/25.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Speed
{
    struct speedContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var speedContents:[speedContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.speedContents = [
            speedContent(longDescription: longFormatter.string(from: UnitSpeed.metersPerSecond).capitalized, shortDescription: shortFormatter.string(from: UnitSpeed.metersPerSecond), ratio: 1),
            speedContent(longDescription: longFormatter.string(from: UnitSpeed.kilometersPerHour).capitalized, shortDescription: shortFormatter.string(from: UnitSpeed.kilometersPerHour), ratio: 0.277778),
            speedContent(longDescription: longFormatter.string(from: UnitSpeed.milesPerHour).capitalized, shortDescription: shortFormatter.string(from: UnitSpeed.milesPerHour), ratio: 0.44704),
            speedContent(longDescription: longFormatter.string(from: UnitSpeed.knots).capitalized, shortDescription: shortFormatter.string(from: UnitSpeed.knots), ratio: 0.514444)
        ]
    }
}
