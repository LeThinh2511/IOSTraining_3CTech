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
        
        // add form area
        formArea = UIView()
        formArea.backgroundColor = UIColor.black
        formArea.alpha = 0.5
        self.view.addSubview(formArea)
        formArea.translatesAutoresizingMaskIntoConstraints = false
        formArea.topAnchor.constraint(equalTo: view.topAnchor, constant: 32).isActive = true
        formArea.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        formArea.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 5/6).isActive = true
        formArea.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        addView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

