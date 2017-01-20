//
//  Calculation.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2016/12/20.
//  Copyright © 2016年 Jerry Chen. All rights reserved.
//

import Foundation


class Calculator
{
    var infix:[String] = []
    var postfix:[String] = []
    var stack:[String] = []
    
    init(infix:[String]) {
        self.infix = infix
        
        print(self.postfix)
    }
    
    func toPostfix() -> [String]
    {
        for op1:String in infix
        {
            switch op1 {
            case "(":
                stack.append(op1)
            case "÷","x","-","+":
                while !stack.isEmpty && priority(inputString: stack.last!) >= priority(inputString: op1){
                    postfix.append(stack.last!)
                    stack.removeLast()
                }
                stack.append(op1)
            case ")":
                while stack.last != "(" {
                    postfix.append(stack.popLast()!)
                }
                if stack.last == "("{stack.removeLast()}
            default:
                postfix.append(op1)
            }
        }
        
        while !stack.isEmpty {
            postfix.append(stack.popLast()!)
        }
        return postfix
    }
    
    private func priority(inputString:String) -> Int
    {
        var returnValue:Int = 0
        
        inputString == "-" || inputString == "+" ? returnValue = 1 : (inputString == "÷" || inputString == "x" ? (returnValue = 2) : (returnValue = 0))
        
        return returnValue
    }
    
}
