//
//  Area.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/22.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation

class Area
{
    struct areaContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var areaContents:[areaContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.areaContents = [
            areaContent(longDescription: longFormatter.string(from: UnitArea.squareNanometers).capitalized, shortDescription: shortFormatter.string(from: UnitArea.squareNanometers), ratio: 1e-18),
            areaContent(longDescription: longFormatter.string(from: UnitArea.squareMicrometers).capitalized, shortDescription: shortFormatter.string(from: UnitArea.squareMicrometers), ratio: 1e-12),
            areaContent(longDescription: longFormatter.string(from: UnitArea.squareMillimeters).capitalized, shortDescription: shortFormatter.string(from: UnitArea.squareMillimeters), ratio: 0.00001),
            areaContent(longDescription: longFormatter.string(from: UnitArea.squareCentimeters).capitalized, shortDescription: shortFormatter.string(from: UnitArea.squareCentimeters), ratio: 0.0001),
            areaContent(longDescription: longFormatter.string(from: UnitArea.squareMeters).capitalized, shortDescription: shortFormatter.string(from: UnitArea.squareMeters), ratio: 1),
            areaContent(longDescription: longFormatter.string(from: UnitArea.squareKilometers).capitalized, shortDescription: shortFormatter.string(from: UnitArea.squareKilometers), ratio: 1000000),
            areaContent(longDescription: longFormatter.string(from: UnitArea.squareMegameters).capitalized, shortDescription: shortFormatter.string(from: UnitArea.squareMegameters), ratio: 1e+12),
            areaContent(longDescription: longFormatter.string(from: UnitArea.squareInches).capitalized, shortDescription: shortFormatter.string(from: UnitArea.squareInches), ratio: 0.00064516),
            areaContent(longDescription: longFormatter.string(from: UnitArea.squareFeet).capitalized, shortDescription: shortFormatter.string(from: UnitArea.squareFeet), ratio: 0.092903),
            areaContent(longDescription: longFormatter.string(from: UnitArea.squareYards).capitalized, shortDescription: shortFormatter.string(from: UnitArea.squareYards), ratio: 0.836127),
            areaContent(longDescription: longFormatter.string(from: UnitArea.squareMiles).capitalized, shortDescription: shortFormatter.string(from: UnitArea.squareMiles), ratio: 2.59e+6),
            areaContent(longDescription: longFormatter.string(from: UnitArea.acres).capitalized, shortDescription: shortFormatter.string(from: UnitArea.acres), ratio: 4046.86),
            areaContent(longDescription: longFormatter.string(from: UnitArea.ares).capitalized, shortDescription: shortFormatter.string(from: UnitArea.ares), ratio: 100),
            areaContent(longDescription: longFormatter.string(from: UnitArea.hectares).capitalized, shortDescription: shortFormatter.string(from: UnitArea.hectares), ratio: 10000)
        ]
    }
}
