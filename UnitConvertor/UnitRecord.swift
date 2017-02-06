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
    var basicUnit:[UnitStruct]!
    
    func distance(inputValue:String) -> [UnitStruct]
    {
        basicUnit =
        [
            UnitStruct(name: "millimeter", value: inputValue, ratio: 1),
            UnitStruct(name: "centimeter", value: inputValue, ratio: 10),
            UnitStruct(name: "decimeter", value: inputValue, ratio: 100),
            UnitStruct(name: "meter", value: inputValue, ratio: 1000),
            UnitStruct(name: "kilometer", value: inputValue, ratio: 1000000)
        ]
       
//        let inputUnit = UnitLength
//        
//        let distance = Measurement(value: inputValue, unit: UnitLength.kilometers)
//        
        
        return basicUnit
    }
}
