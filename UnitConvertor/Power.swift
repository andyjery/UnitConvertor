//
//  Power.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/25.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Power
{
    struct powerContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var powerContents:[powerContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.powerContents = [
            powerContent(longDescription: longFormatter.string(from: UnitPower.terawatts).capitalized, shortDescription: shortFormatter.string(from: UnitPower.terawatts), ratio: 1e+12),
            powerContent(longDescription: longFormatter.string(from: UnitPower.gigawatts).capitalized, shortDescription: shortFormatter.string(from: UnitPower.gigawatts), ratio: 1e+9),
            powerContent(longDescription: longFormatter.string(from: UnitPower.megawatts).capitalized, shortDescription: shortFormatter.string(from: UnitPower.megawatts), ratio: 1000000),
            powerContent(longDescription: longFormatter.string(from: UnitPower.kilowatts).capitalized, shortDescription: shortFormatter.string(from: UnitPower.kilowatts), ratio: 1000),
            powerContent(longDescription: longFormatter.string(from: UnitPower.watts).capitalized, shortDescription: shortFormatter.string(from: UnitPower.watts), ratio: 1),
            powerContent(longDescription: longFormatter.string(from: UnitPower.milliwatts).capitalized, shortDescription: shortFormatter.string(from: UnitPower.milliwatts), ratio: 0.001),
            powerContent(longDescription: longFormatter.string(from: UnitPower.microwatts).capitalized, shortDescription: shortFormatter.string(from: UnitPower.microwatts), ratio: 0.000001),
            powerContent(longDescription: longFormatter.string(from: UnitPower.nanowatts).capitalized, shortDescription: shortFormatter.string(from: UnitPower.nanowatts), ratio: 1e-9),
            powerContent(longDescription: longFormatter.string(from: UnitPower.picowatts).capitalized, shortDescription: shortFormatter.string(from: UnitPower.picowatts), ratio: 1e-12),
            powerContent(longDescription: longFormatter.string(from: UnitPower.femtowatts).capitalized, shortDescription: shortFormatter.string(from: UnitPower.femtowatts), ratio: 1e-15),
            powerContent(longDescription: longFormatter.string(from: UnitPower.horsepower).capitalized, shortDescription: shortFormatter.string(from: UnitPower.horsepower), ratio: 745.7)
        ]
    }
}
