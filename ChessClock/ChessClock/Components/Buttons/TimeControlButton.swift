//
//  TimeControlButton.swift
//  ChessClock
//
//  Created by Silas Nevstad on 2/8/23.
//

import SwiftUI

struct TimeControlButtom: View {
    @Binding var selectedTime: String
    @Binding var totalTimeWhite: Double
    @Binding var totalTimeBlack: Double
    @Binding var addedTimeWhite: Double
    @Binding var addedTimeBlack: Double
    var text: String
    var colorScheme: String
    
    var body: some View {
        VStack {
            Button(action: {
                selectedTime = text
                switch (text) {
                case "1":
                    totalTimeBlack = 60
                    totalTimeWhite = 60
                    addedTimeWhite = 0
                    addedTimeBlack = 0
                case "1|1":
                    totalTimeBlack = 60
                    totalTimeWhite = 60
                    addedTimeWhite = 1
                    addedTimeBlack = 1
                case "1|2":
                    totalTimeBlack = 60
                    totalTimeWhite = 60
                    addedTimeWhite = 2
                    addedTimeBlack = 2
                case "2|1":
                    totalTimeBlack = 120
                    totalTimeWhite = 120
                    addedTimeWhite = 1
                    addedTimeBlack = 1
                case "3":
                    totalTimeBlack = 180
                    totalTimeWhite = 180
                    addedTimeWhite = 0
                    addedTimeBlack = 0
                case "3|2":
                    totalTimeBlack = 180
                    totalTimeWhite = 180
                    addedTimeWhite = 2
                    addedTimeBlack = 2
                case "5|2":
                    totalTimeBlack = 300
                    totalTimeWhite = 300
                    addedTimeWhite = 2
                    addedTimeBlack = 2
                case "5|5":
                    totalTimeBlack = 300
                    totalTimeWhite = 300
                    addedTimeWhite = 5
                    addedTimeBlack = 5
                case "10":
                    totalTimeBlack = 600
                    totalTimeWhite = 600
                    addedTimeWhite = 0
                    addedTimeBlack = 0
                case "10|5":
                    totalTimeBlack = 600
                    totalTimeWhite = 600
                    addedTimeWhite = 5
                    addedTimeBlack = 5
                case "15|10":
                    totalTimeBlack = 900
                    totalTimeWhite = 900
                    addedTimeWhite = 10
                    addedTimeBlack = 10
                case "30|15":
                    totalTimeBlack = 1800
                    totalTimeWhite = 1800
                    addedTimeWhite = 15
                    addedTimeBlack = 15
                default:
                    totalTimeBlack = 180
                    totalTimeWhite = 180
                    addedTimeWhite = 2
                    addedTimeBlack = 2
                }
            }) {
                Text(text)
                    .font(.custom("InterTight-SemiBold", size: 18))
                    .foregroundColor(colorScheme == "Default" ? .black : Color(text == selectedTime ? "Black" : "White"))
                    .frame(width: UIScreen.main.bounds.width/3.5, height: UIScreen.main.bounds.height/18)
                    .background(colorScheme == "Default" ? Color(text == selectedTime ? "LightGreen" : "Grey") : Color(text == selectedTime ? "White" : "LightGrey"))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.55), radius: 4, x: 2, y: 2)
            }
            .padding(.bottom, 20)
            .buttonStyle(GradientButtonStyle())
        }
    }
}


