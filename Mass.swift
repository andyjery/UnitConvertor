//
//  Mass.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/24.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Mass
{
    struct massContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var massContents:[massContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.massContents = [
            massContent(longDescription: longFormatter.string(from: UnitMass.kilograms).capitalized, shortDescription: shortFormatter.string(from: UnitMass.kilograms), ratio: 1),
            massContent(longDescription: longFormatter.string(from: UnitMass.grams).capitalized, shortDescription: shortFormatter.string(from: UnitMass.grams), ratio: 0.001),
            massContent(longDescription: longFormatter.string(from: UnitMass.decigrams).capitalized, shortDescription: shortFormatter.string(from: UnitMass.decigrams), ratio: 0.0001),
            massContent(longDescription: longFormatter.string(from: UnitMass.centigrams).capitalized, shortDescription: shortFormatter.string(from: UnitMass.centigrams), ratio: 0.00001),
            massContent(longDescription: longFormatter.string(from: UnitMass.milligrams).capitalized, shortDescription: shortFormatter.string(from: UnitMass.milligrams), ratio: 0.000001),
            massContent(longDescription: longFormatter.string(from: UnitMass.micrograms).capitalized, shortDescription: shortFormatter.string(from: UnitMass.micrograms), ratio: 1e-9),
            massContent(longDescription: longFormatter.string(from: UnitMass.nanograms).capitalized, shortDescription: shortFormatter.string(from: UnitMass.nanograms), ratio: 1e-12),
            massContent(longDescription: longFormatter.string(from: UnitMass.picograms).capitalized, shortDescription: shortFormatter.string(from: UnitMass.picograms), ratio: 1e-15),
            massContent(longDescription: longFormatter.string(from: UnitMass.ounces).capitalized, shortDescription: shortFormatter.string(from: UnitMass.ounces), ratio: 0.0283495),
            massContent(longDescription: longFormatter.string(from: UnitMass.pounds).capitalized, shortDescription: shortFormatter.string(from: UnitMass.pounds), ratio: 0.453592),
            massContent(longDescription: longFormatter.string(from: UnitMass.stones).capitalized, shortDescription: shortFormatter.string(from: UnitMass.stones), ratio: 0.157473),
            massContent(longDescription: longFormatter.string(from: UnitMass.metricTons).capitalized, shortDescription: shortFormatter.string(from: UnitMass.metricTons), ratio: 1000),
            massContent(longDescription: longFormatter.string(from: UnitMass.shortTons).capitalized, shortDescription: shortFormatter.string(from: UnitMass.shortTons), ratio: 907.185),
            massContent(longDescription: longFormatter.string(from: UnitMass.carats).capitalized, shortDescription: shortFormatter.string(from: UnitMass.carats), ratio: 0.0002),
            massContent(longDescription: longFormatter.string(from: UnitMass.ouncesTroy).capitalized, shortDescription: shortFormatter.string(from: UnitMass.ouncesTroy), ratio: 0.03110348),
            massContent(longDescription: longFormatter.string(from: UnitMass.slugs).capitalized, shortDescription: shortFormatter.string(from: UnitMass.slugs), ratio: 14.5939)
        ]
    }
}
