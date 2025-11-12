import Darwin

var state: Bool = true

var firstNumber: Double = 0
var secondNumber: Double = 0

var result: Double = 0

func inputNumbers() {
    let event = state ? "first" : "second"
    print("Input \(event) integer")
    while let input = readLine() {
        if let value = Int(input) {
            let number = Double(value)
            if state {
                state = false
                firstNumber = number
            } else {
                state = true
                secondNumber = number
            }
            break
        } else {
            print("Input error - enter an integer")
            continue
        }
    }
}

print("Welcome to calculator!")

let message: String = "Select operation: +, -, * or /. For exit, enter 'q'. For history, enter 'h'."

var history: [String] = []

while true {
    print(message)
    let operation = readLine() ?? "?"
    if operation == "h" {
        for item in history {
            print(item)
        }
        continue
    }
    switch operation {
    case "+", "-", "*", "/":
        for _ in 0...1 {
            inputNumbers()
        }
        if operation == "+" {
            result = firstNumber + secondNumber
        } else if operation == "-" {
            result = firstNumber - secondNumber
        } else if operation == "*" {
            result = firstNumber * secondNumber
        } else if operation == "/" {
            if secondNumber != 0 {
                result = firstNumber / secondNumber
            } else {
                print("Zero division error")
                print("\n-----------------------------------------------------------\n")
                continue
            }
        }
        history.append("\(firstNumber) \(operation) \(secondNumber)" + " = " + String(result))
    case "q":
        exit(0)
    default:
        print("Input error - input should be one of: +, -, *, /")
        print("\n-----------------------------------------------------------\n")
        continue
    }

    print("Calculating: \(firstNumber) \(operation) \(secondNumber)")
    print("Result: \(result)")
    
    print("\n-----------------------------------------------------------\n")
}
