//
//  PartialSheet.swift
//
//  Created by AlelinApps on 9/27/21.
//  License: MIT License

import SwiftUI

struct PartialSheet<Content: View>: View {
    
    var sheetSize: SheetSize
    let content: () -> Content
    
    init(_ sheetSize: SheetSize, @ViewBuilder content: @escaping () -> Content) {
        self.sheetSize = sheetSize
        self.content = content
    }
    
    var body: some View {
        content()
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

