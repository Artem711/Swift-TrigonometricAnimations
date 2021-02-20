//
//  SettingsIconView.swift
//  ActivityApp
//
//  Created by Артём Мошнин on 20/2/21.
//

import SwiftUI
import PureSwiftUI

private let startColor = Color.rgb8(228, 229, 231)
private let endColor = Color.rgb8(139, 143, 150)

private let gradient = LinearGradient([startColor, endColor], angle: .bottom)

private let numTeeth = 54
private let segmentsPerTooth = 20
private let numSegments = numTeeth * segmentsPerTooth

private let teethLayoutConfig = LayoutGuideConfig.polar(rings: [0.885, 1], segments: numSegments)

struct SettingsIconView: View {
    var body: some View {
        let debug = false
        let primaryCogScale: CGFloat = 0.8
        
        ZStack {
            Shroud()
                .iconStyle(debug: debug)

            Cog(scale: primaryCogScale)
                .iconStyle(debug: debug)
                // .layoutGuide(teethLayoutConfig.scaled(primaryCogScale), color: .green)
            
        } // ZSTACK
        .frame(400)
    }
}

private extension Shape {
    @ViewBuilder func iconStyle(debug: Bool = false) -> some View {
        if debug {
            stroke(Color.orange, style: .init(lineWidth: 1, lineCap: .round, lineJoin: .round))
        } else { fill(gradient, style: .init(eoFill: true)) }
    }
}

private struct Shroud: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.roundedRect(rect, cornerRadius: rect.widthScaled(0.122))
        path.circle(rect.center, diameter: rect.widthScaled(0.87))
        
        return path
    }
}

private struct Cog: Shape {
    var scale: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        var pt = teethLayoutConfig.scaled(scale).layout(in: rect)
        
        let rotationDelta = pt.angleTo(0, segmentsPerTooth)
        pt = pt.rotated(-pt.angleTo(1, 5))
        path.move(pt[0, 0])
        
        for tooth in 0..<numTeeth {
            let localPt = pt.rotated(rotationDelta * tooth)
            
            path.line(localPt[1, 4])
            path.line(localPt[1, 6])
            path.line(localPt[0, segmentsPerTooth / 2]) // 10
            path.line(localPt[0, segmentsPerTooth]) // 20
        }

        return path
    }
}

struct SettingsIconView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsIconView()
            .greedyFrame()
            .background(Color.black.opacity(0.9).ignoresSafeArea())
            .showLayoutGuides(true)
    }
}
