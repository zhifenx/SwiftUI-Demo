//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by zhifenx on 2020/3/4.
//  Copyright © 2020 zhifenx. All rights reserved.
//

import Foundation
import UIKit

enum CalculatorButtonItem {

    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }

    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }

    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}

extension CalculatorButtonItem: Hashable {
    var title: String {
        switch self {
        case .digit(let value): return String(value)
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let command): return command.rawValue
        }
    }

    var size: CGSize {
        let itemSpace: CGFloat = 8
        let interval: CGFloat = 16
        let width: CGFloat = (UIScreen.main.bounds.size.width - interval * 2 - itemSpace * 3) / 4
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: width * 2 + 8, height: width)
        }
        return CGSize(width: width, height: width)
    }

    var backgroundColorName: String {
        switch self {
        case .digit, .dot: return "digitBackground"
        case .op: return "operatorBackground"
        case .command: return "commandBackground"
        }
    }
    
    var foregroundColorName: String {
        switch self {
        case .command:
            return "commandForeground"
        default:
            return "white"
        }
    }
}
