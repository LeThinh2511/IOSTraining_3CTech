//
//  DetailViewController.swift
//  Lesson4_5
//
//  Created by ThinhLe on 7/30/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    var item: Item!
    var newHeightConstraint: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var stackHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var serialNumberTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var dateCreatedLabel: UILabel!
    
    @IBAction func dismissKeyboard(_sender: UITapGestureRecognizer)
    {
        valueTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
        serialNumberTextField.resignFirstResponder()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = item.name
        nameTextField.text = item.name
        serialNumberTextField.text = item.serialNumber ?? ""
        valueTextField.text = "\(item.valueInDollars)"
        dateCreatedLabel.text = "\(item.dateCreated)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.stackView.frame.height == self.view.frame.height
            {
                stackHeightConstraint.isActive = false
                self.newHeightConstraint = NSLayoutConstraint(item: stackView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1, constant: -keyboardSize.height)
                view.addConstraint(newHeightConstraint)
            }
            
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.stackView.frame.height == self.view.frame.height {
            self.newHeightConstraint.isActive = false
            view.removeConstraint(newHeightConstraint)
            
            stackHeightConstraint.isActive = true
            view.addConstraint(stackHeightConstraint)
        }
    }
    
}
