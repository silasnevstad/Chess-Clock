//
//  WelcomeView.swift
//  ChessClock
//
//  Created by Silas Nevstad on 1/17/23.
//

import SwiftUI

struct WelcomeView: View {
    @State var selectedTimeControl: String = "3|2"
    @Binding var totalTimeWhite: Double
    @Binding var totalTimeBlack: Double
    @Binding var addedTimeWhite: Double
    @Binding var addedTimeBlack: Double
    @Binding var started: Bool
    @State var settings: Bool = false
    @State var custom: Bool = false
    @State var customSave: Bool = false
    @Binding var colorScheme: String
    @Binding var sound: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(colorScheme == "Default" ? "Background" : "Black")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Chess Clock")
                        .padding()
                        .font(.custom("InterTight-Bold", size: 30))
                        .padding(.top, 60)
                        .foregroundColor(colorScheme == "Default" ? .black : .white)
                        .padding()
                    
                    Spacer()

                    VStack {
                        Text("Bullet")
                            .font(.custom("InterTight-SemiBold", size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 5)
                            .foregroundColor(colorScheme == "Default" ? .black : .white)
                            .padding()
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                TimeControlButtom(selectedTime: $selectedTimeControl, totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, text: "1", colorScheme: colorScheme)
                                TimeControlButtom(selectedTime: $selectedTimeControl, totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, text: "1|1", colorScheme: colorScheme)
                                TimeControlButtom(selectedTime: $selectedTimeControl, totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, text: "1|2", colorScheme: colorScheme)
                                TimeControlButtom(selectedTime: $selectedTimeControl, totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, text: "2|1", colorScheme: colorScheme)
                            }
                            .offset(x: 20)
                        }
                        
                        Text("Blitz")
                            .font(.custom("InterTight-SemiBold", size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 5)
                            .foregroundColor(colorScheme == "Default" ? .black : .white)
                            .padding()
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                TimeControlButtom(selectedTime: $selectedTimeControl, totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, text: "3", colorScheme: colorScheme)
                                TimeControlButtom(selectedTime: $selectedTimeControl, totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, text: "3|2", colorScheme: colorScheme)
                                TimeControlButtom(selectedTime: $selectedTimeControl, totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, text: "5|2", colorScheme: colorScheme)
                                TimeControlButtom(selectedTime: $selectedTimeControl, totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, text: "5|5", colorScheme: colorScheme)
                            }
                            .offset(x: 20)
                        }
                        
                        Text("Rapid")
                            .font(.custom("InterTight-SemiBold", size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 5)
                            .foregroundColor(colorScheme == "Default" ? .black : .white)
                            .padding()
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                TimeControlButtom(selectedTime: $selectedTimeControl, totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, text: "10", colorScheme: colorScheme)
                                TimeControlButtom(selectedTime: $selectedTimeControl, totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, text: "10|5", colorScheme: colorScheme)
                                TimeControlButtom(selectedTime: $selectedTimeControl, totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, text: "15|10", colorScheme: colorScheme)
                                TimeControlButtom(selectedTime: $selectedTimeControl, totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, text: "30|15", colorScheme: colorScheme)
                            }
                            .padding(.bottom, 10)
                            .offset(x: 20)
                        }
                        
                        HStack {
                            Button(action: { custom.toggle() }) {
                                Text("Custom")
                                    .font(.custom("InterTight-SemiBold", size: 22))
                                    .foregroundColor(colorScheme == "Default" ? .black : .white)
                                    .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/18)
                                    .background(colorScheme == "Default" ? Color(selectedTimeControl == "Custom" ? "LightGreen" : "Grey") : Color(selectedTimeControl == "Custom"  ? "White" : "Grey"))
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.55), radius: 4, x: 2, y: 2)
                            }
                        }
                    }
                    
                    Spacer().frame(height: UIScreen.main.bounds.height / 10)
                    
                    HStack {
                        Button(action: { started = true }) {
                            Text("Start!")
                                .font(.custom("InterTight-Bold", size: 24))
                                .foregroundColor(colorScheme == "Default" ? .black : .white)
                                .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 12)
                                .background(Color(colorScheme == "Default" ? "DarkGreen" : "Grey"))
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 15)
                        
                        Button(action: { settings.toggle() }) {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width / 15)
                                .padding()
                                .foregroundColor(colorScheme == "Default" ? .black : .white)
                                .padding(.bottom, UIScreen.main.bounds.height / 40)
                        }
                    }
                    .edgesIgnoringSafeArea(.bottom)
                    .padding(.bottom, 20)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $settings, onDismiss: { settings = false }) {
                if #available(iOS 16.0, *) {
                    SettingsView(colorScheme: $colorScheme, sound: $sound).presentationDetents([.medium, .large])
                } else {
                    SettingsView(colorScheme: $colorScheme, sound: $sound)
                }
            }
            .sheet(isPresented: $custom, onDismiss: { custom = false }) {
                if #available(iOS 16.0, *) {
                    CustomizeView(colorScheme: colorScheme, totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, selectedTime: $selectedTimeControl, custom: $custom).presentationDetents([.medium, .large])
                } else {
                    CustomizeView(colorScheme: colorScheme, totalTimeWhite: $totalTimeWhite, totalTimeBlack: $totalTimeBlack, addedTimeWhite: $addedTimeWhite, addedTimeBlack: $addedTimeBlack, selectedTime: $selectedTimeControl, custom: $custom)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}


