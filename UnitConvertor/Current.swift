//
//  Current.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/25.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Current
{
    struct currentContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var currentContents:[currentContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.currentContents = [
            currentContent(longDescription: longFormatter.string(from: UnitElectricCurrent.megaamperes).capitalized, shortDescription: shortFormatter.string(from: UnitElectricCurrent.megaamperes), ratio: 1000000),
            currentContent(longDescription: longFormatter.string(from: UnitElectricCurrent.kiloamperes).capitalized, shortDescription: shortFormatter.string(from: UnitElectricCurrent.kiloamperes), ratio: 1000),
            currentContent(longDescription: longFormatter.string(from: UnitElectricCurrent.amperes).capitalized, shortDescription: shortFormatter.string(from: UnitElectricCurrent.amperes), ratio: 1),
            currentContent(longDescription: longFormatter.string(from: UnitElectricCurrent.milliamperes).capitalized, shortDescription: shortFormatter.string(from: UnitElectricCurrent.milliamperes), ratio: 0.001),
            currentContent(longDescription: longFormatter.string(from: UnitElectricCurrent.microamperes).capitalized, shortDescription: shortFormatter.string(from: UnitElectricCurrent.microamperes), ratio: 0.000001)
        ]
    }
}
