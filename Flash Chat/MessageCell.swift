//
//  Cell.swift
//  Flash Chat
//
//  Created by Евгений Васильев on 08.08.2025.
//
import UIKit

class MessageCell: UITableViewCell {
    
    // MARK: - UI Elements
    let messageBubble: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.backgroundColor = .brandPurple
        return view
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let avatarMeView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "MeAvatar")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    let avatarYouView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "YouAvatar")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    // MARK: - Constraints
    private var bubbleLeadingConstraint: NSLayoutConstraint!
    private var bubbleTrailingConstraint: NSLayoutConstraint!
    private var bubbleWidthConstraint: NSLayoutConstraint!
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        messageBubble.layer.cornerRadius = messageBubble.frame.height / 4
        self.isUserInteractionEnabled = false
    }
    
    // MARK: - Setup
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(messageBubble)
        messageBubble.addSubview(messageLabel)
        addSubview(avatarMeView)
        addSubview(avatarYouView)
    }
    
    private func setupConstraints() {
        messageBubble.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarMeView.translatesAutoresizingMaskIntoConstraints = false
        avatarYouView.translatesAutoresizingMaskIntoConstraints = false
        
        // Аватар получателя
        avatarYouView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        avatarYouView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        avatarYouView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarYouView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // Аватар отправителя
        avatarMeView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        avatarMeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        avatarMeView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarMeView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // Пузырь сообщения (базовые constraints)
        messageBubble.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        messageBubble.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        bubbleWidthConstraint = messageBubble.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width * 0.9)
        bubbleWidthConstraint.isActive = true
        
        bubbleLeadingConstraint = messageBubble.leadingAnchor.constraint(equalTo: avatarYouView.trailingAnchor, constant: 8)
        bubbleTrailingConstraint = messageBubble.trailingAnchor.constraint(equalTo: avatarMeView.leadingAnchor, constant: -8)
        
        // Текст сообщения
        messageLabel.topAnchor.constraint(equalTo: messageBubble.topAnchor, constant: 8).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: messageBubble.bottomAnchor, constant: -8).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: messageBubble.leadingAnchor, constant: 12).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: messageBubble.trailingAnchor, constant: -12).isActive = true
    }
    
    // MARK: - Configuration
    func configure(with message: Message, isCurrentUser: Bool) {
        messageLabel.text = message.body
        
        if isCurrentUser {
            // Сообщение от текущего пользователя (справа)
            avatarYouView.isHidden = true
            avatarMeView.isHidden = false
            messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            messageLabel.textColor = UIColor(named: K.BrandColors.purple)
            
            bubbleLeadingConstraint.isActive = false
            bubbleTrailingConstraint.isActive = true
        } else {
            // Сообщение от другого пользователя (слева)
            avatarYouView.isHidden = false
            avatarMeView.isHidden = true
            messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            messageLabel.textColor = UIColor(named: K.BrandColors.lightPurple)
            
            bubbleTrailingConstraint.isActive = false
            bubbleLeadingConstraint.isActive = true
        }
        
        // Обновляем constraints
        layoutIfNeeded()
    }
}
