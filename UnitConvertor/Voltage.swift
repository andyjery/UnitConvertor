//
//  Voltage.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/25.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Voltage
{
    struct voltageContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var voltageContents:[voltageContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.voltageContents = [
            voltageContent(longDescription: longFormatter.string(from: UnitElectricPotentialDifference.megavolts).capitalized, shortDescription: shortFormatter.string(from: UnitElectricPotentialDifference.megavolts), ratio: 1000000),
            voltageContent(longDescription: longFormatter.string(from: UnitElectricPotentialDifference.kilovolts).capitalized, shortDescription: shortFormatter.string(from: UnitElectricPotentialDifference.kilovolts), ratio: 1000),
            voltageContent(longDescription: longFormatter.string(from: UnitElectricPotentialDifference.volts).capitalized, shortDescription: shortFormatter.string(from: UnitElectricPotentialDifference.volts), ratio: 1),
            voltageContent(longDescription: longFormatter.string(from: UnitElectricPotentialDifference.millivolts).capitalized, shortDescription: shortFormatter.string(from: UnitElectricPotentialDifference.millivolts), ratio: 0.001),
            voltageContent(longDescription: longFormatter.string(from: UnitElectricPotentialDifference.microvolts).capitalized, shortDescription: shortFormatter.string(from: UnitElectricPotentialDifference.microvolts), ratio: 0.000001)
        ]
    }
}
