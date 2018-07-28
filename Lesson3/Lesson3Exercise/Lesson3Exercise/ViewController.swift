//
//  ViewController.swift
//  Lesson3Exercise
//
//  Created by ThinhLe on 7/27/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageBackgroundView: UIImageView!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    var regButton: UIButton!
    var formArea: UIView!
    
    func addView()
    {
        // add imageBackground
        imageBackgroundView = UIImageView(image: UIImage(named: "ars"))
        imageBackgroundView.contentMode = UIViewContentMode.scaleAspectFill
        imageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageBackgroundView)
        imageBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        let backgroundFormArea = UIView()
        backgroundFormArea.backgroundColor = UIColor.black
        backgroundFormArea.alpha = 0.5
        backgroundFormArea.layer.cornerRadius = 10.0
        self.view.addSubview(backgroundFormArea)
        backgroundFormArea.translatesAutoresizingMaskIntoConstraints = false
        backgroundFormArea.topAnchor.constraint(equalTo: view.topAnchor, constant: 32).isActive = true
        backgroundFormArea.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        backgroundFormArea.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 5/6).isActive = true
        backgroundFormArea.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // add form area
        formArea = UIView()
        self.view.addSubview(formArea)
        formArea.translatesAutoresizingMaskIntoConstraints = false
        formArea.topAnchor.constraint(equalTo: view.topAnchor, constant: 32).isActive = true
        formArea.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        formArea.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 5/6).isActive = true
        formArea.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        
        // Making buttons
        loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.cornerRadius = 10.0
        
        regButton = UIButton()
        regButton.setTitle("Register", for: .normal)
        regButton.setTitleColor(UIColor.white, for: .normal)
        regButton.layer.borderWidth = 1
        regButton.layer.borderColor = UIColor.white.cgColor
        regButton.layer.cornerRadius = 10.0
        
        // Making stackView and adding buttons
        let horizoltalStack = UIStackView(arrangedSubviews: [loginButton, regButton])
        horizoltalStack.axis = .horizontal
        horizoltalStack.distribution = .fillEqually
        horizoltalStack.spacing = 16
        
        // Making textField
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = UIColor.white
        passwordTextField.alpha = 1
        passwordTextField.layer.cornerRadius = 10.0
        
        emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.backgroundColor = UIColor.white
        emailTextField.alpha = 1
        emailTextField.layer.cornerRadius = 10.0
        
        // Making vertical stackview
        let verticalStack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, horizoltalStack])
        verticalStack.distribution = .fillEqually
        verticalStack.spacing = 16
        verticalStack.axis = .vertical
        
        // Adding vertical stackview
        formArea.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.centerXAnchor.constraint(equalTo: formArea.centerXAnchor).isActive = true
        verticalStack.topAnchor.constraint(equalTo: formArea.topAnchor, constant: 16).isActive = true
        verticalStack.widthAnchor.constraint(equalTo: formArea.widthAnchor, multiplier: 5/6).isActive = true
        verticalStack.heightAnchor.constraint(equalTo: formArea.heightAnchor, multiplier: 5/6).isActive = true
        
        // Adding leftView
        let imageViewPass = UIImageView(image: UIImage(named: "ars"))
        imageViewPass.frame = CGRect(x: 16, y: 0, width: 40, height: 40)
        imageViewPass.layer.cornerRadius = 10.0
        passwordTextField.leftViewMode = .always
        passwordTextField.leftView = imageViewPass
        
        let imageViewEmail = UIImageView(image: UIImage(named: "ars"))
        imageViewEmail.frame = CGRect(x: 16, y: 0, width: 40, height: 40)
        imageViewEmail.layer.cornerRadius = 10.0
        emailTextField.leftViewMode = .always
        emailTextField.leftView = imageViewEmail
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
    }
    
    override func viewDidLayoutSubviews() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

