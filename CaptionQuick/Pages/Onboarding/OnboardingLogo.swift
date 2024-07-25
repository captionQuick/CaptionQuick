//
//  OnboardingLogo.swift
//  CaptionQuick
//
//  Created by Peyman Osatian on 2024-07-17.
//

import SwiftUI

struct OnboardingLogo: View {
    // MARK : - PROPERTIES
    @State private var isVisible = false
    @State private var navigateToNextPage = false
    // MARK : - BODY
    var body: some View {
        NavigationView{
            ZStack {
                Color("BackgroundColorMain")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image("LogoMain")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 440, height: 440 , alignment: .center)
                        .blur(radius: isVisible ? 0 : 5)
                        .opacity(isVisible ? 1 : 0)
                        .animation(.easeInOut(duration: 3), value: isVisible)
                        .padding(.top, -70)
                        // ANIMATION IS NOT PERFECT AS LOGO IS NOT WHAT WE WANT
                    Text("CaptionQuick.")
                        .font(.system(size: 32))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding(.top, -120)
                        .blur(radius: isVisible ? 0 : 5)
                        .opacity(isVisible ? 1 : 0)
                        .animation(.easeInOut(duration: 2), value: isVisible)
                    // TEXT FAMILY SHOULD CHANGE TO .....
                    // ROUT TO THE NEXT PAGE
                    NavigationLink(
                        destination: OnboardingAfterLogo(),
                        isActive: $navigateToNextPage,
                        label: {
                            EmptyView()
                        })
                } //VSTACK
                .onAppear {
                    isVisible = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        navigateToNextPage = true
                    }
                } //ZSTACK
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
        }
    }
}
// MARK : - PROPERTIES
#Preview {
    OnboardingLogo()
}
