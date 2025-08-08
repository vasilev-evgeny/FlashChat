//
//  RegisterViewController.swift
//  Flash Chat
//
//  Created by Евгений Васильев on 07.08.2025.
//
import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController : UIViewController {
    enum Constants {
        
    }
    
    //MARK: - Create UI
    
    let emailTextField : UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.textAlignment = .center
        field.textColor = .systemGray
        field.layer.cornerRadius = 25
        field.backgroundColor = .white
        field.autocapitalizationType = .none
        field.layer.shadowColor = UIColor.black.cgColor
        field.layer.shadowOpacity = 0.5
        field.layer.shadowRadius = 15
        return field
    }()
    
    let passwordTextField : UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.textAlignment = .center
        field.textColor = .systemGray
        field.layer.cornerRadius = 25
        field.backgroundColor = .white
        field.autocapitalizationType = .none
        field.layer.shadowColor = UIColor.black.cgColor
        field.layer.shadowOpacity = 0.5
        field.layer.shadowRadius = 15
        field.isSecureTextEntry = true
        return field
    }()
    
    let registerButton : UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.brandBlue, for: .normal)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Action Func
    
    @objc func registerButtonTapped() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let alert = UIAlertController(
                        title: "Ошибка регистрации",
                        message: e.localizedDescription,
                        preferredStyle: .alert
                    )
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                } else {
                    let vc = ChatViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .brandLightBlue
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
    }
    
    //MARK: - setConstraints
    
    private func setConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 72),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -72),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
