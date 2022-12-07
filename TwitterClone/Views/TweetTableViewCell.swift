//
//  TweetTableViewCell.swift
//  TwitterClone
//
//  Created by Rıdvan Yılmaz on 7.12.2022.
//

import UIKit

protocol TweetTableViewCellDelegate: AnyObject {
    
    func tweetTableViewCellDidTapReply()
    func tweetTableViewCellDidTapRetweet()
    func tweetTableViewCellDidTapLike()
    func tweetTableViewCellDidTapShare()
}

class TweetTableViewCell: UITableViewCell {
    
    static let identifier = "TweetTableViewCell"
    
    weak var delegate: TweetTableViewCellDelegate?
    
    private let actionSpacing: CGFloat = 50
    
    private let avatarImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let displayName: UILabel = {
        
        let label = UILabel()
        label.text = "Rıdvan Yılmaz"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "@ridvanyilmaz"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tweetTextContentLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "this is my first tweet. all animals are equal but some animals are more equal. this sentence is from animal farm from george orwell."
        label.numberOfLines = 0
        return label
        
    }()
    
    private let replyButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        button.tintColor = .systemGray2
        return button
        
    }()
    
    private let retweetButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.tintColor = .systemGray2
        return button
        
    }()
    
    private let likeButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemGray2
        return button
        
    }()
    
    private let shareButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemGray2
        return button
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayName)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(tweetTextContentLabel)
        contentView.addSubview(replyButton)
        contentView.addSubview(retweetButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
        
        configureConstraints()
        configureButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    private func configureConstraints() {
        let avatarImageViewConstraints = [
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50)
        ]
        let displayNameConstraints = [
            displayName.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 5),
            displayName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14)
        ]
        
        let usernameLabelConstraints = [
            usernameLabel.leadingAnchor.constraint(equalTo: displayName.trailingAnchor, constant: 5),
            usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14)
        ]
        
        let tweetTextContectLabelConstraints = [
            tweetTextContentLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 5),
            tweetTextContentLabel.topAnchor.constraint(equalTo: displayName.bottomAnchor, constant: 5),
            tweetTextContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ]
        
        let replyButtonConstraints = [
            replyButton.leadingAnchor.constraint(equalTo: tweetTextContentLabel.leadingAnchor),
            replyButton.topAnchor.constraint(equalTo: tweetTextContentLabel.bottomAnchor, constant: 10),
            replyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  10)
        ]
        
        let retweetButtonConstraints = [
            
            retweetButton.leadingAnchor.constraint(equalTo: replyButton.trailingAnchor, constant: actionSpacing),
            retweetButton.topAnchor.constraint(equalTo: tweetTextContentLabel.bottomAnchor, constant: 10),
            retweetButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  10)
        ]
        
        let likeButtonConstraints = [
            
            likeButton.leadingAnchor.constraint(equalTo: retweetButton.trailingAnchor, constant: actionSpacing),
            likeButton.topAnchor.constraint(equalTo: tweetTextContentLabel.bottomAnchor, constant: 10),
            likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  10)
        ]
        
        let shareButtonConstraints = [
            
            shareButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: actionSpacing),
            shareButton.topAnchor.constraint(equalTo: tweetTextContentLabel.bottomAnchor, constant: 10),
            shareButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  10)
        ]
        
        NSLayoutConstraint.activate(avatarImageViewConstraints)
        NSLayoutConstraint.activate(displayNameConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(tweetTextContectLabelConstraints)
        NSLayoutConstraint.activate(replyButtonConstraints)
        NSLayoutConstraint.activate(retweetButtonConstraints)
        NSLayoutConstraint.activate(likeButtonConstraints)
        NSLayoutConstraint.activate(shareButtonConstraints)
        
    }
    
    func configureButtons() {
        
        replyButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
        retweetButton.addTarget(self, action: #selector(didTapRetweet), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
        
    }
    
    @objc private func didTapReply() {
        delegate?.tweetTableViewCellDidTapReply()
    }
    
    @objc private func didTapRetweet() {
        delegate?.tweetTableViewCellDidTapRetweet()
    }
    
    @objc private func didTapLike() {
        delegate?.tweetTableViewCellDidTapLike()
    }
    
    @objc private func didTapShare() {
        delegate?.tweetTableViewCellDidTapShare()
    }

}
