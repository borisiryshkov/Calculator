//
//  main.swift
//  Calculator
//
//  Created by Борис Ирышков on 02.11.2025.
//

import Foundation

var state: Bool = true

var firstNumber: Double = 0
var secondNumber: Double = 0

var result: Double = 0

func numbersInput() -> Void {
    let event = state ? "first" : "second"
    print("Input \(event) integer")
    if let input = readLine(), let value = Int(input) {
        if operation == "/" && value == 0 && state == false {
            print("Zero division error")
            exit(0)
        }
        let number = Double(value)
        if state {
            state = false
            firstNumber = number
        } else {
            secondNumber = number
        }
    } else {
        print("Input error - enter an integer")
        exit(0)
    }
}

print("Welcome to calculator!\nSelect operation: +, -, * or /")

let operation = readLine() ?? "?"

switch operation {
case "+", "-", "*", "/":
    numbersInput()
    numbersInput()
    if operation == "+" {
        result = firstNumber + secondNumber
    } else if operation == "-" {
        result = firstNumber - secondNumber
    } else if operation == "*" {
        result = firstNumber * secondNumber
    } else if operation == "/" {
        result = firstNumber / secondNumber
    } else {
        exit(0)
    }
default:
    print("Input error - input should be one of: +, -, *, /")
    exit(0)
}

print("Calculating: \(firstNumber) \(operation) \(secondNumber)")
print("Result: \(result)")
