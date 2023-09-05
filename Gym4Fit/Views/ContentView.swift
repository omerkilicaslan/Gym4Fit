//
//  ContentView.swift
//  Gym4Fit
//
//  Created by Ömer Faruk Kılıçaslan on 5.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var timeRemaining: TimeInterval = 60 // Initial time in seconds
    
    var body: some View {
        VStack {
            CircularCountdownView(totalTime: 60, timeRemaining: $timeRemaining)
                .onAppear {
                    startCountdown()
                }
            
            Button("Start Countdown") {
                startCountdown()
            }
        }
    }
    
    func startCountdown() {
        timeRemaining = 60 // Reset the timer to the initial time
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate()
                // Handle countdown completion here
                print("Countdown finished!")
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
