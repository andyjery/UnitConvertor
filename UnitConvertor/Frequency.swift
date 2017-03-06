//
//  Frequency.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/25.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Frequency
{
    struct frequencyContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var frequencyContents:[frequencyContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.frequencyContents = [
            frequencyContent(longDescription: longFormatter.string(from: UnitFrequency.terahertz).capitalized, shortDescription: shortFormatter.string(from: UnitFrequency.terahertz), ratio: 1e+12),
            frequencyContent(longDescription: longFormatter.string(from: UnitFrequency.gigahertz).capitalized, shortDescription: shortFormatter.string(from: UnitFrequency.gigahertz), ratio: 1e+9),
            frequencyContent(longDescription: longFormatter.string(from: UnitFrequency.megahertz).capitalized, shortDescription: shortFormatter.string(from: UnitFrequency.megahertz), ratio: 1000000),
            frequencyContent(longDescription: longFormatter.string(from: UnitFrequency.kilohertz).capitalized, shortDescription: shortFormatter.string(from: UnitFrequency.kilohertz), ratio: 1000),
            frequencyContent(longDescription: longFormatter.string(from: UnitFrequency.hertz).capitalized, shortDescription: shortFormatter.string(from: UnitFrequency.hertz), ratio: 1),
            frequencyContent(longDescription: longFormatter.string(from: UnitFrequency.millihertz).capitalized, shortDescription: shortFormatter.string(from: UnitFrequency.millihertz), ratio: 0.001),
            frequencyContent(longDescription: longFormatter.string(from: UnitFrequency.microhertz).capitalized, shortDescription: shortFormatter.string(from: UnitFrequency.microhertz), ratio: 0.000001),
            frequencyContent(longDescription: longFormatter.string(from: UnitFrequency.nanohertz).capitalized, shortDescription: shortFormatter.string(from: UnitFrequency.nanohertz), ratio: 1e-9)
        ]
    }
}
