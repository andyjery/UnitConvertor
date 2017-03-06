//
//  UnitStruct.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2017/2/6.
//  Copyright © 2017年 Jerry Chen. All rights reserved.
//

import Foundation

 class UnitStruct
{
    var fullName = ""
    var symbolName = ""
    var inputValue:Double
    var outputValue:String
    
    init(fullName:String, symbolName:String, inputValue:Double, outputValue:String) {
        self.fullName = fullName
        self.symbolName = symbolName
        self.inputValue = inputValue
        self.outputValue = outputValue
    }
}
