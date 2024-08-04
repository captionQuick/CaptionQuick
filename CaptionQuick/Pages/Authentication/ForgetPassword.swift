//
//  ForgetPassword.swift
//  CaptionQuick
//
//  Created by Peyman Osatian on 2024-08-02.
//

import SwiftUI

struct ForgetPassword: View {
    @State private var email: String = ""
    var body: some View {
        ZStack{
            Color("BackgroundColorMain")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading){
                        Text("Forget Password")
                            .font(.system(size: 32))
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
                    CustomTextField(text: $email, placeholder: "Enter your Email Address")
                    // we need add icon of password eye into textfield
                        .padding()
                        .frame(height: 52)
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 44)
                                .stroke(Color.gray, lineWidth: 0.2)
                        )
                        .padding(.horizontal, 42)
                    
                    Text("By submitting your email your will get a verification code that you need to use it in next step.")
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .padding(.leading,42)
                        .padding(.trailing, 42)
                        .foregroundColor(.white)
                        .padding(.bottom,72)
                    Button(action: {
                                       // Action for create account button
                                   }) {
                                       Text("SEND")
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
                   Spacer()
                    
                }
                
            }
        }
       
    }
}
#Preview {
    ForgetPassword()
}
