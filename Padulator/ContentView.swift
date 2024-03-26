//
//  ContentView.swift
//  Padulator
//
//  Created by Nate Schaffner on 3/24/24.
//

import SwiftUI

struct keyData {
    var readout: Double = 0.0
    var firstOperand: Double = 0.0
    var secondOperand: Double = 0.0
    var result: Double = 0.0
    var operation: calculatorOperation = .unselected
    var decimalPrecision: Int = -1
    var calulatorOperand: calculatorOperands = .firstOperand
}

struct ContentView: View {
    let fontScale = 120
    @State var calcData: keyData
    var body: some View {
        VStack {
            Text("\(calcData.readout)")
                .font(.system(size: CGFloat(fontScale)))
                .padding()
            HStack {
                CalculatorKey(key: "C", color: .orange, keyInfo: $calcData)
                CalculatorKey(key: "+/-", color: .orange, keyInfo: $calcData)
                CalculatorKey(key: "%", color: .orange, keyInfo: $calcData)
                CalculatorKey(key: "AC", color: .orange, keyInfo: $calcData)
            }
            HStack {
                CalculatorKey(key: "7", color: .gray, keyInfo: $calcData)
                CalculatorKey(key: "8", color: .gray, keyInfo: $calcData)
                CalculatorKey(key: "9", color: .gray, keyInfo: $calcData)
                CalculatorKey(key: "/", color: .orange, keyInfo: $calcData)
            }
            HStack {
                CalculatorKey(key: "4", color: .gray, keyInfo: $calcData)
                CalculatorKey(key: "5", color: .gray, keyInfo: $calcData)
                CalculatorKey(key: "6", color: .gray, keyInfo: $calcData)
                CalculatorKey(key: "X", color: .orange, keyInfo: $calcData)
            }
            HStack {
                CalculatorKey(key: "1", color: .gray, keyInfo: $calcData)
                CalculatorKey(key: "2", color: .gray, keyInfo: $calcData)
                CalculatorKey(key: "3", color: .gray, keyInfo: $calcData)
                CalculatorKey(key: "-", color: .orange, keyInfo: $calcData)
            }
            HStack {
                CalculatorKey(key: "0", color: .gray, keyInfo: $calcData)
                CalculatorKey(key: ".", color: .gray, keyInfo: $calcData)
                CalculatorKey(key: "=", color: .orange, keyInfo: $calcData)
                CalculatorKey(key: "+", color: .orange, keyInfo: $calcData)
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
    @Binding var keyInfo: keyData

    var body: some View {
        Button(action: {
            print("Button pressed")
            switch key {
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
                if keyInfo.decimalPrecision == -1 {
                    keyInfo.readout = (keyInfo.readout * 10) + Double(key)!
                }
                else{
                    keyInfo.readout = keyInfo.readout + ( Double(key)! / (10*Double(keyInfo.decimalPrecision)))
                    keyInfo.decimalPrecision = keyInfo.decimalPrecision + 1
                }
            case "+":
                keyInfo.calulatorOperand = .secondOperand
                keyInfo.firstOperand = Double(keyInfo.readout)
                keyInfo.readout = 0.0
                keyInfo.decimalPrecision = -1
                keyInfo.operation = .addition
            case "-":
                keyInfo.calulatorOperand = .secondOperand
                keyInfo.firstOperand = Double(keyInfo.readout)
                keyInfo.readout = 0.0
                keyInfo.decimalPrecision = -1
                keyInfo.operation = .subtraction
            case "X":
                keyInfo.calulatorOperand = .secondOperand
                keyInfo.firstOperand = Double(keyInfo.readout)
                keyInfo.readout = 0.0
                keyInfo.decimalPrecision = -1
                keyInfo.operation = .multiplication
            case "/":
                keyInfo.calulatorOperand = .secondOperand
                keyInfo.firstOperand = Double(keyInfo.readout)
                keyInfo.readout = 0.0
                keyInfo.decimalPrecision = -1
                keyInfo.operation = .division
            case "=":
                keyInfo.calulatorOperand = .firstOperand
                keyInfo.secondOperand = Double(keyInfo.readout)
                switch keyInfo.operation {
                case .addition:
                    keyInfo.result = keyInfo.firstOperand + keyInfo.secondOperand
                case .subtraction:
                    keyInfo.result = keyInfo.firstOperand - keyInfo.secondOperand
                case .multiplication:
                    keyInfo.result = keyInfo.firstOperand * keyInfo.secondOperand
                case .division:
                    keyInfo.result = keyInfo.firstOperand / (keyInfo.secondOperand == 0.0 ? 0.0001 : keyInfo.secondOperand)
                case .unselected:
                    keyInfo.result = 0.0
                }
                keyInfo.readout = keyInfo.result
                keyInfo.firstOperand = 0.0
                keyInfo.secondOperand = 0.0
                keyInfo.result = 0.0
                print("result: \(keyInfo.result)")
            case ".":
                keyInfo.decimalPrecision = 1
                print("decimalPrecision")
            case "AC":
                keyInfo.calulatorOperand = .firstOperand
                keyInfo.firstOperand = 0.0
                keyInfo.secondOperand = 0.0
                keyInfo.result = 0.0
                keyInfo.readout = 0.0
            case "C":
                switch keyInfo.calulatorOperand {
                case .firstOperand:
                    keyInfo.firstOperand = 0.0
                    keyInfo.readout = 0.0
                case .secondOperand:
                    keyInfo.secondOperand = 0.0
                    keyInfo.readout = 0.0
                }
            case "+/-":
                keyInfo.readout = -1 * keyInfo.readout
            case "%":
                keyInfo.readout = keyInfo.readout / 100
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
    ContentView(calcData: keyData())
}
