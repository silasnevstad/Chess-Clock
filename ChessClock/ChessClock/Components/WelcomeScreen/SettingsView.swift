//
//  SettingsView.swift
//  ChessClock
//
//  Created by Silas Nevstad on 2/8/23.
//

import SwiftUI

struct SettingsView: View {
    @Binding var colorScheme: String
    @Binding var sound: Bool
    
    var body: some View {
        ZStack {
            Color(colorScheme == "Default" ? "Grey" : "Grey")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Sound")
                    .font(.custom("InterTight-SemiBold", size: 20))
                    .padding(.leading, 10)
                    .foregroundColor(colorScheme == "Default" ? .black : .white)
                
                HStack {
                    Button(action: {
                        sound = true
                    }) {
                        Text("On")
                            .foregroundColor(colorScheme == "Default" ? Color("Black") : sound ? .black : .white)
                            .font(.custom("InterTight-SemiBold", size: 18))
                            .frame(width: UIScreen.main.bounds.width / 3.5, height: UIScreen.main.bounds.height / 14)
                            .background(colorScheme == "Default" ? sound ? Color("LightGreen") : Color("Grey")  : sound ? .white : .black)
                            .cornerRadius(10)
                        
                    }
                    
                    Button(action: {
                        sound = false
                    }) {
                        Text("Off")
                            .foregroundColor(colorScheme == "Default" ? Color("Black") : sound ? .white : .black)
                            .font(.custom("InterTight-SemiBold", size: 18))
                            .frame(width: UIScreen.main.bounds.width / 3.5, height: UIScreen.main.bounds.height / 14)
                            .background(colorScheme == "Default" ? sound ? Color("Grey") : Color("LightGreen")  : sound ? .black : .white)
                            .cornerRadius(10)
                        
                    }
                }
                
                Spacer().frame(height: UIScreen.main.bounds.height / 10)
                
                Text("Color Wave")
                    .font(.custom("InterTight-SemiBold", size: 20))
                    .padding(.leading, 10)
                    .foregroundColor(colorScheme == "Default" ? .black : .white)
                
                HStack {
                    
                    ColorSchemeButton(topColor: "DarkGreen", bottomColor: "Pale") {
                        colorScheme = "Default"
                    }
                    
                    ColorSchemeButton(topColor: "White", bottomColor: "Black") {
                        colorScheme = "BW"
                    }
                    
                }
            }
        }
    }
}
