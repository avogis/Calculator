//
//  InterfaceController.swift
//  Calculator WatchKit Extension
//
//  Created by Elizaveta Sigova on 26/02/16.
//  Copyright © 2016 Elizaveta Sigova. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var currentValue = "0"
    var calculationExecuted = false
    var command: Comamnd?
    
    @IBOutlet var displayLabel: WKInterfaceLabel!
    
    func numberPressed(value: Int)
    {
        let newValue = "\(value)"
        
        if currentValue == "0" || calculationExecuted
        {
            calculationExecuted=false
            currentValue = newValue
        }
        else
        {
            currentValue += newValue
        }
        displayLabel.setText(currentValue)
    }
    
    func commandTapped(type: CommandType)
    {
        calculationExecuted = false
        if command != nil
        {
            command!.type = type
        }
        else
        {
            command = Comamnd(type: type, oldValue: (currentValue as NSString).doubleValue)
            currentValue = "0"
        }
    }
    
    func setDisplayValue(value: Double)
    {
        if value % 1 == 0
        {
            currentValue = "\(Int(value))"
        }
        else
        {
            currentValue = "\(value)"
        }
        
        displayLabel.setText(currentValue)
    }

    @IBAction func buttonCancelTapped() {
        command = nil
        currentValue = "0"
        displayLabel.setText(currentValue)
    }

    @IBAction func buttonPlustapped() {
        commandTapped(.Add)
    }
    @IBAction func buttonEqualTapped() {
        if command != nil
        {
            let answer = command!.executeWithNewValue((currentValue as NSString).doubleValue)
            setDisplayValue(answer)
            command = nil
            calculationExecuted = true
        }
    }
    @IBAction func buttonComatapped() {
        if currentValue.rangeOfString(".")==nil
        {
            currentValue += "."
            displayLabel.setText(currentValue)
        }
    }
    @IBAction func button0tapped() {
        numberPressed(0)
    }
    @IBAction func buttonMinustapped() {
        commandTapped(.Subtract)
    }
    @IBAction func button7Tapped() {
        numberPressed(7)
    }
    @IBAction func button8tapped() {
        numberPressed(8)
    }
    @IBAction func button9tapped() {
        numberPressed(9)
    }
    @IBAction func buttonDivideTapped() {
        commandTapped(.Divide)
    }
    @IBAction func button4tapped() {
        numberPressed(4)
    }
    @IBAction func button5tapped() {
        numberPressed(5)
    }
    @IBAction func button6tapped() {
        numberPressed(6)
    }
    @IBAction func buttonMultitapped() {
        commandTapped(.Multiply)
    }
    @IBAction func button1tapped() {
        numberPressed(1)
    }
    @IBAction func button2tapped() {
        numberPressed(2)
    }
    @IBAction func button3tapped() {
        numberPressed(3)
    }
}
