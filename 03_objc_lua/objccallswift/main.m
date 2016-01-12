//
//  main.m
//  objccallswift
//
//  Created by dolphilia on 2016/01/11.
//  Copyright © 2016年 dolphilia. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "objccallswift-Swift.h" //Swiftと連携

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSBundle *bundle = [NSBundle mainBundle]; // バンドルを取得する
        NSString *path = [bundle bundlePath]; // バンドルのパスを取得する
        path = [path stringByAppendingString:@"/example.lua"]; //パスにスクリプトファイル名を追加
        
        lua_State *lua = luaL_newstate(); //Luaの初期化
        luaL_openlibs(lua);//Luaライブラリを使えるようにする
        
        printf("%d\n", luaL_dofile(lua, [path UTF8String]));//Luaスクリプトを読み込んで実行する
    }
    return 0;
}
