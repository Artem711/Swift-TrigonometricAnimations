//
//  ClockView.swift
//  ActivityApp
//
//  Created by Артём Мошнин on 19/2/21.
//

import SwiftUI
import PureSwiftUI

private let rings = 3
private let segments = 12
private let clockLayoutGuide = LayoutGuideConfig.polar(rings: rings, segments: segments)

struct ClockView: View {
    @State var date = ClockModel(9, 51, 15)
    
    var body: some View {
        print(date)
        return VStack {
            ClockShape(time: date)
                .layoutGuide(clockLayoutGuide)
                .padding(30)
        }
    }
}

enum TimeType {
    case second, minute, hour
}

struct ClockShape: Shape {
    var time: ClockModel
    
    func path(in rect: CGRect) -> Path {
        var path = Path()        
        return path
    }
}

struct ClockModel {
    var hours: Int      // Hour needle should jump by integer numbers
    var minutes: Int    // Minute needle should jump by integer numbers
    var seconds: Double // Second needle should move smoothly
    
    // Initializer with hour, minute and seconds
    init(_ h: Int, _ m: Int, _ s: Double) {
        self.hours = h
        self.minutes = m
        self.seconds = s
    }
    
    // Initializer with total of seconds
    init(_ seconds: Double) {
        let h = Int(seconds) / 3600
        let m = (Int(seconds) - (h * 3600)) / 60
        let s = seconds - Double((h * 3600) + (m * 60))
        
        self.hours = h
        self.minutes = m
        self.seconds = s
    }
    
    // compute number of seconds
    var asSeconds: Double {
        return Double(self.hours * 3600 + self.minutes * 60) + self.seconds
    }
    
    // show as string
    func asString() -> String {
        return String(format: "%2i", self.hours) + ":" + String(format: "%02i", self.minutes) + ":" + String(format: "%02f", self.seconds)
    }
}
struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
            .showLayoutGuides(true)
    }
}
