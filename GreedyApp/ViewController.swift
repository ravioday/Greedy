//
//  ViewController.swift
//  GreedyApp
//
//  Created by Ravi Joshi on 9/13/15.
//  Copyright (c) 2015 xogrp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Add the huffman controller
        let huffmanController = HuffmanController()
        addChildViewController(huffmanController)
        huffmanController.didMoveToParentViewController(self)
        view.addSubview(huffmanController.view)
        
    }
    
}

