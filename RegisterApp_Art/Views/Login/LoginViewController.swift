//
//  LoginViewController.swift
//  RegisterApp_Art
//
//  Created by  on 12/07/23.
//

import UIKit
import Toast_Swift
class LoginViewController: UIViewController {
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    private var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create an instance of the view model
        viewModel = LoginViewModel()
        
//        // Retrieve stored credentials and pre-fill the fields
//        let credentials = viewModel.retrieveCredentials()
//        usernameTextField.text = credentials.username
//        passwordTextField.text = credentials.password
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Clear the text fields
        
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // Update the view model with the entered credentials
        viewModel.username = usernameTextField.text ?? ""
        viewModel.password = passwordTextField.text ?? ""
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if username.isEmpty {
            view.makeToast("Please enter username")
            return
        }
        if password.isEmpty {
            view.makeToast("Please enter password")
            return
        }
        // Validate the credentials
        if viewModel.validateCredentials() {
            if let loginViewController = storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController {
                navigationController?.pushViewController(loginViewController, animated: true)
            }
        } else {
            view.makeToast("invalid credentials")
        }
    }
    
}
