//
//  ForgetPasswordVerificationCode.swift
//  CaptionQuick
//
//  Created by Peyman Osatian on 2024-08-02.
//

import SwiftUI

struct ForgetPasswordVerificationCode: View {
    // MAYBE WE WILL INTEGER INSTEAD OF STRING IN HERE
    @State private var code1: String = ""
    @State private var code2: String = ""
    @State private var code3: String = ""
    @State private var code4: String = ""
    var body: some View {
        ZStack{
            Color("BackgroundColorMain")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading){
                        AuthHeaderView(title: "Verification", subtitle: "Enter verifivation code here.")
                    } // VSTACK
                } // HSTACK
                .padding(.top, 85)
                Spacer()
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 16) {
                        CustomTextField(text: $code1, placeholder: "")
                            .frame(width: 60, height: 60)
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 0.2)
                            )
                        CustomTextField(text: $code2, placeholder: "")
                            .frame(width: 60, height: 60)
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 0.2)
                            )
                        CustomTextField(text: $code3, placeholder: "")
                            .frame(width: 60, height: 60)
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 0.2)
                            )
                        CustomTextField(text: $code4, placeholder: "")
                            .frame(width: 60, height:60)
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 0.2)
                            )
                    } // HSTACK
                    .padding(.horizontal, 42)
                    
                    HStack {
                        Text("If you didn't receive the code?")
                            .font(.system(size: 12))
                            .fontWeight(.light)
                            .padding(.leading, 42)
                            .foregroundColor(.gray)
                            .padding(.bottom, 72)
                        //  👉🏻here we will have text link which will generate a verification code again
                        Text("Resend")
                            .font(.system(size: 12))
                            .fontWeight(.light)
                            .padding(.top, -44)
                            .padding(.leading, 10)
                            .foregroundColor(.red)
                    }
                    Button(action: {
                        //  👉🏻Action for CONFIRM VERIFICATION CODE
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
                    
                } // VSTACK
            } // vstack
        } // zstack
    }
}

#Preview {
    ForgetPasswordVerificationCode()
}
