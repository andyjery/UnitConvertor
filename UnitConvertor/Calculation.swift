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
    
    private func simpleCal(op:String, num1: String, num2:String) -> String
    {
        var earlyAnswer:Double = 0
        switch op {
            case "-":
                earlyAnswer = Double(num1)! - Double(num2)!
            case "+":
                earlyAnswer = Double(num1)! + Double(num2)!
            case "÷":
                earlyAnswer = Double(num1)! / Double(num2)!
            case "x":
                earlyAnswer = Double(num1)! * Double(num2)!
            default:break
        }
        return String(earlyAnswer)
    }
    
    func getAnswer() -> String
    {
        var numbers:[String] = []
        var returnAnswer:String!
        
        var equationItems = self.toPostfix()
        while !equationItems.isEmpty
        {
            switch equationItems[0] {
                case "÷","x","-","+":
                    if numbers.count >= 2
                    {
                        numbers[numbers.count - 2] = simpleCal(op: equationItems[0], num1: numbers[numbers.count - 2], num2: numbers[numbers.count - 1])
                        numbers.removeLast()
                        equationItems.removeFirst()
                    }else if numbers.count < 2{
                        equationItems.removeAll()
                    }
                case "(":
                    equationItems.removeAll()
                default:
                    numbers.append(equationItems[0])
                    equationItems.removeFirst()
                }
        }
        
        numbers.isEmpty ? (returnAnswer = "0") : (returnAnswer = numbers[0])
        return returnAnswer
    }
}
