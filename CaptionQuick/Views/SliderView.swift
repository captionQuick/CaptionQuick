//
//  SliderView.swift
//  CaptionQuick
//
//  Created by Peyman Osatian on 2024-07-21.
//

import SwiftUI


struct SliderView: View {
    // MARK : - PROPERTIES
    var sliderItems :[SliderItem]
    var body: some View {
        ZStack {
            Image("SliderBG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            TabView {
                ForEach(sliderItems) { item in
                    VStack  {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 270, height: 350)
                        Text(item.title)
                            .font(.system(size: 30))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                            .padding(.bottom,16)
                        Text(item.description)
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .lineSpacing(10)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 160)
                            .padding(.horizontal, 24)
                            .lineLimit(nil)
                    } // VSTACK
                    
                } // FOREACH
                
            } //TABVIEW
            .padding(.bottom, 200)
        } // ZSTACK
        .tabViewStyle(PageTabViewStyle())
        .frame(height: UIScreen.main.bounds.height * 0.75)
    }
}
#Preview {
    SliderView(sliderItems:[SliderItem(image: "notion-digital-journaling", title: "Craft Captions", description: "Generate engaging captions for any social media platform in over 50 languages."),
               SliderItem(image: "notion-working-with-computer-content-creator", title: "Plan Posts", description: "Schedule your captions in advance and keep track of posting dates easily."),
               SliderItem(image: "notion-using-computer-in-the-cafe-content-creator", title: "Save & Review", description: "Access your history of used and upcoming captions anytime, anywhere."),
                SliderItem(image: "notion-explaining-content-creator", title: "Customize Your Tone", description: "Set the tone of your captions to match your brand’s voice and mood."),
                            SliderItem(image: "notion-using-computer-2", title: "Trend with Hashtags", description: "Boost visibility with SEO-driven hashtags tailored for your content.")
                            
])
}
