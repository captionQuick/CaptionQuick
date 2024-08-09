//
//  SignInPassword.swift
//  CaptionQuick
//
//  Created by Peyman Osatian on 2024-08-01.
//

import SwiftUI

struct SignInPassword: View {
   
    @State private var password: String = ""
    var body: some View {
        NavigationView  {
            ZStack{
                Color("BackgroundColorMain")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading){
                            Text("Password")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, 42)
                            Text("Using ... To Login")
                            // in this part of text we need to users email address in between dots
                                .font(.footnote)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding(.leading, 42)
                                .padding(.top,-3)
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
                        CustomTextField(text: $password, placeholder: "Enter your Password")
                        // we need add icon of password eye into textfield
                            .padding()
                            .frame(height: 52)
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 44)
                                    .stroke(Color.gray, lineWidth: 0.2)
                            )
                            .padding(.horizontal, 42)
                            .padding(.top, 32)
                        NavigationLink(destination: ForgetPassword()) {
                                               Text("Forget Password ?")
                                                   .font(.system(size: 12))
                                                   .fontWeight(.light)
                                                   .foregroundColor(.blue)
                                                   .frame(maxWidth: .infinity, alignment:.trailing)
                                                   .padding(.horizontal, 42)
                                           }
                    
                        NavigationLink(destination: SignInPassword()) {
                                                 Text("LOGIN")
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
                                       .padding(.top,16)
                        Text("Or SignIn with")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .padding(.bottom,16)
                            .padding(.top,16)
                       SocialMediaIcons()
                        NavigationLink(destination: SignUp()) {
                                               Text("Dont have an account?")
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
    SignInPassword()
}
