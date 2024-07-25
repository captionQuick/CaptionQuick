//
//  OnboardingAfterLogo.swift
//  CaptionQuick
//
//  Created by Peyman Osatian on 2024-07-17.
//

import SwiftUI

struct OnboardingAfterLogo: View {
    // MARK : - PROPERTIES
  
    
    // MARK : - BODY
    var body: some View {
        NavigationView {
            ZStack{
                Image("Onboarding-11") 
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: 394 , height: 840)
                VStack {
                    Spacer()
                    // NAVIGATE TO SLIDER
                    NavigationLink(destination: OnboardingSlider()) {
                        Text("Get Started")
                            .font(.system(size: 16, weight: .bold))
                            .shadow(color: Color.white, radius: 0.4, x: 0)
                            .padding(.horizontal, 32)
                            .padding()
                            .background(Color("BackgroundColorMain"))
                            .foregroundColor(.white)
                       //INNERSHADOW NOT WORKS AS SHOULD
                            .innerShadow(color: Color.white, radius: 6, x: 0, y: -2)
                            .overlay(
                            RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("BorderColor") , lineWidth: 3)
                            ) // OVERLAY
                            .cornerRadius(40)
                    } // NAVIGATION LINK
                    .padding(.bottom, 70)
                } // VSTACK
            } //ZSTACK
        } //NAVIGATIONVIEW
    }
}
    #Preview {
        OnboardingAfterLogo()
    }

