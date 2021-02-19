//
//  TimingCurves.swift
//  ActivityApp
//
//  Created by Артём Мошнин on 19/2/21.
//

import SwiftUI
import PureSwiftUI

struct TimingCurvesView: View {
    @State private var cp0 = CGPoint(x: 0.4, y: 0.4)
    @State private var cp1 = CGPoint(x: 0.6, y: 0.6)
    
    var body: some View {
        let timingCurve = TimingCurve(cp0: $cp0, cp1: $cp1)
        return ZStack {
            Color.black.opacity(0.93)
                .edgesIgnoringSafeArea(.all)
            
            timingCurve.asView(200)
        }
    }
}

private struct TimingCurve {
    @Binding var cp0: CGPoint
    @Binding var cp1: CGPoint
    
    func asView(_ size: CGFloat) -> some View {
        let cp0Mapped = mapFromUnitPoint(cp0, to: size)
        let cp1Mapped = mapFromUnitPoint(cp1, to: size)
        
        return ZStack {
            TimingCurveShape(cp0Mapped: cp0Mapped, cp1Mapped: cp1Mapped)
                .layoutGuide(.grid(columns: 10, rows: 10), color: .white)
                .showLayoutGuides(true)
        }
        .frame(size)
    }
}

private struct TimingCurveShape: Shape {
    let cp0Mapped: CGPoint
    let cp1Mapped: CGPoint
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        return path
    }
}

// Utilities
private func invertY(_ unitPoint: CGPoint) -> CGPoint {
    CGPoint(unitPoint.x, 1 - unitPoint.y)
}

private func mapFromUnitPoint(_ unitPoint: CGPoint, to size: CGFloat) -> CGPoint {
    let invertedPoint = invertY(unitPoint)
    return invertedPoint.scaled(size)
}


struct TimingCurvesView_Previews: PreviewProvider {
    static var previews: some View {
        TimingCurvesView()
    }
}
