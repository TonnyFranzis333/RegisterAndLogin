//
//  RegistrationViewModel.swift
//  RegisterApp_Art
//
//  Created by  on 12/07/23.
//

import Foundation
class RegistrationViewModel {
    var user: User
    var username: String = ""
    var password: String = ""
    
    init(user: User) {
        self.user = user
    }
    
    func isFirstNameValid() -> Bool {
        let trimmedFirstName = user.firstName.trimmingCharacters(in: .whitespacesAndNewlines)
        return !trimmedFirstName.isEmpty
    }
    
    func isLastNameValid() -> Bool {
        let trimmedLastName = user.lastName.trimmingCharacters(in: .whitespacesAndNewlines)
        return !trimmedLastName.isEmpty
    }
    
    func isGenderValid() -> Bool {
        let trimmedGender = user.gender.trimmingCharacters(in: .whitespacesAndNewlines)
        return !trimmedGender.isEmpty
    }
    
    func isEmailValid() -> Bool {
        let trimmedEmail = user.email.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: trimmedEmail)
    }
    
    func isMobileValid() -> Bool {
        let trimmedMobile = user.mobile.trimmingCharacters(in: .whitespacesAndNewlines)
        let mobileRegex = "[0-9]{10}"
        let mobilePredicate = NSPredicate(format: "SELF MATCHES %@", mobileRegex)
        return mobilePredicate.evaluate(with: trimmedMobile)
    }
    
    func isUsernameValid() -> Bool {
        let trimmedUsername = username.trimmingCharacters(in: .whitespacesAndNewlines)
        return !trimmedUsername.isEmpty
    }
    
    func isPasswordValid() -> Bool {
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        return !trimmedPassword.isEmpty
    }
    
    func saveUserData() {
        // Store the user data in local storage (e.g., UserDefaults)
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
    }
}
