//
//  Unit.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2016/12/23.
//  Copyright © 2016年 Jerry Chen. All rights reserved.
//

import Foundation

class UnitRecord
{
    private var inputValue:String!
    private var selectedIndex:Int!
    private var basicUnits:[UnitStruct] = []
    private var calNum:Double!
    private var basedNum:Double!
    
    init(inputValue:String, selectedIndex:Int) {
        self.inputValue = inputValue
        self.selectedIndex = selectedIndex
        self.calNum = Double(inputValue) ?? 0
        self.basedNum = 0
    }
    
    func distance() -> [UnitStruct]
    {
        let distanceRecord = Distance()
        
        basedNum = calNum * distanceRecord.distanceContents[selectedIndex].ratio
        
        for i in 0...(distanceRecord.distanceContents.count - 1)
        {
            let calValue = basedNum / distanceRecord.distanceContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: distanceRecord.distanceContents[i].longDescription, symbolName: distanceRecord.distanceContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }
    
    func area() -> [UnitStruct]
    {
        let areaRecord = Area()
        
        basedNum = calNum * areaRecord.areaContents[selectedIndex].ratio
        
        for i in 0...(areaRecord.areaContents.count - 1)
        {
            let calValue = basedNum / areaRecord.areaContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: areaRecord.areaContents[i].longDescription, symbolName: areaRecord.areaContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }
    
    func volume() -> [UnitStruct]
    {
        let volumeRecord = Volume()
        
        basedNum = calNum * volumeRecord.volumeContents[selectedIndex].ratio
        
        for i in 0...(volumeRecord.volumeContents.count - 1)
        {
            let calValue = basedNum / volumeRecord.volumeContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: volumeRecord.volumeContents[i].longDescription, symbolName: volumeRecord.volumeContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }

    func mass() -> [UnitStruct]
    {
        let massRecord = Mass()
        
        basedNum = calNum * massRecord.massContents[selectedIndex].ratio
        
        for i in 0...(massRecord.massContents.count - 1)
        {
            let calValue = basedNum / massRecord.massContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: massRecord.massContents[i].longDescription, symbolName: massRecord.massContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }

    func angle() -> [UnitStruct]
    {
        let angleRecord = Angle()
        
        basedNum = calNum * angleRecord.angleContents[selectedIndex].ratio
        
        for i in 0...(angleRecord.angleContents.count - 1)
        {
            let calValue = basedNum / angleRecord.angleContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: angleRecord.angleContents[i].longDescription, symbolName: angleRecord.angleContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }

    func acceleration() -> [UnitStruct]
    {
        let accRecord = Acceleration()
        
        basedNum = calNum * accRecord.accContents[selectedIndex].ratio
        
        for i in 0...(accRecord.accContents.count - 1)
        {
            let calValue = basedNum / accRecord.accContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: accRecord.accContents[i].longDescription, symbolName: accRecord.accContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }

    func concentration() -> [UnitStruct]
    {
        let concentrationRecord = Concentration()
        
        basedNum = calNum * concentrationRecord.concentrationContents[selectedIndex].ratio
        
        for i in 0...(concentrationRecord.concentrationContents.count - 1)
        {
            let calValue = basedNum / concentrationRecord.concentrationContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: concentrationRecord.concentrationContents[i].longDescription, symbolName: concentrationRecord.concentrationContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }
    
    func dispersion() -> [UnitStruct]
    {
        let dispersionRecord = Dispersion()
        
        basedNum = calNum * dispersionRecord.dispersionContents[selectedIndex].ratio
        
        for i in 0...(dispersionRecord.dispersionContents.count - 1)
        {
            let calValue = basedNum / dispersionRecord.dispersionContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: dispersionRecord.dispersionContents[i].longDescription, symbolName: dispersionRecord.dispersionContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }
    
    func duration() -> [UnitStruct]
    {
        let durationRecord = Duration()
        
        basedNum = calNum * durationRecord.durationContents[selectedIndex].ratio
        
        for i in 0...(durationRecord.durationContents.count - 1)
        {
            let calValue = basedNum / durationRecord.durationContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: durationRecord.durationContents[i].longDescription, symbolName: durationRecord.durationContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }
    
    func charge() -> [UnitStruct]
    {
        let chargeRecord = Charge()
        
        basedNum = calNum * chargeRecord.chargeContents[selectedIndex].ratio
        
        for i in 0...(chargeRecord.chargeContents.count - 1)
        {
            let calValue = basedNum / chargeRecord.chargeContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: chargeRecord.chargeContents[i].longDescription, symbolName: chargeRecord.chargeContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }
    
    func current() -> [UnitStruct]
    {
        let currentRecord = Current()
        
        basedNum = calNum * currentRecord.currentContents[selectedIndex].ratio
        
        for i in 0...(currentRecord.currentContents.count - 1)
        {
            let calValue = basedNum / currentRecord.currentContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: currentRecord.currentContents[i].longDescription, symbolName: currentRecord.currentContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }
    
    func voltage() -> [UnitStruct]
    {
        let voltageRecord = Voltage()
        
        basedNum = calNum * voltageRecord.voltageContents[selectedIndex].ratio
        
        for i in 0...(voltageRecord.voltageContents.count - 1)
        {
            let calValue = basedNum / voltageRecord.voltageContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: voltageRecord.voltageContents[i].longDescription, symbolName: voltageRecord.voltageContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }
    
    func resistance() -> [UnitStruct]
    {
        let resistanceRecord = Resistance()
        
        basedNum = calNum * resistanceRecord.resistanceContents[selectedIndex].ratio
        
        for i in 0...(resistanceRecord.resistanceContents.count - 1)
        {
            let calValue = basedNum / resistanceRecord.resistanceContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: resistanceRecord.resistanceContents[i].longDescription, symbolName: resistanceRecord.resistanceContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }
    
    func energy() -> [UnitStruct]
    {
        let energyRecord = Energy()
        
        basedNum = calNum * energyRecord.energyContents[selectedIndex].ratio
        
        for i in 0...(energyRecord.energyContents.count - 1)
        {
            let calValue = basedNum / energyRecord.energyContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: energyRecord.energyContents[i].longDescription, symbolName: energyRecord.energyContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }

    func frequency() -> [UnitStruct]
    {
        let frequencyRecord = Frequency()
        
        basedNum = calNum * frequencyRecord.frequencyContents[selectedIndex].ratio
        
        for i in 0...(frequencyRecord.frequencyContents.count - 1)
        {
            let calValue = basedNum / frequencyRecord.frequencyContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: frequencyRecord.frequencyContents[i].longDescription, symbolName: frequencyRecord.frequencyContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }

    func power() -> [UnitStruct]
    {
        let powerRecord = Power()
        
        basedNum = calNum * powerRecord.powerContents[selectedIndex].ratio
        
        for i in 0...(powerRecord.powerContents.count - 1)
        {
            let calValue = basedNum / powerRecord.powerContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: powerRecord.powerContents[i].longDescription, symbolName: powerRecord.powerContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }
    
    func pressure() -> [UnitStruct]
    {
        let pressureRecord = Pressure()
        
        basedNum = calNum * pressureRecord.pressureContents[selectedIndex].ratio
        
        for i in 0...(pressureRecord.pressureContents.count - 1)
        {
            let calValue = basedNum / pressureRecord.pressureContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: pressureRecord.pressureContents[i].longDescription, symbolName: pressureRecord.pressureContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }

    func speed() -> [UnitStruct]
    {
        let speedRecord = Speed()
        
        basedNum = calNum * speedRecord.speedContents[selectedIndex].ratio
        
        for i in 0...(speedRecord.speedContents.count - 1)
        {
            let calValue = basedNum / speedRecord.speedContents[i].ratio
            
            let basicUnit:UnitStruct = UnitStruct(fullName: speedRecord.speedContents[i].longDescription, symbolName: speedRecord.speedContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }
    //below function(temperature is different from the functions above
    func temperature() -> [UnitStruct]
    {
        let temperatureRecord = Temperature()
        
        basedNum = (calNum * temperatureRecord.temperatureContents[selectedIndex].ratio) + temperatureRecord.temperatureContents[selectedIndex].constant
        
        for i in 0...(temperatureRecord.temperatureContents.count - 1)
        {
            let calValue = (basedNum  - temperatureRecord.temperatureContents[i].constant) * (1/temperatureRecord.temperatureContents[i].ratio)
            
            let basicUnit:UnitStruct = UnitStruct(fullName: temperatureRecord.temperatureContents[i].longDescription, symbolName: temperatureRecord.temperatureContents[i].shortDescription, inputValue: calNum, outputValue: String(calValue))
            
            basicUnits.append(basicUnit)
        }
        return basicUnits
    }

}
