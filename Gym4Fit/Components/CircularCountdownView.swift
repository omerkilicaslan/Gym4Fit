//
//  CircularCountdownView.swift
//  Gym4Fit
//
//  Created by Ömer Faruk Kılıçaslan on 5.09.2023.
//

import SwiftUI

struct CircularCountdownView: View {
    let totalTime: TimeInterval // Total time for the countdown in seconds
    @Binding var timeRemaining: TimeInterval // Remaining time, updated externally
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 10)
                
                Circle()
                    .trim(from: 0, to: CGFloat(timeRemaining / totalTime))
                    .stroke(Color.blue, lineWidth: 10)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1.0))
                
                Text(String(format: "%.0f", timeRemaining))
                    .font(.largeTitle)
            }
            .frame(width: 150, height: 150)
        }
    }
}
