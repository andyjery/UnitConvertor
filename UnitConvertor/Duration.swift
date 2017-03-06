//
//  Duration.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/25.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation
class Duration
{
    struct durationContent {
        var longDescription:String
        var shortDescription:String
        var ratio:Double
        
        init(longDescription:String, shortDescription:String, ratio:Double) {
            self.longDescription = longDescription
            self.shortDescription = shortDescription
            self.ratio = ratio
        }
    }
    
    var durationContents:[durationContent]!
    
    init() {
        let longFormatter = MeasurementFormatter()
        longFormatter.unitStyle = .long
        let shortFormatter = MeasurementFormatter()
        shortFormatter.unitStyle = .short
        self.durationContents = [
            durationContent(longDescription: longFormatter.string(from: UnitDuration.seconds).capitalized, shortDescription: shortFormatter.string(from: UnitDuration.seconds), ratio: 1),
            durationContent(longDescription: longFormatter.string(from: UnitDuration.minutes).capitalized, shortDescription: shortFormatter.string(from: UnitDuration.minutes), ratio: 60),
            durationContent(longDescription: longFormatter.string(from: UnitDuration.hours).capitalized, shortDescription: shortFormatter.string(from: UnitDuration.hours), ratio: 3600)
        ]
    }
}
