//
//  ViewController.swift
//  NSOperation
//
//  Created by ThinhLe on 8/1/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        operationQueue()
    }
    
    func operationQueue()
    {
        let queue = OperationQueue()
        
        let operation = BlockOperation {
            for i in 0..<10
            {
                print(i)
            }
        }
        
        let operation2 = BlockOperation {
            for i in 100..<110
            {
                print(i)
            }
        }
        print(operation2.isFinished)
        
        queue.addOperation {
            for i in 10..<20
            {
                print(i)
            }
        }
        print(operation2.isFinished)
        //operation2.addDependency(operation)
        
        queue.addOperation(operation)
        queue.addOperation(operation2)
        print(operation2.isFinished)
        
        
        print(operation2.isFinished)
        print(operation2.cancel())
        print(operation2.isCancelled)
        
//        operation.queuePriority = .veryHigh
//        operation.cancel()
//        print(operation.isCancelled)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

