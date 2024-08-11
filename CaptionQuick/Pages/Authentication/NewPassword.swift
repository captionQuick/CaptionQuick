import SwiftUI

struct NewPassword: View {
    
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPasswordVisible: Bool = false // New state for toggling visibility
    @State private var isConfirmPasswordVisible: Bool = false // State for confirm password visibility
    
    var body: some View {
        ZStack{
            Color("BackgroundColorMain")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading){
                        AuthHeaderView(title: "New Password", subtitle: "Enter your new password")
                    }
                }
                .padding(.top, 85)
                Spacer()
                VStack(spacing: 16) {
                    ZStack(alignment: .leading) {
                        if password.isEmpty {
                            Text("Enter new password")
                                .foregroundColor(Color.white)
                                .padding(.leading, 42)
                                .font(.system(size: 12))
                        }
                        if isPasswordVisible {
                            TextField("", text: $password)
                                .foregroundColor(.white)
                                .padding()
                                .frame(height: 52)
                                .background(Color.clear)
                        } else {
                            SecureField("", text: $password)
                                .foregroundColor(.white)
                                .padding()
                                .frame(height: 52)
                                .background(Color.clear)
                        }
                        HStack {
                            Spacer()
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 16)
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 44)
                            .stroke(Color.gray, lineWidth: 0.2)
                    )
                    .padding(.horizontal, 42)
                    
                    ZStack(alignment: .leading) {
                        if confirmPassword.isEmpty {
                            Text("Confirm new password")
                                .foregroundColor(Color.white)
                                .padding(.leading, 42)
                                .font(.system(size: 12))
                        }
                        if isConfirmPasswordVisible {
                            TextField("", text: $confirmPassword)
                                .foregroundColor(.white)
                                .padding()
                                .frame(height: 52)
                                .background(Color.clear)
                        } else {
                            SecureField("", text: $confirmPassword)
                                .foregroundColor(.white)
                                .padding()
                                .frame(height: 52)
                                .background(Color.clear)
                        }
                        HStack {
                            Spacer()
                            Button(action: {
                                isConfirmPasswordVisible.toggle()
                            }) {
                                Image(systemName: isConfirmPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 16)
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 44)
                            .stroke(Color.gray, lineWidth: 0.2)
                    )
                    .padding(.horizontal, 42)

                    Button(action: {
                        // Action for save button
                    }) {
                        Text("SAVE")
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
                    .padding(.top, 32)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    NewPassword()
}
