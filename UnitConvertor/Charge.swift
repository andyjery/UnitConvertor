//
//  Charge.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/25.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Charge
{
    struct chargeContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var chargeContents:[chargeContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.chargeContents = [
            chargeContent(longDescription: longFormatter.string(from: UnitElectricCharge.coulombs).capitalized, shortDescription: shortFormatter.string(from: UnitElectricCharge.coulombs), ratio: 1),
            chargeContent(longDescription: longFormatter.string(from: UnitElectricCharge.megaampereHours).capitalized, shortDescription: shortFormatter.string(from: UnitElectricCharge.megaampereHours), ratio: 3.6e+9),
            chargeContent(longDescription: longFormatter.string(from: UnitElectricCharge.kiloampereHours).capitalized, shortDescription: shortFormatter.string(from: UnitElectricCharge.kiloampereHours), ratio: 3600000),
            chargeContent(longDescription: longFormatter.string(from: UnitElectricCharge.ampereHours).capitalized, shortDescription: shortFormatter.string(from: UnitElectricCharge.ampereHours), ratio: 3600),
            chargeContent(longDescription: longFormatter.string(from: UnitElectricCharge.milliampereHours).capitalized, shortDescription: shortFormatter.string(from: UnitElectricCharge.milliampereHours), ratio: 3.6),
            chargeContent(longDescription: longFormatter.string(from: UnitElectricCharge.microampereHours).capitalized, shortDescription: shortFormatter.string(from: UnitElectricCharge.microampereHours), ratio: 0.0036)
        ]
    }
}
