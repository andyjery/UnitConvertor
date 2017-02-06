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
    var name = ""
    var value = ""
    var ratio:Double
    
    init(name:String, value:String, ratio:Double) {
        self.name = name
        self.value = value
        self.ratio = ratio
        
    }
}
