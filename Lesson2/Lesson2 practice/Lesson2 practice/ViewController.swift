//
//  ViewController.swift
//  Lesson2 practice
//
//  Created by ThinhLe on 7/26/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
//        textField.rightViewMode = UITextFieldViewMode.always
//        textField.rightView?.tintColor = UIColor.red
//        textField.rightView?.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "ars")
        mySwitch.addTarget(self, action: #selector(changeImage), for: .valueChanged)
    }
    
    @objc func changeImage()
    {
        if mySwitch.isOn
        {
            imageView.image = UIImage(named: "ars")
        }
        else
        {
            let imageURL = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAY7Zws3Cfn9hqJtNiMgKAL8-wibkohSW9B2MfloHDFMuVbBY4tQ")
            let session = URLSession(configuration: .default)
            let imageFromURL = session.dataTask(with: imageURL!) { (data, response, error) in
                if let error = error
                {
                    print(error)
                }
                else
                {
                    if let data = data
                    {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    }
                }
            }
            imageFromURL.resume()
        }
        
    }
    
    override func loadView() {
        super.loadView()
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print(#function)
    }
    
    override func viewDidLayoutSubviews() {
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print(#function)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

