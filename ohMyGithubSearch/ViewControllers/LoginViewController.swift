//
//  ViewController.swift
//  ohMyGithubSearch
//
//  Created by Milandr on 06.01.2021.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }

    @objc fileprivate func setupLogin() {
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    
    fileprivate func setupUI() {
        view.addSubview(loginButton)
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 64.0).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -64.0).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: view.frame.height / 16.0).isActive = true
        
        
    }
    
    fileprivate lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(setupLogin), for: .touchUpInside)
        return button
    }()
}
