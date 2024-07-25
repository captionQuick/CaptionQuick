import SwiftUI

struct OnboardingSlider: View {
    let sliderItems = [
        SliderItem(image: "notion-digital-journaling", title: "Craft Captions", description: "Generate engaging captions for any social media platform in over 50 languages."),
        SliderItem(image: "notion-working-with-computer-content-creator", title: "Plan Posts", description: "Schedule your captions in advance and keep track of posting dates easily."),
        SliderItem(image: "notion-using-computer-in-the-cafe-content-creator", title: "Save & Review", description: "Access your history of used and upcoming captions anytime, anywhere."),
        SliderItem(image: "notion-explaining-content-creator", title: "Customize Your Tone", description: "Set the tone of your captions to match your brand’s voice and mood."),
        SliderItem(image: "notion-using-computer-2", title: "Trend with Hashtags", description: "Boost visibility with SEO-driven hashtags tailored for your content.")
    ]
    
    var body: some View {
     
            ZStack {
                Image("SliderBG")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    //SLIDERVIEW
                    SliderView(sliderItems: sliderItems)
                    NavigationLink(destination: SignUp()) {
                        Text("Skip")
                            .font(.system(size: 22))
                            .fontWeight(.light)
                            .foregroundColor(.white)
                    } // NAVIGATIONLINK
                    .padding(.bottom, 20) // Adjust padding if needed
                }// VSTACK
            } //ZSTACK
            .navigationBarHidden(true)
        }
}

#Preview {
    OnboardingSlider()
}

