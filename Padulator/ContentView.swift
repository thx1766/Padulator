//
//  ContentView.swift
//  Padulator
//
//  Created by Nate Schaffner on 3/24/24.
//

import SwiftUI

struct ContentView: View {
    let fontScale = 120
    @State var readout: Double = 0.0
    @State var firstOperand: Double = 0.0
    @State var secondOperand: Double = 0.0
    @State var result: Double = 0.0
    @State var operation: calculatorOperation = .unselected
    @State var decimalPrecision: Int = -1
    @State var calulatorOperand: calculatorOperands = .firstOperand
    var body: some View {
        VStack {
            Text("\(readout)")
                .font(.system(size: CGFloat(fontScale)))
                .padding()
            HStack {
                CalculatorKey(key: "C", color: .orange, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: "+/-", color: .orange, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: "%", color: .orange, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: "AC", color: .orange, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
            }
            HStack {
                CalculatorKey(key: "7", color: .gray, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: "8", color: .gray, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: "9", color: .gray, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: "/", color: .orange, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
            }
            HStack {
                CalculatorKey(key: "4", color: .gray, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: "5", color: .gray, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: "6", color: .gray, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: "X", color: .orange, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
            }
            HStack {
                CalculatorKey(key: "1", color: .gray, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: "2", color: .gray, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: "3", color: .gray, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: "-", color: .orange, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
            }
            HStack {
                CalculatorKey(key: "0", color: .gray, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: ".", color: .gray, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: "=", color: .orange, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
                CalculatorKey(key: "+", color: .orange, readout: $readout, firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, operation: $operation, decimalPrecision: $decimalPrecision, operand: $calulatorOperand)
            }
        }
        //.padding()
    }
}
enum calculatorOperation: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
    case unselected = "?"
}

enum calculatorOperands: String {
    case firstOperand = "1"
    case secondOperand = "2"
}

struct CalculatorKey: View {
    @State var key: String
    @State var color: Color
    @Binding var readout: Double
    @Binding var firstOperand: Double
    @Binding var secondOperand: Double
    @Binding var result: Double
    @Binding var operation: calculatorOperation
    @Binding var decimalPrecision: Int
    @Binding var operand: calculatorOperands
    
    var body: some View {
        Button(action: {
            print("Button pressed")
            switch key {
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
                if decimalPrecision == -1 {
                    readout = (readout * 10) + Double(key)!
                }
                else{
                    readout = readout + ( Double(key)! / (10*Double(decimalPrecision)))
                    decimalPrecision = decimalPrecision + 1
                }
            case "+":
                operand = .secondOperand
                firstOperand = Double(readout)
                readout = 0.0
                decimalPrecision = -1
                operation = .addition
            case "-":
                operand = .secondOperand
                firstOperand = Double(readout)
                readout = 0.0
                decimalPrecision = -1
                operation = .subtraction
            case "X":
                operand = .secondOperand
                firstOperand = Double(readout)
                readout = 0.0
                decimalPrecision = -1
                operation = .multiplication
            case "/":
                operand = .secondOperand
                firstOperand = Double(readout)
                readout = 0.0
                decimalPrecision = -1
                operation = .division
            case "=":
                operand = .firstOperand
                secondOperand = Double(readout)
                switch operation {
                case .addition:
                    result = firstOperand + secondOperand
                case .subtraction:
                    result = firstOperand - secondOperand
                case .multiplication:
                    result = firstOperand * secondOperand
                case .division:
                    result = firstOperand / (secondOperand == 0.0 ? 0.0001 : secondOperand)
                case .unselected:
                    result = 0.0
                }
                readout = result
                firstOperand = 0.0
                secondOperand = 0.0
                result = 0.0
                print("result: \(result)")
            case ".":
                decimalPrecision = 1
                print("decimalPrecision")
            case "AC":
                operand = .firstOperand
                firstOperand = 0.0
                secondOperand = 0.0
                result = 0.0
                readout = 0.0
            case "C":
                switch operand {
                case .firstOperand:
                    firstOperand = 0.0
                    readout = 0.0
                case .secondOperand:
                    secondOperand = 0.0
                    readout = 0.0
                }
            case "+/-":
                readout = -1 * readout
            case "%":
                readout = readout / 100
            default:
                print("oops")
            }
        }) {
            Text("\(key)")
                .font(.system(size: 75))
                .frame(width: 100, height: 100)
                .background(color)
                .cornerRadius(25)
        }
    }
}

#Preview {
    ContentView()
}
