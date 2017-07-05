//
//  ViewController.swift
//  Test_Task1_Concurrent
//
//  Created by cntt17 on 7/5/17.
//  Copyright © 2017 cntt17. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func load1ButtonClick(_ sender: Any) {
        load1()
    }

    @IBAction func load2ButtonClick(_ sender: Any) {
        load2()
    }

    func load1() {
        let queue = DispatchQueue(label: "my queue", qos: .utility, attributes: .concurrent)
        queue.async {
            for i in 0...9 {
                print("🔴 \(i)")
            }
        }
        queue.async {
            for i in 100...109 {
                print("🔵 \(i)")
            }
        }
        queue.async {
            for i in 1000...1009 {
                print("⚫️ \(i)")
            }
        }
    }
    
    func load2() {
        let thread1 = DispatchQueue(label: "thread 1", qos: .userInitiated)
        let thread2 = DispatchQueue(label: "thread 2", qos: .userInitiated)
        let thread3 = DispatchQueue(label: "thread 3", qos: .userInitiated)
        thread1.async {
            for i in 0...9 {
                print("🔴 \(i)")
            }
        }
        thread2.async {
            for i in 100...109 {
                print("🔵 \(i)")
            }
        }
        thread3.async {
            for i in 1000...1009 {
                print("⚫️ \(i)")
            }
        }
    }
}

