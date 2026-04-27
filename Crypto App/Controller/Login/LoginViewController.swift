//
//  LoginViewController.swift
//  Crypto App
//
//  Created by Yusuf Çon on 17.07.2024.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForgotPassword()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // segue.identifier --> segue ıcın TC kımlık no
        //segue.destination --> gidilecek sayfa
        
        // segue.destination.navigationItem.title = userNameTextField.text
        //segue.destination.navigationItem.title = SignUpPasswordTextField.text
        
        
    }
    
    @IBAction func tapLoginButton(_ sender: UIButton)
    {
       //  performSegue(withIdentifier: "goNextLogin", sender: nil)
        if userNameTextField.text != "" && passwordTextField.text != "" {
        Auth.auth().signIn(withEmail: userNameTextField.text!, password: passwordTextField.text!) {(authdata, error) in
        if error != nil {
        self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
        } else {
//        self.performSegue(withIdentifier: "goNextLogin", sender: nil)
            // Navigate only after successful login
            DispatchQueue.main.async {
                let vc: ListViewController = ListViewController(nibName: "ListViewController", bundle: nil)
                self.navigationController?.setViewControllers([vc], animated: true)
            }
        }
        }
        } else {
        makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }
    }
    
    func makeAlert(titleInput:String, messageInput:String) {
    let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle:
    UIAlertController.Style.alert)
    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
    alert.addAction(okButton)
    self.present(alert, animated: true, completion: nil)
    }
    
    private func setupUI() {
        
    }
    @objc private func signoutButtonTapped() {
        let vc: MenuViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
        self.navigationController?.setViewControllers([vc], animated: true)
    }
    
    private func setupForgotPassword() {
        forgotPasswordLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordTapped))
        forgotPasswordLabel.addGestureRecognizer(tap)
    }
    
    @objc private func forgotPasswordTapped() {
        let alert = UIAlertController(title: "Reset Password", message: "Enter your email to receive reset link", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Email"
            textField.keyboardType = .emailAddress
            textField.autocorrectionType = .no
            textField.autocapitalizationType = .none
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Send", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            let email = alert.textFields?.first?.text ?? ""
            guard email.isEmpty == false else {
                self.makeAlert(titleInput: "Error!", messageInput: "Email is required")
                return
            }
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error = error {
                    self.makeAlert(titleInput: "Error!", messageInput: error.localizedDescription)
                } else {
                    self.makeAlert(titleInput: "Success", messageInput: "Password reset email sent")
                }
            }
        }))
        present(alert, animated: true)
    }
    
}
        
