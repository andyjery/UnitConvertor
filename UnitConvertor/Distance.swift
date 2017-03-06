//
//  Distance.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/20.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation

class Distance
{
    struct distanceContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var distanceContents:[distanceContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.distanceContents = [
            distanceContent(longDescription: longFormatter.string(from: UnitLength.picometers).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.picometers)), ratio: 1e-12),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.nanometers).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.nanometers)),ratio: 1e-9),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.micrometers).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.micrometers)),ratio: 0.000001),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.millimeters).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.millimeters)),ratio: 0.001),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.centimeters).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.centimeters)),ratio: 0.01),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.decimeters).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.decimeters)),ratio: 0.1),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.meters).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.meters)),ratio: 1),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.decameters).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.decameters)),ratio: 10),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.hectometers).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.hectometers)),ratio: 100),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.kilometers).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.kilometers)),ratio: 1000),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.megameters).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.megameters)),ratio: 1000000),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.inches).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.inches)),ratio: 0.0254),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.feet).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.feet)),ratio: 0.3048),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.yards).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.yards)),ratio: 0.9144),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.miles).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.miles)),ratio: 1609.34),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.scandinavianMiles).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.scandinavianMiles)),ratio: 10000),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.lightyears).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.lightyears)),ratio: 9.4605284e+15),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.nauticalMiles).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.nauticalMiles)),ratio: 1852),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.fathoms).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.fathoms)),ratio: 1.8288),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.furlongs).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.furlongs)),ratio: 201.168),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.astronomicalUnits).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.astronomicalUnits)),ratio: 1.49597871e+11),
            distanceContent(longDescription: longFormatter.string(from: UnitLength.parsecs).capitalized, shortDescription: shortFormatter.string(from: (from: UnitLength.parsecs)),ratio: 3.08567758e+16)
        ]
    }
    
}
