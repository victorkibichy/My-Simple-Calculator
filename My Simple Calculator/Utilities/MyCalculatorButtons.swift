//
//  MyCalculatorButtons.swift
//  My Simple Calculator
//
//  Created by  Bouncy Baby on 6/4/24.
//

import Foundation

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
        case .divide, .substract, .multiply, .plus:
            return .red
        case .clear, .percentage, .negative:
            return .teal
        case .equal:
            return .green
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0,alpha: 1))
                    
        }
    }
}
