//
//  ViewController.swift
//  NSNotification_lesson7
//
//  Created by ThinhLe on 8/2/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import UIKit


let changeColorMessage = "changeColorMessage"
let arrayOfInt = "arrayOfIntMessage"

class ViewController1: UIViewController {

    @IBAction func goToVC2(_ sender: UIButton) {
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "ViewController2")
        self.present(vc2!, animated: true, completion: nil)
    }
    @IBOutlet weak var testView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController1.changeColor), name: NSNotification.Name(rawValue: changeColorMessage), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController1.printMessage), name: NSNotification.Name(rawValue: changeColorMessage), object: nil)
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: arrayOfInt), object: nil, queue: nil) { (notification) in
            if let userInfo = notification.userInfo
            {
                let arr = userInfo["array"]
                print(arr!)
            }
        }
        
    }
    
    @objc func changeColor()
    {
        if testView.backgroundColor! == UIColor.blue
        {
            testView.backgroundColor = UIColor.red
        }
        else
        {
            testView.backgroundColor = UIColor.blue
        }
    }
    
    @objc func printMessage()
    {
        print("TestView's color has changed!")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

