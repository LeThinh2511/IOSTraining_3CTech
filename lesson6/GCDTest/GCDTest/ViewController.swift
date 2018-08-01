//
//  ViewController.swift
//  GCDTest
//
//  Created by ThinhLe on 7/31/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var inactiveQueue: DispatchQueue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        concurrentQueue()
        if let queue = inactiveQueue
        {
            queue.activate()
        }
    }
    
    func concurrentQueue()
    {
        //let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .utility, attributes: .concurrent)
        
        let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .utility, attributes: [.initiallyInactive, .concurrent])
        inactiveQueue = anotherQueue
        
        anotherQueue.async {
            for i in 0..<10
            {
                print(i)
            }
        }
        anotherQueue.async {
            for i in 10..<20
            {
                print(i)
            }
        }
        anotherQueue.async {
            for i in 100..<110
            {
                print(i)
            }
        }
        anotherQueue.async {
            for i in 1000..<1010
            {
                print(i)
            }
        }
    }
    
    func simpleQueue()
    {
        let queue = DispatchQueue(label: "simpleQueue")
        queue.async {
            for i in 0..<10
            {
                print(i)
            }
        }
        
        for i in 100..<110 {
            print("Ⓜ", i)
        }
    }
    
    func queueWithQOS()
    {
        let queue1 = DispatchQueue(label: "com.appcoda.queue1", qos: DispatchQoS.userInitiated)
        let queue2 = DispatchQueue(label: "com.appcoda.queue2", qos: DispatchQoS.utility)
        
        queue1.sync {
            for i in 0..<10
            {
                print(i)
            }
        }
        
        
        queue2.sync {
            for i in 10..<20
            {
                print(i)
            }
        }
        
        for i in 1000..<1010 {
            print("Ⓜ", i)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

