//
//  ViewController.swift
//  Flash Chat
//
//  Created by Евгений Васильев on 05.08.2025.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    enum Constants {
        
    }
    
    //MARK: - Create UI
    
    let appLabel : CLTypingLabel = {
        let label = CLTypingLabel()
        label.text = "⚡️FlashChat"
        label.textColor = .brandBlue
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    let registerButton : UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.brandBlue, for: .normal)
        button.backgroundColor = .brandLightBlue
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .brandBlue
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(appLabel)
        view.addSubview(registerButton)
        view.addSubview(loginButton)
    }
    
    //MARK: - Action Func
    
    @objc func registerButtonTapped() {
        let vc = RegisterViewController()
        navigationController?.navigationBar.isHidden = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginButtonTapped() {
        let vc = LoginViewController()
        navigationController?.navigationBar.isHidden = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - setConstraints
    
    private func setConstraints() {
        appLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: appLabel.bottomAnchor, constant: 250),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

