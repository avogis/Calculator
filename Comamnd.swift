//
//  Comamnd.swift
//  Calculator
//
//  Created by Elizaveta Sigova on 26/02/16.
//  Copyright © 2016 Elizaveta Sigova. All rights reserved.
//

import WatchKit

enum CommandType
{
    case Divide
    case Multiply
    case Subtract
    case Add
}

class Comamnd: NSObject {
    var type: CommandType
    let oldValue: Double
    
    init(type: CommandType, oldValue: Double)
    {
        self.type = type
        self.oldValue = oldValue
        super.init()
    }
    
    func executeWithNewValue(newValue: Double)->Double
    {
        var result = oldValue
        switch type
        {
        case .Divide: result /= newValue
        case .Multiply: result *= newValue
        case .Subtract: result += newValue
        case .Add: result += newValue
        }
        
        return result
    }
}
