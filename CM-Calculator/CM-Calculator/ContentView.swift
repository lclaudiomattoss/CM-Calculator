//
//  ContentView.swift
//  CM-Calculator
//
//  Created by Luiz Claudio Mattos da Silva on 29/01/24.
//

import SwiftUI

struct CalculatorView: View {
    // Variáveis para armazenar os valores e operações
    @State private var input = "0"
    @State private var currentNumber = 0.0
    @State private var previousNumber = 0.0
    @State private var selectedOperation: Operation?

    enum Operation {
        case add, subtract, multiply, divide
    }

    var body: some View {
        VStack(spacing: 10) {
            Text(input)
                .font(.largeTitle)
                .padding()

            HStack(spacing: 10) {
                CalculatorButton(title: "1") { self.numberPressed(1) }
                CalculatorButton(title: "2") { self.numberPressed(2) }
                CalculatorButton(title: "3") { self.numberPressed(3) }
                CalculatorButton(title: "+", color: .orange) { self.operationPressed(.add) }
            }

            HStack(spacing: 10) {
                CalculatorButton(title: "4") { self.numberPressed(4) }
                CalculatorButton(title: "5") { self.numberPressed(5) }
                CalculatorButton(title: "6") { self.numberPressed(6) }
                CalculatorButton(title: "-", color: .orange) { self.operationPressed(.subtract) }
            }

            HStack(spacing: 10) {
                CalculatorButton(title: "7") { self.numberPressed(7) }
                CalculatorButton(title: "8") { self.numberPressed(8) }
                CalculatorButton(title: "9") { self.numberPressed(9) }
                CalculatorButton(title: "×", color: .orange) { self.operationPressed(.multiply) }
            }

            HStack(spacing: 10) {
                CalculatorButton(title: "C", color: .red) { self.clear() }
                CalculatorButton(title: "0") { self.numberPressed(0) }
                CalculatorButton(title: "=") { self.calculate() }
                CalculatorButton(title: "÷", color: .orange) { self.operationPressed(.divide) }
            }
        }
        .padding()
    }

    func numberPressed(_ number: Int) {
        if input == "0" {
            input = "\(number)"
        } else {
            input += "\(number)"
        }
    }

    func operationPressed(_ operation: Operation) {
        if let currentInput = Double(input) {
            currentNumber = currentInput
            input = "0"
            selectedOperation = operation
        }
    }

    func clear() {
        input = "0"
        currentNumber = 0
        previousNumber = 0
        selectedOperation = nil
    }

    func calculate() {
        if let currentInput = Double(input) {
            switch selectedOperation {
            case .add:
                currentNumber += currentInput
            case .subtract:
                currentNumber -= currentInput
            case .multiply:
                currentNumber *= currentInput
            case .divide:
                if currentInput != 0 {
                    currentNumber /= currentInput
                } else {
                    // Tratar a divisão por zero, se necessário
                    // Pode exibir uma mensagem de erro ou lidar de outra forma
                }
            case nil:
                // Nenhuma operação selecionada
                break
            }

            input = "\(currentNumber)"
            selectedOperation = nil
        }
    }
}

struct CalculatorButton: View {
    var title: String
    var color: Color = .gray
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(color)
                .cornerRadius(40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
