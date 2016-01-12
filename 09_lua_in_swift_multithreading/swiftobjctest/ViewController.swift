//
//  ViewController.swift
//  swiftobjctest
//
//  Created by dolphilia on 2016/01/11.
//  Copyright © 2016年 dolphilia. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        // Do any additional setup after loading the view.
        
        //別スレッドでluaを実行する
        let queue = NSOperationQueue()
        queue.addOperationWithBlock { () -> Void in
            luaRun()
        }
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

