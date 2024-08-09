//
//  AuthHeaderView.swift
//  CaptionQuick
//
//  Created by Peyman Osatian on 2024-08-09.
//

import SwiftUI

struct AuthHeaderView: View {
    var title : String
    var subtitle : String
    var body: some View {
        HStack {
                  VStack(alignment: .leading) {
                      Text(title)
                          .font(.largeTitle)
                          .fontWeight(.bold)
                          .foregroundColor(.white)
                          .padding(.leading, 42)
                      Text(subtitle)
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
    }
}

#Preview {
    AuthHeaderView(title: "Sign Up", subtitle: "Welcome to Caption Qucik")
}
