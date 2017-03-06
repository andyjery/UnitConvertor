//
//  Volume.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/24.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation

class Volume
{
    struct volumeContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var volumeContents:[volumeContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.volumeContents = [
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.cubicMillimeters).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.cubicMillimeters), ratio: 0.000001),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.cubicCentimeters).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.cubicCentimeters), ratio: 0.001),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.cubicDecimeters).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.cubicDecimeters), ratio: 1),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.cubicMeters).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.cubicMeters), ratio: 1000),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.cubicKilometers).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.cubicKilometers), ratio: 1e+12),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.cubicInches).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.cubicInches), ratio: 0.0162871),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.cubicFeet).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.cubicFeet), ratio: 28.3168),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.cubicYards).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.cubicYards), ratio: 764.555),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.cubicMiles).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.cubicMiles), ratio: 4.168e+12),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.milliliters).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.milliliters), ratio: 0.001),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.centiliters).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.centiliters), ratio: 0.01),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.deciliters).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.deciliters), ratio: 0.1),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.liters).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.liters), ratio: 1),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.kiloliters).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.kiloliters), ratio: 1000),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.megaliters).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.megaliters), ratio: 1000000),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.acreFeet).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.acreFeet), ratio: 1.233e+6),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.bushels).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.bushels), ratio: 35.2391),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.teaspoons).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.teaspoons), ratio: 0.00492892),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.tablespoons).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.tablespoons), ratio: 0.0147868),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.fluidOunces).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.fluidOunces), ratio: 0.0295735),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.cups).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.cups), ratio: 0.24),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.pints).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.pints), ratio: 0.473176),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.quarts).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.quarts), ratio: 0.946353),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.gallons).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.gallons), ratio: 3.78541),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.imperialTeaspoons).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.imperialTeaspoons), ratio: 0.00591939),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.imperialTablespoons).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.imperialTablespoons), ratio: 0.0177582),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.imperialFluidOunces).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.imperialFluidOunces), ratio: 0.0284131),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.imperialPints).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.imperialPints), ratio: 0.568261),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.imperialQuarts).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.imperialQuarts), ratio: 1.13652),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.imperialGallons).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.imperialGallons), ratio: 4.54609),
            volumeContent(longDescription: longFormatter.string(from: UnitVolume.metricCups).capitalized, shortDescription: shortFormatter.string(from: UnitVolume.metricCups), ratio: 0.25)
        ]
    }
}
