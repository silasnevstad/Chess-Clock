//
//  CustomizeView.swift
//  ChessClock
//
//  Created by Silas Nevstad on 2/8/23.
//

import SwiftUI

struct CustomizeView: View {
    var colorScheme: String
    @State private var whiteMinutesString: Int = 3
    @State private var whiteSecondsString: Double = 0.0
    @State private var blackMinutesString: Int = 3
    @State private var blackSecondsString: Double = 0.0
    @Binding var totalTimeWhite: Double
    @Binding var totalTimeBlack: Double
    @Binding var addedTimeWhite: Double
    @Binding var addedTimeBlack: Double
    @Binding var selectedTime: String
    @Binding var custom: Bool
    
    var body: some View {
        ZStack {
            Color(colorScheme == "Default" ? "Background" : "Black")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Text("White")
                        .font(.custom("InterTight-SemiBold", size: 20))
                        .foregroundColor(colorScheme == "Default" ? .black : .white)
                    
                    Spacer()
                    
                    Text("|")
                        .font(.title2)
                        //.fontDesign(.monospaced)
                        .fontWeight(.semibold)
                        .foregroundColor(colorScheme == "Default" ? .black : .white)
                    
                    Spacer()
                    
                    Text("Black")
                        .font(.custom("InterTight-SemiBold", size: 20))
                        .foregroundColor(colorScheme == "Default" ? .black : .white)
                    
                    Spacer()
                }
                .padding(.bottom, 30)
                
                HStack {
                    Spacer()
                    
                    Picker("", selection: $whiteMinutesString) {
                        ForEach(0..<61, id: \.self) { i in
                            Text("\(i)").tag(i)
                                .foregroundColor(colorScheme == "Default" ? .black : .white)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: UIScreen.main.bounds.width/5.5, height: UIScreen.main.bounds.height/8)
                    .clipped()
                    .foregroundColor(colorScheme == "Default" ? .black : .white)
                    
                    Picker("", selection: $whiteSecondsString) {
                        ForEach(0..<60, id: \.self) { i in
                            Text("\(i)").tag(i)
                                .foregroundColor(colorScheme == "Default" ? .black : .white)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: UIScreen.main.bounds.width/5.5, height: UIScreen.main.bounds.height/8)
                    .clipped()
                    .foregroundColor(colorScheme == "Default" ? .black : .white)

                    
                    Spacer()
                    
                    Picker("", selection: $blackMinutesString) {
                        ForEach(0..<61, id: \.self) { i in
                            Text("\(i)").tag(i)
                                .foregroundColor(colorScheme == "Default" ? .black : .white)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: UIScreen.main.bounds.width/5.5, height: UIScreen.main.bounds.height/8)
                    .clipped()
                    .foregroundColor(colorScheme == "Default" ? .black : .white)
                    Picker("", selection: $blackSecondsString) {
                        ForEach(0..<60, id: \.self) { i in
                            Text("\(i)").tag(i)
                                .foregroundColor(colorScheme == "Default" ? .black : .white)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: UIScreen.main.bounds.width/5.5, height: UIScreen.main.bounds.height/8)
                    .clipped()
                    .foregroundColor(colorScheme == "Default" ? .black : .white)
                    
                    Spacer()
                }
                .padding(.bottom, 10)
                
                HStack {
                    Spacer()
                    
                    Picker("", selection: $addedTimeWhite) {
                        ForEach(0..<60, id: \.self) { i in
                            Text("\(i)").tag(i)
                                .foregroundColor(colorScheme == "Default" ? .black : .white)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: UIScreen.main.bounds.width/5.5, height: UIScreen.main.bounds.height/8)
                    .clipped()
                    .foregroundColor(colorScheme == "Default" ? .black : .white)
                    
                    
                    Spacer()

                    
                    Picker("", selection: $addedTimeBlack) {
                        ForEach(0..<60, id: \.self) { i in
                            Text("\(i)").tag(i)
                                .foregroundColor(colorScheme == "Default" ? .black : .white)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: UIScreen.main.bounds.width/5.5, height: UIScreen.main.bounds.height/8)
                    .clipped()
                    .foregroundColor(colorScheme == "Default" ? .black : .white)
                    
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    totalTimeWhite = convertTimeFromStrings(mins: whiteMinutesString, secs: whiteSecondsString)
                    totalTimeBlack = convertTimeFromStrings(mins: blackMinutesString, secs: blackSecondsString)
//                    addedTimeWhite =  whiteAdded
//                    addedTimeBlack = blackAdded
                    selectedTime = "Custom"
                    custom = false
                }) {
                    Text("Save")
                        .font(.title2)
                        .fontWeight(.bold)
                        //.fontDesign(.monospaced)
                        .foregroundColor(colorScheme == "Default" ? .black : .black)
                        .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 14)
                        .background(Color(colorScheme == "Default" ? "Grey" : "White"))
                        .cornerRadius(10)
                }
            }
            .padding(.top, 50)
            .padding(.bottom, 10)
            
        }
    }
    
    func convertTimeFromStrings(mins: Int, secs: Double) -> Double {
        return Double(60 * mins) + secs
    }
}
