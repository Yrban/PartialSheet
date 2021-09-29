//
//  PartialSheet.swift
//
//  Created by AlelinApps on 9/27/21.
//  License: MIT License

import SwiftUI

struct PartialSheet: ViewModifier {
    
    var sheetSize: SheetSize
    
    init(_ sheetSize: SheetSize) {
        self.sheetSize = sheetSize
    }
    
    func body(content: Content) -> some View {
        content
            .frame(height: sheetHeight())
            .animation(.spring(), value: sheetSize)
    }
    
    private func sheetHeight() -> CGFloat {
        switch sheetSize {
        case .quarter:
            return UIScreen.main.bounds.height / 4
        case .half:
            return UIScreen.main.bounds.height / 2
        case .threeQuarter:
            return UIScreen.main.bounds.height * 3 / 4
        case .full:
            return .infinity
        }
    }
}

enum SheetSize: Equatable {
    case quarter, half, threeQuarter, full
}

extension View {
    func partialSheet(_ sheetSize: SheetSize) -> some View {
        self.modifier(PartialSheet(sheetSize))
    }
}
