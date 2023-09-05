//
//  FeedViewModel.swift
//  Gym4Fit
//
//  Created by Ömer Faruk Kılıçaslan on 5.09.2023.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    @Published var timeRemaining: TimeInterval = 60 // Initial time in seconds
    
    func startCountdown() {
        timeRemaining = 60 // Reset the timer to the initial time
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.invalidate()
                // Handle countdown completion here
                print("Countdown finished!")
            }
        }
    }
    
    
}
