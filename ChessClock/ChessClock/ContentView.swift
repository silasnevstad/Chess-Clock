//
//  ContentView.swift
//  ChessClock
//
//  Created by Silas Nevstad on 1/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var started: Bool = false
    @State var totalTimeWhite: Double = 180.0
    @State var totalTimeBlack: Double = 180.0
    @State var addedTimeWhite: Double = 2.0
    @State var addedTimeBlack: Double = 2.0
    @State var colorScheme: String = "Default"
    @State var sound: Bool = true
    
    var body: some View {
        NavigationView {
            if started {
                ClockView(whiteTimeRemaining: totalTimeWhite, blackTimeRemaining: totalTimeBlack, whiteTimeAdded: addedTimeWhite, blackTimeAdded: addedTimeBlack, started: $started, colorScheme: colorScheme, sound: $sound)
            } else {
                WelcomeView(totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, started: $started, colorScheme: $colorScheme, sound: $sound)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
