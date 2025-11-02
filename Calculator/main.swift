//
//  main.swift
//  Calculator
//
//  Created by Борис Ирышков on 02.11.2025.
//

import Foundation

print("Welcome to calculator!\nSelect operation: +, -, * or /")

var operation: String? = readLine()

switch operation {
case "+", "-", "*", "/": break
case nil:
    print("Unknown operation")
    exit(0)
default:
    print("Input error - input should be one of: +, -, *, /")
}

print("Input first integer")

var firstNumber: Int?

if let input = readLine(), let value = Int(input) {
    firstNumber = value
} else {
    print("Input error - enter an integer")
    exit(0)
}

print("Input second integer")

var secondNumber: Int?

if let input = readLine(), let value = Int(input) {
    secondNumber = value
    if operation == "/" && value == 0 {
        print("Zero division error")
        exit(0)
    }
} else {
    print("Input error - enter an integer")
    exit(0)
}

print("Calculating: \(firstNumber!) \(operation!) \(secondNumber!)")

let result: Int

switch operation {
case "+": result = firstNumber! + secondNumber!
case "-": result = firstNumber! - secondNumber!
case "*": result = firstNumber! * secondNumber!
case "/": result = firstNumber! / secondNumber!
default :
    print("Unknown operation")
    exit(0)
}

print("Result: \(result)")
