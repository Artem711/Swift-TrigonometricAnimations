//
//  SquishyToggle.swift
//  ActivityApp
//
//  Created by Артём Мошнин on 21/2/21.
//

import SwiftUI
import PureSwiftUI

// MARK: - Constants

// MARK: - Layout Guides

struct SquishyToggle: View {
    var body: some View {
        let debug = true
        GeometryReader(content: { geometry in
            let size = calculateSize(from: geometry)
            ZStack {
                ToggleFrame(debug: debug)
                    .styling(color: .green)
            } //: ZSTACK
            .frame(size) // .frame(width: size.width, height: size.height)
            .borderIf(debug, Color.gray.opacity(0.2))
            .greedyFrame() // .frame(width: .infinity, height: .infinity)
        })
    }
    
    // MARK: - Calculate size of the shape (we want (WIDTH) = (2 x HEIGHT))
    private func calculateSize(from geo: GeometryProxy) -> CGSize {
        let doubleHeight = geo.heightScaled(2)
        if geo.width < doubleHeight {
            return CGSize(width: geo.width, height: geo.halfWidth)
        } else {
            return CGSize(width: doubleHeight, height: geo.height)
        }
    }
}

private struct ToggleFrame: Shape {
    private let debug: Bool
    
    init(debug: Bool = false) {
        self.debug = debug
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        return path
    }
    
    @ViewBuilder func styling(color: Color) -> some View {
        if self.debug {
            strokeColor(.black, lineWidth: 2)
        } else {
            fill(color)
        }
    }
}

struct SquishyToggle_Previews: PreviewProvider {
    static var previews: some View {
        SquishyToggle()
            .frame(400)
    }
}
