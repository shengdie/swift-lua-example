//
//  main.swift
//  swift-lua-bridge-example
//
//  Created by dolphilia on 2016/01/08.
//  Copyright © 2016年 dolphilia. All rights reserved.
//

import Foundation

//If Cocoa application:
//var path:NSString = NSBundle.mainBundle().resourcePath!+"/example.lua"
let path:NSString = NSBundle.mainBundle().bundlePath+"/example.lua"
luaWithPath( path.UTF8String )