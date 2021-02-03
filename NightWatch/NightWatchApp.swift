//
//  NightWatchApp.swift
//  NightWatch
//
//  Created by Bannasarn Boonmee on 1/2/2564 BE.
//

import SwiftUI

@main
struct NightWatchApp: App {
    
    @StateObject var nightWatchTask = NightWatchTask()
    
    var body: some Scene {
        WindowGroup {
            ContentView(nightWatchTask: nightWatchTask)
        }
    }
}
