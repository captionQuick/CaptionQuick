//
//  ValidateEmail.swift
//  CaptionQuick
//
//  Created by Peyman Osatian on 2024-08-11.
//

import Foundation
@State private var isEmailValid: Bool = true // State to track email validation
@State private var showError: Bool = false // State to show or hide error message
@State private var email: String = ""
func validateEmail() {
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    isEmailValid = emailPredicate.evaluate(with: email)
    showError = !isEmailValid
}
