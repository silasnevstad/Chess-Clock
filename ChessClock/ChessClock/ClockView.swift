//
//  ClockView.swift
//  ChessClock
//
//  Created by Silas Nevstad on 1/17/23.
//

import SwiftUI
import AVFoundation

struct ClockView: View {
    @State var whiteTimeRemaining: Double
    @State var blackTimeRemaining: Double
    @State var whiteMoveCounter = 0
    @State var blackMoveCounter = 0
    var whiteTimeAdded: Double
    var blackTimeAdded: Double
    @State private var activeTimer: Int = 1
    @State private var timer: Timer?
    @Binding var started: Bool
    @State var winner = ""
    var colorScheme: String
    @Binding var sound: Bool
    @State var paused: Bool = false
    @State var settingsExpanded = false
    @State var player: AVAudioPlayer?


    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(colorScheme == "Default" ? "DarkGreen" : "Black")
                // Top half of the screen
                Text("\(blackMoveCounter)")
                    .font(.custom("InterTight-SemiBold", size: 28))
                    .opacity(self.activeTimer == 2 ? 1 : 0.6)
                    .rotationEffect(Angle(degrees: 180))
                    .padding(.top, 40)
                    .padding(.leading, 30)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .foregroundColor(colorScheme == "Default" ? .black : .white)
                
                VStack {
                    Text("\(secondsToMinutes(secs: self.blackTimeRemaining))")
                        .font(.custom("InterTight-Bold", size: 45))
                        .frame(width: geometry.size.width, height: geometry.size.height/2)
                        .opacity(self.activeTimer == 2 ? 1 : 0.6)
                        .rotationEffect(Angle(degrees: 180))
                        .foregroundColor(colorScheme == "Default" ? .black : .white)
                        .onAppear(){
                            if self.activeTimer == 1 {
                                self.startTimer()
                            }
                            
                        }
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 4)
                    
                    Rectangle()
                        .fill(Color(colorScheme == "Default" ? "Pale" : "White"))
                        .frame(width: geometry.size.width, height: geometry.size.height/2)
                }
                
                
                HStack {
                    Button(action: {
                        self.timer?.invalidate()
                        self.activeTimer = 1
                        self.winner = ""
                        started = false
                        
                    }) {
                        Image(systemName: "arrowshape.backward.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width/11, height: UIScreen.main.bounds.height/10)
                            .foregroundColor(.black)
                            .padding(16)
                            .background(Color(colorScheme == "Default" ? "Grey" : "LightGrey"))
                            .backgroundStyle(.opacity(0.5))
                            .clipShape(Circle())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.leading, -5)
                    .shadow(color: Color.black.opacity(0.4), radius: 3, x: 2, y: 2)
                    
                    ExpandableButtonPanel(primaryItem: ExpandableButtonItem(label: "gear", labelInactive: "gear", pressed: $settingsExpanded), secondaryItems: [
                        ExpandableButtonItem(label: "play.fill", labelInactive: "pause.fill", pressed: $paused) {
                            print("pause pressed")
                            self.paused.toggle()
                        },
                        ExpandableButtonItem(label: "speaker.wave.1.fill", labelInactive: "speaker.slash.fill", pressed: $sound) {
                            print("sound pressed")
                            self.sound.toggle()
                        }], colorScheme: colorScheme)
                    .padding(.trailing, 10)

                }
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                
                // Bottom half of the screen
                VStack {
                    Text("\(secondsToMinutes(secs: self.whiteTimeRemaining))")
                        .font(.custom("InterTight-Bold", size: 45))
                        .frame(width: geometry.size.width, height: geometry.size.height/2)
                        .offset(y: geometry.size.height/2)
                        .opacity(self.activeTimer == 1 ? 1 : 0.6)
                        .foregroundColor(.black)
                        .onAppear(){
                            if self.activeTimer == 2 {
                                self.startTimer()
                            }
                    }
                    
                    Text("\(whiteMoveCounter)")
                        .font(.custom("InterTight-SemiBold", size: 28))
                        .opacity(self.activeTimer == 1 ? 1 : 0.6)
                        .foregroundColor(colorScheme == "Default" ? .black : .white)
                        .position(x: UIScreen.main.bounds.width - 35, y: (UIScreen.main.bounds.height / 2) - 55)
                }
                

            }
            .gesture(TapGesture()
                .onEnded {
                    if (self.activeTimer == 1) {
                        whiteTimeRemaining += whiteTimeAdded
                        whiteMoveCounter += 1
                    } else {
                        blackTimeRemaining += blackTimeAdded
                        blackMoveCounter += 1
                    }
                    self.activeTimer = (self.activeTimer == 1) ? 2 : 1
                    self.timer?.invalidate()
                    self.startTimer()
                    if sound { self.playMoveSound() }
                }
            )
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if !paused && winner == "" {
                if self.activeTimer == 1 {
                    if self.whiteTimeRemaining > 0 {
                        self.whiteTimeRemaining -= 0.1
                        if self.whiteTimeRemaining == 0 {
                            winner = "Black"
                        } else if self.whiteTimeRemaining == 10 {
                            if sound { self.playWarning() }
                        }
                    }
                } else {
                    if self.blackTimeRemaining > 0 {
                        self.blackTimeRemaining -= 0.1
                        if self.blackTimeRemaining == 0 {
                            winner = "White"
                        } else if self.blackTimeRemaining == 10 {
                            if sound { self.playWarning() }
                        }
                    }
                }
            }
        }
    }
    
    func playWarning() {
        guard let url = Bundle.main.url(forResource: "warning", withExtension: "m4a") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)
            
            guard let player = player else { return }
            
            player.volume = 1
            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playMoveSound() {
        guard let url = Bundle.main.url(forResource: "click", withExtension: "m4a") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)
            
            guard let player = player else { return }
            
            player.volume = 1
            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func secondsToMinutes(secs: Double) -> String {
        let mins = floor(secs / 60)
        let remainingSecs = secs - Double(Int(mins) * 60)
        var secsString: String
        
        if mins < 1 && remainingSecs < 10.0 && remainingSecs != 0.0 {
            secsString = String(format: "%.1f", remainingSecs)
        } else if remainingSecs < 10 {
            secsString = "0" + String(Int(floor(remainingSecs)))
        } else {
            secsString = String(Int(floor(remainingSecs)))
        }
        
        if secsString == "0" {
            secsString = "00"
        }
        if mins == -1 {
            return "00:00"
        }
        if mins < 1 {
            if remainingSecs <= 0 {
                return "00:00"
            }
            if remainingSecs < 10 {
                return "\(secsString)"
            }
        }
        return "\(Int(mins)):\(secsString)"
    }
}
