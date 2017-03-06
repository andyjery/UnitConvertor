//
//  Temperature.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/25.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Temperature
{
    struct temperatureContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        var constant:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double, constant:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
            self.constant = constant
        }
    }
    
    var temperatureContents:[temperatureContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.temperatureContents = [
            temperatureContent(longDescription: longFormatter.string(from: UnitTemperature.kelvin).capitalized, shortDescription: shortFormatter.string(from: UnitTemperature.kelvin), ratio: 1, constant: 0),
            temperatureContent(longDescription: longFormatter.string(from: UnitTemperature.celsius).capitalized, shortDescription: shortFormatter.string(from: UnitTemperature.celsius), ratio: 1, constant: 273.15),
            temperatureContent(longDescription: longFormatter.string(from: UnitTemperature.fahrenheit).capitalized, shortDescription: shortFormatter.string(from: UnitTemperature.fahrenheit), ratio: 0.55555555555556, constant: 255.37222222222427)
        ]
    }
}
