//
//  HostingController.swift
//  ActivityApp
//
//  Created by Артём Мошнин on 19/2/21.
//

import UIKit
import SwiftUI

class HostingController: UIHostingController<ContentView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
