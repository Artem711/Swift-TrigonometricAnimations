//
//  TapbarAnimationView.swift
//  ActivityApp
//
//  Created by Артём Мошнин on 20/2/21.
//

import SwiftUI
import PureSwiftUI

private let buttonBlue = Color(red: 42/255, green: 99/255, blue: 228/255)
private typealias TitleAndSymbol = (title: String, symbol: SFSymbolName)

private let buttons: [[TitleAndSymbol]] = [
    [("Favorite", .star), ("Tag", .tag), ("Share", .square_and_arrow_up)],
    [("Comment", .text_bubble), ("Delete", .trash)]
]

struct TapbarAnimationView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
            VStack(spacing: 60) {
                Spacer() //: SPACER
                ForEach(0..<buttons.count) { rowIndex in
                    HStack(spacing: 60) {
                        ForEach(0..<buttons[rowIndex].count) { columnIndex in
                            TapbarButton(data: buttons[rowIndex][columnIndex])
                        }
                    }
                }
                Circle() //: CIRCLE
                    .fill(buttonBlue)
                    .overlay(SFSymbol(.plus).foregroundColor(.white))
                    .frame(48)
            } //: VSTACK
            .padding()
        } //: ZSTACK
        .edgesIgnoringSafeArea(.all)
    }
    
    private struct TapbarButton: View {
        var data: TitleAndSymbol
        
        var body: some View {
            Circle() //: CIRCLE
                .fill(Color.white)
                .overlay(SFSymbol(data.symbol))
                .overlay(CaptionText(data.title.uppercased(), .white, .semibold).fixedSize().yOffset(40))
                .frame(50)
        }
    }
}

struct TapbarAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TapbarAnimationView()
    }
}

 
