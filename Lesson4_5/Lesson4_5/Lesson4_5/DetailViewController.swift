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
    var newStackBottomAnchor: NSLayoutConstraint!
    
    @IBAction func goBackItem(_ sender: Any) {
        performSegue(withIdentifier: "DetailToItem", sender: self)
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
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
            newStackBottomAnchor = stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -keyboardSize.height)
            newStackBottomAnchor.isActive = true
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        newStackBottomAnchor.isActive = false
    }
    
}
