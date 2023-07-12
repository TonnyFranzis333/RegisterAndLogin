//
//  ViewController.swift
//  RegisterApp_Art
//
//  Created by  on 12/07/23.
//

import UIKit
import Toast_Swift
class ViewController: UIViewController {
    
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var genderTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var mobileTextField: UITextField!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    private var viewModel: RegistrationViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create an instance of the view model
        let user = User(firstName: "", lastName: "", gender: "", email: "", mobile: "")
        viewModel = RegistrationViewModel(user: user)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Clear the text fields
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        genderTextField.text = ""
        emailTextField.text = ""
        mobileTextField.text = ""
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        // Update the user model with the entered values
        viewModel.user.firstName = firstNameTextField.text ?? ""
        viewModel.user.lastName = lastNameTextField.text ?? ""
        viewModel.user.gender = genderTextField.text ?? ""
        viewModel.user.email = emailTextField.text ?? ""
        viewModel.user.mobile = mobileTextField.text ?? ""
        
        // Update the view model with the entered username and password
        viewModel.username = usernameTextField.text ?? ""
        viewModel.password = passwordTextField.text ?? ""
        
        var hasError = false
        
        // Validate the user input for empty fields
        if firstNameTextField.text?.isEmpty ?? true {
            view.makeToast("Please enter first name")
            hasError = true
            return
        }
        if lastNameTextField.text?.isEmpty ?? true {
            view.makeToast("Please enter last name")
            hasError = true
            return
        }
        if genderTextField.text?.isEmpty ?? true {
            view.makeToast("Please enter gender")
            hasError = true
            return
        }
        if emailTextField.text?.isEmpty ?? true {
            view.makeToast("Please enter email address")
            hasError = true
            return
        }
        if mobileTextField.text?.isEmpty ?? true {
            view.makeToast("Please enter mobile number")
            hasError = true
            return
        }
        if usernameTextField.text?.isEmpty ?? true {
            view.makeToast("Please enter username")
            hasError = true
            return
        }
        if passwordTextField.text?.isEmpty ?? true {
            view.makeToast("Please enter password")
            hasError = true
            return
        }
        
        // Validate the user input for each field
        if !viewModel.isFirstNameValid() {
            view.makeToast("Invalid first name")
            hasError = true
            return
        }
        if !viewModel.isLastNameValid() {
            view.makeToast("Invalid last name")
            hasError = true
            return
        }
        if !viewModel.isGenderValid() {
            view.makeToast("Invalid gender")
            hasError = true
            return
        }
        if !viewModel.isEmailValid() {
            view.makeToast("Invalid email address")
            hasError = true
            return
        }
        if !viewModel.isMobileValid() {
            view.makeToast("Invalid mobile number")
            hasError = true
            return
        }
        if !viewModel.isUsernameValid() {
            view.makeToast("Invalid username")
            hasError = true
            return
        }
        if !viewModel.isPasswordValid() {
            view.makeToast("Invalid password")
            hasError = true
            return
        }
        // Check if any field has an error
        if hasError {
            return
        }
        
        // Save user data if all validations pass
        viewModel.saveUserData()
        
        // Navigate to the LoginViewController
        if let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            navigationController?.pushViewController(loginViewController, animated: true)
        }
    }
    
}

