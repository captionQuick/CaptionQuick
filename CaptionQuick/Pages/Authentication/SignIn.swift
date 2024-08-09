import SwiftUI

struct SignIn: View {
    @State private var email: String = ""
    @State private var showError: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColorMain")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
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
                                    .stroke(showError ? Color.red : Color.gray, lineWidth: 0.2)
                            )
                            .padding(.horizontal, 42)
                            .padding(.top, 32)
                       
                        if showError {
                            Text("You should enter a correct email address.")
                                .foregroundColor(.red)
                                .padding(.horizontal, 42)
                        }

                        Button(action: {
                            if isValidEmail(email) {
                                showError = false
                                // Navigate to SignInPassword
                            } else {
                                showError = true
                            }
                        }) {
                            Text("CONTINUE WITH EMAIL")
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
                        .padding(.top, 16)
                        
                        Text("Or SignIn with")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .padding(.bottom, 16)
                            .padding(.top, 16)
                        
                       SocialMediaIcons()
                        
                        NavigationLink(destination: SignUp()) {
                            Text("Don't have an account?")
                                .font(.system(size: 12))
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .underline()
                                .padding(.top, 8)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        Spacer()
                    } // VStack
                }
            }
        }
        .navigationBarHidden(true)
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}

#Preview {
    SignIn()
}

