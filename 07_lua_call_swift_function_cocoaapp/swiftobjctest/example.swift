//
//  example.swift
//  swiftobjctest
//
//  Created by dolphilia on 2016/01/11.
//  Copyright © 2016年 dolphilia. All rights reserved.
//

import Foundation
class ExampleA : NSObject
{
    func hello() {
        print("Hello!")
    }
    func addInt(p1:Int,p2:Int) -> Int {
        return p1+p2
    }
    func addStr(p1:String, p2:String) -> String
    {
        return p1+p2
    }
    func joinString(string:String, number:NSNumber) -> String
    {
        return "\(string), \(number)"
    }
}
