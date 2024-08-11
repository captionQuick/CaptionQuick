import SwiftUI

struct SignUp: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var emailError: String? = nil // State variable to hold the email error message
    @State private var passwordStrength: PasswordStrength? = nil // Optional state variable to hold password strength
    @State private var showPasswordValidation: Bool = false // State to control when to show validation
    @State private var isPasswordVisible: Bool = false // State for password visibility

    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColorMain")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            AuthHeaderView(title: "Sign Up", subtitle: "Welcome to Caption Quick")
                        }
                    }
                    .padding(.top, 85)
                    Spacer()
                    VStack(spacing: 16) {
                        // Email Field with Validation
                        ValidatedTextField(text: $email, placeholder: "Enter your Email")
                            .padding()
                            .frame(height: 52)
                            .background(Color.clear) // Transparent background
                            .overlay(
                                RoundedRectangle(cornerRadius: 44)
                                    .stroke(emailError == nil ? Color.gray : Color.red, lineWidth: 0.2) // Change border color based on validation
                            )
                            .padding(.horizontal, 42)
                        
                        if let error = emailError { // Show error message if email is invalid
                            Text(error)
                                .padding(.leading, 42)
                                .font(.footnote)
                                .foregroundColor(.yellow) // Font color for error message
                        }
                        
                        // Password Field with Validation
                        ZStack {
                            ValidatedPasswordField(text: $password, placeholder: "Enter your Password", isPasswordVisible: $isPasswordVisible)
                                .padding()
                                .frame(height: 52)
                                .background(Color.clear) // Transparent background
                                .overlay(
                                    RoundedRectangle(cornerRadius: 44)
                                        .stroke(borderColor(for: passwordStrength), lineWidth: 0.2)
                                )
                                .padding(.horizontal, 42)

                            HStack {
                                Spacer()
                                Button(action: {
                                    isPasswordVisible.toggle()
                                }) {
                                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                        .foregroundColor(.gray)
                                }
                                .padding(.trailing,64)
                            }
                        }

                        // Password strength status text
                        if showPasswordValidation, let strength = passwordStrength {
                            Text(passwordStatusText(for: strength))
                                .font(.footnote)
                                .foregroundColor(borderColor(for: strength))
                                .padding(.leading, 42)
                        }

                        Text("Or SignUp with")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .padding(.bottom, 16)
                            .padding(.top, 16)
                        
                        HStack(spacing: 32) {
                          SocialMediaIcons()
                        }
                        .padding(.horizontal, 42)
                        .padding(.bottom, 24)
                        
                        Button(action: {
                            // Validate email and password when user presses the sign-up button
                            emailError = validateEmail(email)
                            passwordStrength = evaluatePasswordStrength(password)
                            showPasswordValidation = true
                            
                            // Only proceed if email is valid and password is not weak
                            if emailError == nil && passwordStrength != .weak {
                                // Action for create account button
                            }
                        }) {
                            Text("CREATE ACCOUNT")
                                .fontWeight(.bold)
                                .font(.system(size: 14))
                                .frame(height: 16)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(44)
                        }
                        .padding(.horizontal, 42)
                        
                        NavigationLink(destination: SignIn()) {
                            Text("Already have an account")
                                .font(.system(size: 14))
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
    
    // Function to validate the email format
    func validateEmail(_ email: String) -> String? {
        // Basic email validation regex
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email) ? nil : "Please enter a valid email address."
    }
    
    // Function to evaluate password strength
    func evaluatePasswordStrength(_ password: String) -> PasswordStrength {
        let length = password.count
        
        if length < 6 {
            return .weak
        } else if length < 10 {
            return .medium
        } else {
            return .strong
        }
    }
    
    // Function to get border color based on password strength
    func borderColor(for strength: PasswordStrength?) -> Color {
        guard let strength = strength else {
            return .gray // Default border color
        }
        switch strength {
        case .weak:
            return .red
        case .medium:
            return .yellow
        case .strong:
            return .green
        }
    }
    
    // Function to get password status text
    func passwordStatusText(for strength: PasswordStrength) -> String {
        switch strength {
        case .weak:
            return "Password strength: Weak"
        case .medium:
            return "Password strength: Medium"
        case .strong:
            return "Password strength: Strong"
        }
    }
}

// Enum to represent password strength levels
enum PasswordStrength {
    case weak, medium, strong
}

struct ValidatedTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.white)
                    .font(.footnote) // Set placeholder text color to white
                    .padding(.leading, 5)
            }
            TextField("", text: $text)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .background(Color.clear)
                .cornerRadius(8)
                .foregroundColor(.white)
        }
    }
}

struct ValidatedPasswordField: View {
    @Binding var text: String
    var placeholder: String
    @Binding var isPasswordVisible: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.white)
                    .font(.footnote) // Set placeholder text color to white
                    .padding(.leading, 5)
            }
            if isPasswordVisible {
                TextField("", text: $text)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color.clear)
                    .cornerRadius(8)
                    .foregroundColor(.white)
            } else {
                SecureField("", text: $text)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color.clear)
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    SignUp()
}
