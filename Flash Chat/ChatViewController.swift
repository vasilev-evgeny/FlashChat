//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by Евгений Васильев on 07.08.2025.
//
import UIKit

class ChatViewController : UIViewController {
    enum Constants {
        
    }
    
    //MARK: - Create UI
    
    let messageTextField : UITextField = {
        let field = UITextField()
        field.textAlignment = .left
        field.placeholder = "Write your message..."
        field.layer.cornerRadius = 5
        return field
    }()
    
    let sendButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .brandPurple
        view.addSubview(messageTextField)
        view.addSubview(sendButton)
    }
    
    //MARK: - setConstraints
    
    private func setConstraints() {
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        messageTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
        messageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        messageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: 20),
        messageTextField.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 50),
        ])
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sendButton.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 50),
            sendButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
