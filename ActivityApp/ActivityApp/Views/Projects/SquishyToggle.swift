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
private let frameLayoutConfig = LayoutGuideConfig.grid(columns: [0.25, 0.4, 0.6, 0.75], rows: 2)

struct SquishyToggle: View {
    var body: some View {
        let debug = true
        
        GeometryReader(content: { geometry in
            let size = calculateSize(from: geometry)
            ZStack {
                ToggleFrame(debug: debug)
                    .styling(color: .green)
                    .layoutGuide(frameLayoutConfig, color: .green, lineWidth: 2)
            } //: ZSTACK
            .frame(size) // .frame(width: size.width, height: size.height)
            .borderIf(debug, Color.gray.opacity(0.2))
            .greedyFrame() // .frame(width: .infinity, height: .infinity)
        }) //: GEOMETRY_READER
        .showLayoutGuides(true)
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
        var g = frameLayoutConfig.layout(in: rect)
        
        let curveYOffset = rect.heightScaled(0.18)
        let arcRadius = rect.height / 2
        path.move(g[0, 0])
        
        path.curve(rect.top.yOffset(curveYOffset), cp1: g[1, 0], cp2: g[1, 0].yOffset(curveYOffset), showControlPoints: debug)
        path.curve(g[3, 0], cp1: g[2, 0].yOffset(curveYOffset), cp2: g[2, 0], showControlPoints: debug)
        path.arc(g[3, 1], radius: arcRadius, startAngle: .top, endAngle: .bottom)
        
        path.curve(rect.bottom.yOffset(-curveYOffset), cp1: g[2, 2], cp2: g[2, 2].yOffset(-curveYOffset), showControlPoints: debug)
        path.curve(g[0, 2], cp1: g[1, 2].yOffset(-curveYOffset), cp2: g[1, 2], showControlPoints: debug)
        path.arc(g[0, 1], radius: arcRadius, startAngle: .bottom, endAngle: .top)
        
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
//
//let curveYOffset = rect.heightScaled(0.18)
//let arcRadius = rect.halfHeight
//path.move(g[0, 0])
//path.curve(
//    rect.top.yOffset(curveYOffset),
//    cp1: g[1, 0],
//    cp2: g[1, 0].yOffset(curveYOffset),
//    showControlPoints: debug)
//
//path.curve(
//    g[3, 0],
//    cp1: g[2, 0].yOffset(curveYOffset),
//    cp2: g[2, 0],
//    showControlPoints: true)
//
//path.arc(g[3, 1], radius: arcRadius, startAngle: .top, endAngle: .bottom)
//path.curve(
//    rect.bottom.yOffset(-curveYOffset),
//    cp1: g[2, 2],
//    cp2: g[2, 2].yOffset(-curveYOffset),
//    showControlPoints: true)
//
//path.curve(
//    g[0, 2],
//    cp1: g[1, 2].yOffset(-curveYOffset),
//    cp2: g[1, 2],
//    showControlPoints: true)
//
//path.arc(g[0, 1], radius: arcRadius, startAngle: .bottom, endAngle: .top)
