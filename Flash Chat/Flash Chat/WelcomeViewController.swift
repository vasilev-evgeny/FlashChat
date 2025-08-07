//
//  ViewController.swift
//  Flash Chat
//
//  Created by Евгений Васильев on 05.08.2025.
//

import UIKit

class WelcomeViewController: UIViewController {

    enum Constants {
        
    }
    
    //MARK: - Create UI
    
    let appLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .brandBlue
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    let registerButton : UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.brandBlue, for: .normal)
        button.backgroundColor = .brandLightBlue
        return button
    }()
    
    let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .brandBlue
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        animateLabel()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(appLabel)
        view.addSubview(registerButton)
        view.addSubview(loginButton)
    }
    
    //MARK: - Action Func
    
    func animateLabel() {
        appLabel.text = ""
        let titleText = "⚡️FlashChat"
        var charIndex = 0.0
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.appLabel.text?.append(letter)
            }
            charIndex += 1
        }
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

