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
    @State private var whiteSecondsString: Int = 0
    @State private var blackMinutesString: Int = 3
    @State private var blackSecondsString: Int = 0
    @State private var addedTimeWhiteString: Int = 2
    @State private var addedTimeBlackString: Int = 2
    @Binding var totalTimeWhite: Double
    @Binding var totalTimeBlack: Double
    @Binding var addedTimeWhite: Double
    @Binding var addedTimeBlack: Double
    @Binding var selectedTime: String
    @Binding var custom: Bool
    
    var body: some View {
        let textColor = colorScheme == "Default" ? "Black" : "White"
        ZStack {
            Color(colorScheme == "Default" ? "Background" : "White")
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width/2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Color(colorScheme == "Default" ? "DarkGreen" : "Black")
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width/2)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            VStack {
//                HStack {
//                    Spacer()
//
//                    Text("White")
//                        .font(.custom("InterTight-SemiBold", size: 20))
//                        .foregroundColor(colorScheme == "Default" ? .black : .white)
//
//                    Spacer()
//
//                    Text("Black")
//                        .font(.custom("InterTight-SemiBold", size: 20))
//                        .foregroundColor(colorScheme == "Default" ? .black : .white)
//
//                    Spacer()
//                }
//                .padding(.bottom, 30)
                
                HStack {
                    Spacer()
                    
                }
                
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
                    
                    Text(":")
                        .font(.custom("InterTight-Medium", size: 16))
                    
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
                                .foregroundColor(Color(textColor))
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: UIScreen.main.bounds.width/5.5, height: UIScreen.main.bounds.height/8)
                    .clipped()
                    .foregroundColor(Color(textColor))
                    
                    Text(":")
                        .font(.custom("InterTight-Medium", size: 16))
                    
                    Picker("", selection: $blackSecondsString) {
                        ForEach(0..<60, id: \.self) { i in
                            Text("\(i)").tag(i)
                                .foregroundColor(Color(textColor))
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: UIScreen.main.bounds.width/5.5, height: UIScreen.main.bounds.height/8)
                    .clipped()
                    .foregroundColor(Color(textColor))
                    
                    Spacer()
                }
                .padding(.bottom, 10)
                
                HStack {
                    Spacer()
                    
                    Text("+")
                        .font(.custom("InterTight-Medium", size: 16))
                    
                    Picker("", selection: $addedTimeWhiteString) {
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

                    Text("+")
                        .font(.custom("InterTight-Medium", size: 16))
                    
                    Picker("", selection: $addedTimeBlackString) {
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
                    addedTimeWhite = Double(addedTimeWhiteString)
                    addedTimeBlack = Double(addedTimeBlackString)
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
    
    func convertTimeFromStrings(mins: Int, secs: Int) -> Double {
        return Double(60 * mins) + Double(secs)
    }
}
