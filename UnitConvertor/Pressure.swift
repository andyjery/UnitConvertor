//
//  Pressure.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/25.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Pressure
{
    struct pressureContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var pressureContents:[pressureContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.pressureContents = [
            pressureContent(longDescription: longFormatter.string(from: UnitPressure.newtonsPerMetersSquared).capitalized, shortDescription: shortFormatter.string(from: UnitPressure.newtonsPerMetersSquared), ratio: 1),
            pressureContent(longDescription: longFormatter.string(from: UnitPressure.gigapascals).capitalized, shortDescription: shortFormatter.string(from: UnitPressure.gigapascals), ratio: 1e+9),
            pressureContent(longDescription: longFormatter.string(from: UnitPressure.megapascals).capitalized, shortDescription: shortFormatter.string(from: UnitPressure.megapascals), ratio: 1000000),
            pressureContent(longDescription: longFormatter.string(from: UnitPressure.kilopascals).capitalized, shortDescription: shortFormatter.string(from: UnitPressure.kilopascals), ratio: 1000),
            pressureContent(longDescription: longFormatter.string(from: UnitPressure.hectopascals).capitalized, shortDescription: shortFormatter.string(from: UnitPressure.hectopascals), ratio: 100),
            pressureContent(longDescription: longFormatter.string(from: UnitPressure.inchesOfMercury).capitalized, shortDescription: shortFormatter.string(from: UnitPressure.inchesOfMercury), ratio: 3386.39),
            pressureContent(longDescription: longFormatter.string(from: UnitPressure.bars).capitalized, shortDescription: shortFormatter.string(from: UnitPressure.bars), ratio: 100000),
            pressureContent(longDescription: longFormatter.string(from: UnitPressure.millibars).capitalized, shortDescription: shortFormatter.string(from: UnitPressure.millibars), ratio: 100),
            pressureContent(longDescription: longFormatter.string(from: UnitPressure.millimetersOfMercury).capitalized, shortDescription: shortFormatter.string(from: UnitPressure.millimetersOfMercury), ratio: 133.322),
            pressureContent(longDescription: longFormatter.string(from: UnitPressure.poundsForcePerSquareInch).capitalized, shortDescription: shortFormatter.string(from: UnitPressure.poundsForcePerSquareInch), ratio: 6894.76)
        ]
    }
}
