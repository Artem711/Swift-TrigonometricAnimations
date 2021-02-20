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

struct SettingsIconView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

private struct Shroud: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        return path
    }
}

struct SettingsIconView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsIconView()
            .frame(400)
            .greedyFrame()
            .background(Color.white.opacity(0.1).ignoresSafeArea())
            .showLayoutGuides(true)
    }
}
