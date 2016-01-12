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

public class WindowController: NSWindowController {
    
    override public func windowDidLoad() {
        super.windowDidLoad()
        self.window!.delegate = self
        self.window!.title = public_title
    }
    
//    public func setTitleText(title:String) {
//        self.window!.title = title
//    }
    
//    static public func setTitleTextStatic(title:String) {
//        self.setTitleText(title)
//    }
    
}

extension WindowController: NSWindowDelegate {
    public func windowWillClose(notification: NSNotification) {
        NSApplication.sharedApplication().terminate(NSApp.keyWindow!)
        
    }
}