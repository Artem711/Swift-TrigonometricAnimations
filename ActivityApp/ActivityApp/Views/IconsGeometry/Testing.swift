//
//  Testing.swift
//  ActivityApp
//
//  Created by Артём Мошнин on 21/2/21.
//

import SwiftUI

struct Testing: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.9)
            
            ZStack {
                Shroud()
                Cog()
            }
        } //: ZSTACK
        .edgesIgnoringSafeArea(.all)
    }
}

private struct Shroud: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.circle(rect)
        
        return path
    }
}

private struct Cog: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        return path
    }
}


struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        Testing()
    }
}
