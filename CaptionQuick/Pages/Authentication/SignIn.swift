//
//  SignIn.swift
//  CaptionQuick
//
//  Created by Peyman Osatian on 2024-08-01.
//

import SwiftUI

struct SignIn: View {
    @State private var email: String = ""
    var body: some View {
        NavigationView  {
            ZStack{
                Color("BackgroundColorMain")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading){
                            Text("What's your")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, 42)
                            Text("Email")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, 42)
                            Text("address?")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, 42)
                        }
                        Spacer()
                        Image("Subtrack")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .padding(.trailing, -35)
                    }
                    .padding(.top, 85)
                    Spacer()
                    VStack(spacing: 16) {
                        CustomTextField(text: $email, placeholder: "Enter your Email")
                            .padding()
                            .frame(height: 52)
                            .background(Color.clear) // Transparent background
                            .overlay(
                                RoundedRectangle(cornerRadius: 44)
                                    .stroke(Color.gray, lineWidth: 0.2)
                            )
                            .padding(.horizontal, 42)
                        Text("Or SignUp with")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .padding(.bottom,16)
                            .padding(.top,16)
                        HStack(spacing: 16) {
                                       Image("Google")
                                           .resizable()
                                           .frame(width: 32, height:32)
                                           .foregroundColor(.blue)
                                           .padding(.horizontal,8)
                            Image("Facebook")
                                           .resizable()
                                           .frame(width: 32, height: 32)
                                           .foregroundColor(.blue)
                                   }
                       
                            .padding(.horizontal, 42)
                            .padding(.bottom, 24)
                        Button(action: {
                                           // Action for create account button
                                       }) {
                                           Text("CREATE ACCOUNT")
                                               .fontWeight(.medium)
                                               .font(.system(size: 14))
                                               .frame(height: 16)
                                               .frame(maxWidth: .infinity)
                                               .padding()
                                               .background(Color.blue)
                                               .foregroundColor(.white)
                                               .cornerRadius(44)
                                       }
                                       .padding(.horizontal, 42)
                     
                        NavigationLink(destination: SignIn()) {
                                               Text("Already have an account")
                                                   .font(.system(size: 12))
                                                   .fontWeight(.light)
                                                   .foregroundColor(.white)
                                                   .underline()
                                                   .padding(.top, 8)
                                                   .frame(maxWidth: .infinity, alignment: .center)
                                           }
                        Spacer()
                                     
                    } // ZSTACK
                }
            }
            
        }
        .navigationBarHidden(true)
    }
}
#Preview {
    SignIn()
}
