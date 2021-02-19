//
//  ContentView.swift
//  ActivityApp
//
//  Created by Артём Мошнин on 19/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
    
    private func createCharts() -> some View {
        return Group {
            
        } //: GROUP
    }
    
    private func createFooter() -> some View {
        return VStack {
            
        } //: VSTACK
    }
    
    private func createNavigationBar(_ geometrySize: CGSize) -> some View {
        return ZStack {
            
        } //: ZTACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
