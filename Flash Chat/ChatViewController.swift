//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by Евгений Васильев on 07.08.2025.
//
import UIKit
import Firebase
import FirebaseAuth

class ChatViewController : UIViewController {
    
    enum Constants {
        
    }
    
    var message : [Message] = [
        Message(sender: "1@mail.ru", body: "Heloo ahsdh"),
        Message(sender: "ggwtasd@mail.ru", body: "Want some?"),
        Message(sender: "dfas@mail.ru", body: "No way u ahsdhNo way u ahsdhNo way u ahsdhNo way u ahsdhNo way u ahsdhNo way u ahsdhNo way u ahsdhNo way u ahsdhNo way u ahsdhNo way u ahsdhNo way u ahsdhNo way u ahsdh"),
    ]
    
    let db = Firestore.firestore()
    
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
        button.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let messageTableView : UITableView = {
        let view = UITableView()
        view.rowHeight = 50
        view.backgroundColor = .white
        view.separatorStyle = .none
        view.rowHeight = UITableView.automaticDimension
        return view
    }()
    
    //MARK: - Set Delegates
    
    func setDelegates() {
        messageTableView.delegate = self
          messageTableView.dataSource = self
          messageTableView.register(MessageCell.self, forCellReuseIdentifier: "MessageCell")
    }
    
    //MARK: - Action Func
    
    private func setupNavigationBar() {
        let rightButton = UIBarButtonItem(
            title: "Выйти",
            style: .plain,
            target: self,
            action: #selector(rightBarButtonTapped)
        )
        rightButton.tintColor = .white
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.hidesBackButton = true
    }
    
    @objc func rightBarButtonTapped() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
          navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    @objc func sendButtonTapped() {
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(<#T##collectionPath: String##String#>)
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        setDelegates()
        setupNavigationBar()
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
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        cell.messageLabel.text = message[indexPath.item].body
        return cell
    }
}
