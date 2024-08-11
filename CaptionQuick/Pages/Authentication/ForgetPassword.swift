import SwiftUI

struct ForgetPassword: View {
    @State private var email: String = ""
    @State private var isEmailValid: Bool = true // State to track email validation
    @State private var showError: Bool = false // State to show or hide error message
    
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
                    VStack(alignment: .leading) {
                        CustomTextField(text: $email, placeholder: "Enter your Email Address")
                            .padding()
                            .frame(height: 52)
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 44)
                                    .stroke(isEmailValid ? Color.gray : Color.red, lineWidth: 0.2)
                            )
                            .padding(.horizontal, 42)
                        
                        // Error message
                        if showError {
                            Text("Please enter a valid email address.")
                                .font(.system(size: 12))
                                .foregroundColor(.red)
                                .padding(.top, 4)
                                .padding(.horizontal, 42)
                        }
                    }
                    
                    Text("By submitting your email your will get a verification code that you need to use it in next step.")
                        .font(.system(size: 14))
                        .fontWeight(.light)
                        .padding(.leading,42)
                        .padding(.trailing, 42)
                        .foregroundColor(.white)
                        .padding(.bottom,72)
                    
                    Button(action: {
                        validateEmail()
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
    
    // Function to validate email format
    func validateEmail() {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        isEmailValid = emailPredicate.evaluate(with: email)
        showError = !isEmailValid
    }
}

#Preview {
    ForgetPassword()
}
