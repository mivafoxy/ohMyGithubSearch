//
//  ViewController.swift
//  ohMyGithubSearch
//
//  Created by Milandr on 28.12.2020.
//

import UIKit
import Kingfisher // Добавлена в проект зависимость Kingfisher при помощи Carthage

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupUI()
        loadGitHubImage()
    }

    fileprivate func loadGitHubImage() { // Установлен логотип GitHub в UIImageView при помощи Kingfisher
        let url = URL(string: "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png")
        userImage.kf.setImage(with: url)
    }
    
    @objc fileprivate func callToSearchRepository() {
        let queryService = QueryService()
        
        let repositoryName = repositoryNameField.text ?? ""
        let language = passwordField.text ?? ""
        let order = orderControl.selectedSegmentIndex == 0
        
        guard let request =
                queryService.searchRepository(
                    repositoryName: repositoryName,
                    language: language,
                    ordered: order) else {
            print("url request error")
            return
        }
        
        let dataTask = queryService.defaultSession.dataTask(with: request)
        dataTask.resume()
    }
    
    fileprivate func setupUI() {
        view.addSubview(helloLabel)
        
        helloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(userImage)
        
        userImage.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 32).isActive = true
        userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: view.bounds.width / 3.0).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: view.bounds.height / 5.0).isActive = true
        
        userImage.layer.cornerRadius = view.bounds.height / 10.0
        userImage.layer.masksToBounds = true
        
        view.addSubview(searchLabel)
        
        searchLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 32.0).isActive = true
        searchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(repositoryNameField)
        
        repositoryNameField.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: 16.0).isActive = true
        repositoryNameField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 48.0).isActive = true
        repositoryNameField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -48.0).isActive = true
        repositoryNameField.heightAnchor.constraint(equalToConstant: view.frame.height / 16.0).isActive = true
        
        repositoryNameField.borderStyle = .roundedRect
        
        view.addSubview(passwordField)
        
        passwordField.topAnchor.constraint(equalTo: repositoryNameField.bottomAnchor, constant: 8.0).isActive = true
        passwordField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 48.0).isActive = true
        passwordField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -48.0).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: view.frame.height / 16.0).isActive = true
        
        passwordField.borderStyle = .roundedRect
        
        view.addSubview(orderControl)
        
        orderControl.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16.0).isActive = true
        orderControl.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 48.0).isActive = true
        orderControl.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -48.0).isActive = true
        orderControl.heightAnchor.constraint(equalToConstant: view.frame.height / 16.0).isActive = true
        
        view.addSubview(searchButton)
        
        searchButton.topAnchor.constraint(equalTo: orderControl.bottomAnchor, constant: 32.0).isActive = true
        searchButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 64.0).isActive = true
        searchButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -64.0).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: view.frame.height / 16.0).isActive = true
    }
    
    // UI Elements
    
    fileprivate lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
        label.sizeToFit()
        return label
    }()
    
    fileprivate lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    fileprivate lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Search repository"
        label.sizeToFit()
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    fileprivate lazy var repositoryNameField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "repository name"
        return textField
    }()
    
    fileprivate lazy var passwordField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "language"
        return textField
    }()
    
    fileprivate lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(callToSearchRepository), for: .touchUpInside)
        return button
    }()
    
    fileprivate lazy var orderControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["ascended", "descended"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
}

