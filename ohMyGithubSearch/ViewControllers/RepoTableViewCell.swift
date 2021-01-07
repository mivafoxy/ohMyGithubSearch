//
//  RepoTableViewCell.swift
//  ohMyGithubSearch
//
//  Created by Milandr on 07.01.2021.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(authorName: String, userImageLink: String, repoName: String, repoDescription: String) {
        self.authorName.text = authorName
        self.authorName.sizeToFit()
        
        // Load image...
        
        self.repoName.text = repoName
        self.repoName.sizeToFit()
        
        self.repoDescription.text = repoDescription
        self.repoDescription.sizeToFit()
    }
    
    fileprivate func setupUi() {
        addSubview(repoName)
        
        repoName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0).isActive = true
        repoName.topAnchor.constraint(equalTo: self.topAnchor, constant: 16.0).isActive = true
        
        repoName.text = "Repo name"
        repoName.sizeToFit()

        addSubview(repoDescription)

        repoDescription.topAnchor.constraint(equalTo: repoName.bottomAnchor, constant: 8.0).isActive = true
        repoDescription.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0).isActive = true

        repoDescription.text = "Repo description"
        repoDescription.sizeToFit()
        
        addSubview(authorName)
        
        authorName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0).isActive = true
        authorName.topAnchor.constraint(equalTo: self.topAnchor, constant: 16.0).isActive = true
        
        authorName.text = "Author Name"
        authorName.sizeToFit()
        
        addSubview(userImage)

        userImage.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 8.0).isActive = true
        userImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: self.frame.width / 6.0).isActive = true
        userImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8.0).isActive = true

        userImage.backgroundColor = .red
    }
    
    fileprivate lazy var repoName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16.0)
        return label
    }()
    
    fileprivate lazy var repoDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12.0)
        return label
    }()
    
    fileprivate lazy var authorName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10.0)
        return label
    }()
    
    fileprivate lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
}
