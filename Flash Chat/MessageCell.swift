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
        label.textColor = .brandLightPurple
        return label
    }()
    
    let avatarView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "MeAvatar")
        return view
    }()
    
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
            messageBubble.layer.cornerRadius = messageBubble.bounds.height / 7
        }
    
    
    // MARK: - Setup
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(messageBubble)
        messageBubble.addSubview(messageLabel)
        addSubview(avatarView)
    }
    
    private func setupConstraints() {
        messageBubble.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageBubble.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            messageBubble.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            messageBubble.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            messageBubble.trailingAnchor.constraint(lessThanOrEqualTo: avatarView.leadingAnchor, constant: -8),
            
            messageLabel.topAnchor.constraint(equalTo: messageBubble.topAnchor, constant: 8),
            messageLabel.bottomAnchor.constraint(equalTo: messageBubble.bottomAnchor, constant: -8),
            messageLabel.leadingAnchor.constraint(equalTo: messageBubble.leadingAnchor, constant: 12),
            messageLabel.trailingAnchor.constraint(equalTo: messageBubble.trailingAnchor, constant: -12),
            
            avatarView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            avatarView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            avatarView.widthAnchor.constraint(equalToConstant: 40),
            avatarView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
