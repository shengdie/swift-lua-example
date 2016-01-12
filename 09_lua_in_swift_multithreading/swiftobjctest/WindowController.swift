//
//  WindowController.swift
//  swiftobjctest
//
//  Created by dolphilia on 2016/01/11.
//  Copyright © 2016年 dolphilia. All rights reserved.
//

import Foundation
import Cocoa

var public_title = ""
var public_title_old = ""

public class WindowController: NSWindowController {
    
    override public func windowDidLoad() {
        super.windowDidLoad()
        self.window!.delegate = self
        self.window!.title = public_title

        //NSTimerを使う方法
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("onUpdate:"), userInfo: nil, repeats: true)
        
        //        //あるいは別スレッド内で変数の変更を随時チェックする方法もある
        //        let queue = NSOperationQueue()
        //        queue.addOperationWithBlock { () -> Void in
        //            while(true) {
        //                if(public_title != public_title_old) {
        //                    self.window!.title = public_title
        //                    public_title_old = public_title
        //                }
        //                usleep(10000)
        //            }
        //        }
    }
    
    func onUpdate(timer: NSTimer) {
        //変数の変更をチェックする
        if(public_title != public_title_old) {
            self.window!.title = public_title
            public_title_old = public_title
        }
    }
}

extension WindowController: NSWindowDelegate {
    public func windowWillClose(notification: NSNotification) {
        NSApplication.sharedApplication().terminate(NSApp.keyWindow!)
        
    }
}