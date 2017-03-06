//
//  Resistance.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/25.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Resistance
{
    struct resistanceContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var resistanceContents:[resistanceContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.resistanceContents = [
            resistanceContent(longDescription: longFormatter.string(from: UnitElectricResistance.megaohms).capitalized, shortDescription: shortFormatter.string(from: UnitElectricResistance.megaohms), ratio: 1000000),
            resistanceContent(longDescription: longFormatter.string(from: UnitElectricResistance.kiloohms).capitalized, shortDescription: shortFormatter.string(from: UnitElectricResistance.kiloohms), ratio: 1000),
            resistanceContent(longDescription: longFormatter.string(from: UnitElectricResistance.ohms).capitalized, shortDescription: shortFormatter.string(from: UnitElectricResistance.ohms), ratio: 1),
            resistanceContent(longDescription: longFormatter.string(from: UnitElectricResistance.milliohms).capitalized, shortDescription: shortFormatter.string(from: UnitElectricResistance.milliohms), ratio: 0.001),
            resistanceContent(longDescription: longFormatter.string(from: UnitElectricResistance.microohms).capitalized, shortDescription: shortFormatter.string(from: UnitElectricResistance.microohms), ratio: 0.000001)
        ]
    }
}
