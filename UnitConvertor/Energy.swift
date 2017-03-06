//
//  Energy.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/25.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Energy
{
    struct energyContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var energyContents:[energyContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.energyContents = [
            energyContent(longDescription: longFormatter.string(from: UnitEnergy.kilojoules).capitalized, shortDescription: shortFormatter.string(from: UnitEnergy.kilojoules), ratio: 1000),
            energyContent(longDescription: longFormatter.string(from: UnitEnergy.joules).capitalized, shortDescription: shortFormatter.string(from: UnitEnergy.joules), ratio: 1),
            energyContent(longDescription: longFormatter.string(from: UnitEnergy.kilocalories).capitalized, shortDescription: shortFormatter.string(from: UnitEnergy.kilocalories), ratio: 4184),
            energyContent(longDescription: longFormatter.string(from: UnitEnergy.calories).capitalized, shortDescription: shortFormatter.string(from: UnitEnergy.calories), ratio: 4.184),
            energyContent(longDescription: longFormatter.string(from: UnitEnergy.kilowattHours).capitalized, shortDescription: shortFormatter.string(from: UnitEnergy.kilowattHours), ratio: 3600000)
        ]
    }
}
