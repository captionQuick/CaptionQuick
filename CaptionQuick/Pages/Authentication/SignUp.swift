import SwiftUI

struct SignUp: View {
    @State private var email: String = ""
    @State private var password: String = ""
    // Form Validating
    @State private var emailError: String? = nil // State variable to hold the error message
    
    var body: some View {
        NavigationView  {
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
                        //----------------------//
                            .onChange(of: email) { newValue in
                                emailError = validateEmail(newValue)
                            }
                        if let error = emailError { // Show error message if email is invalid
                            Text(error)
                                .padding(.leading,-42)
                                .font(.footnote)
                                .foregroundColor(.yellow) // Font color for error message
                        }
                        // Password Field (no validation added here)
                        ValidatedTextField(text: $password, placeholder: "Enter your Password")
                            .padding()
                            .frame(height: 52)
                            .background(Color.clear) // Transparent background
                            .overlay(
                                RoundedRectangle(cornerRadius: 44)
                                    .stroke(Color.gray, lineWidth: 0.2)
                            )
                            .padding(.horizontal, 42)
                        Text("Or SignUp with")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .padding(.bottom, 16)
                            .padding(.top, 16)
                        
                        HStack(spacing: 32) {
                            Image("Google")
                                .resizable()
                                .frame(width: 42, height: 42)
                                .foregroundColor(.blue)
                            
                            Image("Facebook")
                                .resizable()
                                .frame(width: 42, height: 42)
                                .foregroundColor(.blue)
                        }
                        .padding(.horizontal, 42)
                        .padding(.bottom, 24)
                        
                        Button(action: {
                            // Action for create account button
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
    
    // Function to validate the email format
    func validateEmail(_ email: String) -> String? {
        // Basic email validation regex
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email) ? nil : "Please enter a valid email address."
    }
}

struct ValidatedTextField: View { // Renamed from CustomTextField
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.white)
                    .font(.footnote)// Set placeholder text color to white
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

#Preview {
    SignUp()
}

