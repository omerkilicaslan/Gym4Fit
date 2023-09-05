//
//  BMITopCard.swift
//  Gym4Fit
//
//  Created by Ömer Faruk Kılıçaslan on 5.09.2023.
//

import SwiftUI

struct BMITopCard: View {
    
    var BMIValue: Double = 25.5
    
    var body: some View {
        VStack {
            HStack{
                HStack{
                    Text("BMI:")
                        .kerning(-0.29)
                        .multilineTextAlignment(.center)
                    
                    Text("25.5")
                        .kerning(-0.29)
                        .multilineTextAlignment(.center)
                        .padding(.trailing,16)
                    
                    
                }
                .padding(.trailing,16)
                
                Circle()
                    .fill(.red)
                    .frame(width: 50, height: 50)
                    .padding(.trailing,16)
                
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Boy:")
                            .kerning(-0.29)
                        
                        Text("191cm")
                            .kerning(-0.29)
                            
                    }
                    HStack{
                        Text("Kilo:")
                            .kerning(-0.29)
                        
                        Text("84.5")
                            .kerning(-0.29)
                            
                    }
                }
                
            }
            Rectangle()
                .frame(height: 2) // Adjust the height to make it thicker
                .foregroundColor(Color.black)
        }
        .padding(.vertical)
    }
}

struct BMITopCard_Previews: PreviewProvider {
    static var previews: some View {
        BMITopCard()
    }
}
