//
//  BullseyeApp.swift
//  Bullseye
//
//  Created by Kristian Maglasang on 12/11/20.
//

import SwiftUI

@main
struct BullseyeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                AboutView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
