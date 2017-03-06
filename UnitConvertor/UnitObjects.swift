//
//  UnitObjects.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/22.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation

struct unitObject {
    var unitObjectName:String
    var isUsable:Bool = true
    init(unitObjectName:String) {
        self.unitObjectName = unitObjectName
    }
}

class UnitObjects
{
    var unitObjects:[unitObject] = []
    let distanceName = "distance"
    let areaName = "area"
    let volumeName = "volume"
    let massName = "mass"
    let angleName = "angle"
    let accelerationName = "acceleration"
    let concentrationName = "concentration"
    let dispersionName = "dispersion"
    //concentration may combine with dispersion
    let durationName = "duration"
    let electricChargeName = "charge"
    let electricCurrentName = "current"
    let electricVoltageName = "voltage"
    let electricResistanceName = "resistance"
    let energyName = "energy"
    //above all may be related together
    let frequencyName = "frequency"
    //maybe put in wavewidth property
//    let fuelEfficiencyName = "fuel efficiency"
    //not get valid ratio
//    let illuminanceName = "illuminance"
    //not get valid ratio
    let powerName = "power"
    //may be related with "energy"
    let pressureName = "pressure"
    let speedName = "speed"
    let temperatureName = "temperature"
    
    
    init() {
        unitObjects.append(unitObject(unitObjectName: distanceName))
        unitObjects.append(unitObject(unitObjectName: areaName))
        unitObjects.append(unitObject(unitObjectName: volumeName))
        unitObjects.append(unitObject(unitObjectName: massName))
        unitObjects.append(unitObject(unitObjectName: angleName))
        unitObjects.append(unitObject(unitObjectName: accelerationName))
        unitObjects.append(unitObject(unitObjectName: concentrationName))
        unitObjects.append(unitObject(unitObjectName: dispersionName))
        unitObjects.append(unitObject(unitObjectName: durationName))
        unitObjects.append(unitObject(unitObjectName: electricChargeName))
        unitObjects.append(unitObject(unitObjectName: electricCurrentName))
        unitObjects.append(unitObject(unitObjectName: electricVoltageName))
        unitObjects.append(unitObject(unitObjectName: electricResistanceName))
        unitObjects.append(unitObject(unitObjectName: energyName))
        unitObjects.append(unitObject(unitObjectName: frequencyName))
//        unitObjects.append(unitObject(unitObjectName: fuelEfficiencyName))
//        unitObjects.append(unitObject(unitObjectName: illuminanceName))
        unitObjects.append(unitObject(unitObjectName: powerName))
        unitObjects.append(unitObject(unitObjectName: pressureName))
        unitObjects.append(unitObject(unitObjectName: speedName))
        unitObjects.append(unitObject(unitObjectName: temperatureName))
    }
    
}
