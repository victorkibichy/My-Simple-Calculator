//
//  ContentView.swift
//  My Simple Calculator
//
//  Created by  Bouncy Baby on 6/4/24.
//

import SwiftUI
import CoreData
import SwiftUI
enum MyCalculatorButtons: String, Identifiable {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case plus = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "x"
    case percentage = "%"
    case equal = "="
    case clear = "C"
    case decimal = "."
    case negative = "+/-"

    var id: String { self.rawValue }
    var colorButton: Color{
        switch self{
        case .divide, .substract, .multiply, .plus,.equal:
            return .green
        case .clear, .percentage, .negative:
            return .orange
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0,alpha: 1))
                    
        }
    }
}
enum Operations {
    case add, subtract, multiply, divide  ,percentage, none
}

struct ContentView: View {
    @State var value: String = "0" // Change data type to String
    @State var operationNow: Operations = .none
    @State var runningNumber: Double = 0 // Change data type to Double
    let buttons: [[MyCalculatorButtons]] = [
        [.clear, .percentage, .negative, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .substract],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 90))
                        .foregroundColor(.blue)
                }
                .padding()
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12){
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .frame(width: self.buttonWidth(item: item), height: self.buttonheight(item: item))
                                    .background(item.colorButton)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                        .padding(.bottom, 3)
                    }
                }
            }
        }
    }
    
    func didTap(button: MyCalculatorButtons) {
        switch button {
        case .plus, .substract, .multiply, .divide:
            operationNow = getOperation(from: button)
            runningNumber = Double(value) ?? 0
            value = "0"
        case .equal:
        
            let currentValue = Double(value) ?? 0
            switch operationNow {
            case .add: value = "\(runningNumber + currentValue)"
            case .subtract: value = "\(runningNumber - currentValue)"
            case .multiply: value = "\(runningNumber * currentValue)"
            case .divide:
                if currentValue != 0 {
                    value = "\(runningNumber / currentValue)"
                } else {
                    value = "Error"
                }
            default: break
            }
            operationNow = .none
        case .clear:
            value = "0"
            operationNow = .none
            runningNumber = 0
        case .decimal:
        
            if !value.contains(".") {
                value += "."
            }
        case .negative:
            
            if value != "0" {
                if value.hasPrefix("-") {
                    value.removeFirst()
                } else {
                    value = "-" + value
                }
            }
        case .percentage:
            
            let currentValue = Double(value) ?? 0
            value = "\(currentValue / 100)"
        default:
            
            if value == "0" {
                value = button.rawValue
            } else {
                value += button.rawValue
            }
        }
    }
    
    func buttonWidth(item: MyCalculatorButtons) -> CGFloat {
        if item == .equal{
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonheight(item: MyCalculatorButtons) -> CGFloat {
        return (UIScreen.main.bounds.width  - (5 * 12)) / 4
    }
    
    func getOperation(from button: MyCalculatorButtons) -> Operations {
        switch button {
        case .plus: return .add
        case .substract: return .subtract
        case .multiply: return .multiply
        case .divide: return .divide
        default: return .none
        }
    }
}

    
    struct ContentView_Preview: PreviewProvider{
        static var previews: some View{
            ContentView()
        }
    }



