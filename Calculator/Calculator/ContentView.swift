//
//  ContentView.swift
//  Calculator
//
//  Created by zhifenx on 2019/11/13.
//  Copyright © 2019 zhifenx. All rights reserved.
//

import SwiftUI

struct CalculatorButton : View {

    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let foregroundColorName: String
    let action: () -> Void

    var body: some View {
        return Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(Color(foregroundColorName))
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2)
            
            //第2章 练习-3 用 ZStack，Circle 和 Text 重新绘制 CalculatorButton
//            ZStack {
//                Circle()
//                    .frame(width: size.width, height: size.height)
//                    .foregroundColor(Color(backgroundColorName))
//                    .background(Color(backgroundColorName))
//                    .cornerRadius(size.width / 2)
//                Text(title)
//                    .font(.system(size: fontSize))
//                    .foregroundColor(Color(foregroundColorName))
//            }
            
        }
    }
}

struct CalculatorButtonRow : View {
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                    title: item.title,
                    size: item.size,
                    backgroundColorName: item.backgroundColorName, foregroundColorName: item.foregroundColorName)
                {
                    print("Button: \(item.title)")
                }
            }
        }
    }
}

struct CalculatorButtonPad: View {
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip),
         .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]

    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("0")
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            CalculatorButtonPad()
                .padding(.bottom)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().previewDevice("iPhone SE")
        }
    }
}
#endif
