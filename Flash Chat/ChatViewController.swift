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
        field.backgroundColor = .white
        return field
    }()
    
    let sendButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let messageTableView : UITableView = {
        let view = UITableView()
        view.rowHeight = 50
        view.backgroundColor = .white
        return view
    }()
    
    //MARK: - Set Delegates
    
    func setDelegates() {
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MessageCell")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    private func setupViews() {
        view.backgroundColor = .brandPurple
        view.addSubview(messageTextField)
        view.addSubview(sendButton)
        view.addSubview(messageTableView)
    }
    
    //MARK: - setConstraints
    
    private func setConstraints() {
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
            messageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            messageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -20),
            messageTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sendButton.heightAnchor.constraint(equalToConstant: 50),
            sendButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        messageTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            messageTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messageTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            messageTableView.bottomAnchor.constraint(equalTo: messageTextField.topAnchor, constant: -15)
        ])
    }
}

//MARK: - Extension TableView

extension ChatViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        cell.textLabel?.text = "ogo way"
        cell.textLabel?.numberOfLines = 0
        cell.backgroundColor = .clear
        return cell
    }
}
