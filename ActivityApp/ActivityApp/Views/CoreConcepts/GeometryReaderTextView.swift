//
//  GeometryReaderTextView.swift
//  ActivityApp
//
//  Created by Артём Мошнин on 20/2/21.
//

import SwiftUI

private let size: CGFloat = 200
private let gradient = LinearGradient([Color.red, Color.yellow], to: .bottomTrailing)

struct GeometryReaderTextView: View {
    @State private var text = "Hello"
    @State private var textSize: CGSize = .zero
    @State private var newText = ""
    
    var body: some View {
        VStack {
                UnderlinedText(text + "" + newText, font: .title)
                TextField("Append something...", text: $newText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding(26)
        } //: VSTACK
        .greedyFrame()
        .background(gradient)
        .edgesIgnoringSafeArea(.all)
    }
}

private struct UnderlinedText: View {
    private let text: String
    private let font: Font
    private let padding: CGFloat
    @State private var textSize: CGSize = .zero
    
    init(_ text: String, font: Font, padding: CGFloat = 20) {
        self.text = text
        self.font = font
        self.padding = padding * 2
    }
    
    var body: some View {
        ZStack {
            Text(self.text)
                .font(self.font)
                .fixedSize()
                .background(GeometryReader(content: { geo in
                    Color.clear.onAppear() { self.textSize = geo.size }.id(self.text)
            }))
            Color.black.frame(textSize.width, 2)
                .yOffset(textSize.height / 2)
        } //: ZSTACK
        .frame(width: textSize.width + padding, height: textSize.height + padding)
        .background(Color.white.cornerRadius(10).shadow(5))
        .blendMode(.darken)
    }
}

struct GeometryReaderTextView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderTextView()
    }
}
