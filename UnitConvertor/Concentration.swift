//
//  Concentration.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/25.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Concentration
{
    struct concentrationContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var concentrationContents:[concentrationContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.concentrationContents = [
            concentrationContent(longDescription: longFormatter.string(from: UnitConcentrationMass.gramsPerLiter).capitalized, shortDescription: shortFormatter.string(from: UnitConcentrationMass.gramsPerLiter), ratio: 1),
            concentrationContent(longDescription: longFormatter.string(from: UnitConcentrationMass.milligramsPerDeciliter).capitalized, shortDescription: shortFormatter.string(from: UnitConcentrationMass.milligramsPerDeciliter), ratio: 0.01)
        ]
    }
}
