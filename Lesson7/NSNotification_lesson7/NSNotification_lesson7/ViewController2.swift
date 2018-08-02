//
//  ViewController2.swift
//  NSNotification_lesson7
//
//  Created by ThinhLe on 8/2/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import UIKit

class ViewController2: UIViewController
{
    let array = [1, 2, 3, 4]
    @IBOutlet weak var testView: UIView!
    @IBAction func changeColor(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: changeColorMessage), object: nil)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: arrayOfInt), object: nil, userInfo: ["array":array])
    }
    @IBAction func dismissVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
