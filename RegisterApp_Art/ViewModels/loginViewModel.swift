//
//  loginViewModel.swift
//  RegisterApp_Art
//
//  Created by  on 12/07/23.
//

import Foundation
class LoginViewModel {
    var username: String = ""
    var password: String = ""
    func retrieveCredentials() -> (username: String?, password: String?) {
        // Retrieve the username and password from local storage (UserDefaults)
        let username = UserDefaults.standard.string(forKey: "username")
        let password = UserDefaults.standard.string(forKey: "password")
        return (username, password)
    }
    
    func clearCredentials() {
        // Clear the stored username and password from local storage (UserDefaults)
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "password")
    }
    
    func validateCredentials() -> Bool {
        let storedCredentials = retrieveCredentials()
        if let storedUsername = storedCredentials.username, let storedPassword = storedCredentials.password {
            return storedUsername == username && storedPassword == password
        }
        return false
    }
}
