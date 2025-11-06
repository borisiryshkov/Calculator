//
//  main.swift
//  Calculator
//
//  Created by Борис Ирышков on 02.11.2025.
//

import Foundation

var count: Int = 0

func numbersInputText() -> String {
    let event = count == 0 ? "first" : "second"
    count += 1
    return "Input \(event) integer"
}

print("Welcome to calculator!\nSelect operation: +, -, * or /")

let operation = readLine()

switch operation {
case "+", "-", "*", "/": break
case nil:
    print("Unknown operation")
    exit(0)
default:
    print("Input error - input should be one of: +, -, *, /")
    exit(0)
}

print(numbersInputText())

let firstNumber: Double

if let input = readLine(), let value = Int(input) {
    firstNumber = Double(value)
} else {
    print("Input error - enter an integer")
    exit(0)
}

print(numbersInputText())

let secondNumber: Double

if let input = readLine(), let value = Int(input) {
    secondNumber = Double(value)
    if operation == "/" && secondNumber == 0 {
        print("Zero division error")
        exit(0)
    }
} else {
    print("Input error - enter an integer")
    exit(0)
}

print("Calculating: \(firstNumber) \(operation ?? "?") \(secondNumber)")

let result: Double

switch operation {
case "+": result = firstNumber + secondNumber
case "-": result = firstNumber - secondNumber
case "*": result = firstNumber * secondNumber
case "/": result = firstNumber / secondNumber
default :
    print("Unknown operation")
    exit(0)
}

print("Result: \(result)")
