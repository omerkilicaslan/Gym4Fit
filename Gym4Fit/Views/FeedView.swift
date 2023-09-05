//
//  FeedView.swift
//  Gym4Fit
//
//  Created by Ömer Faruk Kılıçaslan on 5.09.2023.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var feedViewModel = FeedViewModel()

    var body: some View {
        ZStack{
            VStack(alignment: .center){
                BMITopCard()
                
                Spacer()
                
                VStack(){
                    CircularCountdownView(totalTime: 60, timeRemaining: $feedViewModel.timeRemaining)
                        .onAppear {
                            feedViewModel.startCountdown()
                        }
                    
                    Button("Start Countdown") {
                        feedViewModel.startCountdown()
                    }
                }
                
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
