//
//  ViewController.swift
//  Exercise_Calculator
//
//  Created by ThinhLe on 7/26/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var buttonArea: UIView!
    
    var buttonHeight: CGFloat = 0.0
    var buttonWidth:CGFloat = 0.0
    let numOfRow: CGFloat = 5
    let numOfButtonInARow: CGFloat = 4
    
    let buttonLabels = ["AC", "+/-", "%", "/", "7", "8", "9", "x", "4", "5", "6", "-", "1", "2", "3", "+", "0", ".", "="]

    func addButton()
    {
        var x: CGFloat = 0
        var y:CGFloat = 0
        
        for label in buttonLabels
        {
            let button = UIButton()
            button.setTitle(label, for: .normal)
            button.backgroundColor = UIColor.lightGray
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.frame.size = CGSize(width: buttonWidth, height: buttonHeight)
            button.frame.origin = CGPoint(x: x * buttonWidth, y: y * buttonHeight)
            buttonArea.addSubview(button)
            
            if (x + 1) > 3
            {
                x = 0
                y += 1
                button.backgroundColor = UIColor.orange
            }
            else
            {
                x += 1
            }
        }
    }
    
    func computeButtonDimension()
    {
        let height = buttonArea.frame.height
        let width = buttonArea.frame.width
        buttonHeight = height / numOfRow
        buttonWidth = width / numOfButtonInARow
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        computeButtonDimension()
        addButton()
        resultLabel.textAlignment = NSTextAlignment.right
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

