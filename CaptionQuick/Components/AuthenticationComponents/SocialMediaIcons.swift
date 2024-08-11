//
//  SocialMediaIcons.swift
//  CaptionQuick
//
//  Created by Peyman Osatian on 2024-08-09.
//

import SwiftUI

struct SocialMediaIcons: View {
    var body: some View {
        // The icons should connect to signin process of login with Google & Facebook
        HStack(spacing: 32) {
                       Image("Google")
                           .resizable()
                           .frame(width: 42, height:42)
                           .foregroundColor(.blue)
                          
            Image("Facebook")
                           .resizable()
                           .frame(width: 42, height: 42)
                           .foregroundColor(.blue)
                   }
       
            .padding(.horizontal, 42)
            .padding(.bottom, 24)
    }
}

#Preview {
    SocialMediaIcons()
}
