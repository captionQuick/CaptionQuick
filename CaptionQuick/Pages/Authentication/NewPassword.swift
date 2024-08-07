//
//  NewPassword.swift
//  CaptionQuick
//
//  Created by Peyman Osatian on 2024-08-02.
//

import SwiftUI

struct NewPassword: View {
    
    @State private var password: String = ""
    var body: some View {
        ZStack{
            Color("BackgroundColorMain")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading){
                        Text("New Password")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.leading, 42)
                        
                        Text("Enter your new password")
                            .font(.subheadline)
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
                    CustomTextField(text: $password, placeholder: "Enter new password")
                        .padding()
                        .frame(height: 52)
                        .background(Color.clear) // Transparent background
                        .overlay(
                            RoundedRectangle(cornerRadius: 44)
                                .stroke(Color.gray, lineWidth: 0.2)
                        )
                        .padding(.horizontal, 42)
                    CustomTextField(text: $password, placeholder: "Confirm new password")
                        .padding()
                        .frame(height: 52)
                        .background(Color.clear) // Transparent background
                        .overlay(
                            RoundedRectangle(cornerRadius: 44)
                                .stroke(Color.gray, lineWidth: 0.2)
                        )
                        .padding(.horizontal, 42)
                    Button(action: {
                                       // Action for create account button
                                   }) {
                                       Text("SAVE")
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
                                   .padding(.top,32)
                 
                  
                    Spacer()
                                 
                } // ZSTACK
            }
        }
    }
}

#Preview {
    NewPassword()
}
