//
//  Dispersion.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/25.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Dispersion
{
    struct dispersionContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var dispersionContents:[dispersionContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.dispersionContents = [
            dispersionContent(longDescription: longFormatter.string(from: UnitDispersion.partsPerMillion).capitalized, shortDescription: shortFormatter.string(from: UnitDispersion.partsPerMillion), ratio: 1)
        ]
    }
}
