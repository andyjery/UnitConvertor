//
//  Angle.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/24.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Angle
{
    struct angleContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var angleContents:[angleContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.angleContents = [
            angleContent(longDescription: longFormatter.string(from: UnitAngle.degrees).capitalized, shortDescription: shortFormatter.string(from: UnitAngle.degrees), ratio: 1),
            angleContent(longDescription: longFormatter.string(from: UnitAngle.arcMinutes).capitalized, shortDescription: shortFormatter.string(from: UnitAngle.arcMinutes), ratio: 0.016667),
            angleContent(longDescription: longFormatter.string(from: UnitAngle.arcSeconds).capitalized, shortDescription: shortFormatter.string(from: UnitAngle.arcSeconds), ratio: 0.00027778),
            angleContent(longDescription: longFormatter.string(from: UnitAngle.radians).capitalized, shortDescription: shortFormatter.string(from: UnitAngle.radians), ratio: 57.2958),
            angleContent(longDescription: longFormatter.string(from: UnitAngle.gradians).capitalized, shortDescription: shortFormatter.string(from: UnitAngle.gradians), ratio: 0.9),
            angleContent(longDescription: longFormatter.string(from: UnitAngle.revolutions).capitalized, shortDescription: shortFormatter.string(from: UnitAngle.revolutions), ratio: 360)
        ]
    }
}
