//
//  example.m
//  swiftobjctest
//
//  Created by dolphilia on 2016/01/11.
//  Copyright © 2016年 dolphilia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "swiftobjctest-Swift.h" //Swiftと連携

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

//引数なし：結果を整数値で返す
int example_a(lua_State *L) {
    lua_pushinteger(L, 100);
    return 1;
}

//引数なし：結果を文字列で返す
int example_b(lua_State *L) {
    lua_pushstring(L, "abc");
    return 1;
}

//引数あり：結果を整数値で返す
int example_c(lua_State *L){
    int p = (int)lua_tointeger(L, 1);
    lua_pushinteger(L, p+100);
    return 1;
}


//引数あり：結果を文字列で返す
int example_d(lua_State *L){
    const char* p = lua_tostring(L, 1);
    lua_pushstring(L, p );
    return 1;
}

//Swiftの関数を呼び出す
int example_e(lua_State *L) {
    @autoreleasepool {
        ExampleA *object = [[ExampleA alloc] init];
        [object hello];
    }
    return 1;
}

//Swiftの関数を呼び出す
int set_title(lua_State *L) {
    const char* p = lua_tostring(L, 1);
    NSString *str = [ [ NSString alloc ] initWithUTF8String:p ];
    @autoreleasepool {
        ExampleA *object = [[ExampleA alloc] init];
        [object title: str];
    }
    return 1;
}

int luaRun() {
    @autoreleasepool {
        // insert code here...
        
        NSBundle *bundle = [NSBundle mainBundle]; // バンドルを取得する
        NSString *path = [bundle resourcePath]; // バンドルのパスを取得する
        path = [path stringByAppendingString:@"/example.lua"]; //パスにスクリプトファイル名を追加
        
        lua_State *lua = luaL_newstate(); //Luaの初期化
        luaL_openlibs(lua);//Luaライブラリを使えるようにする
        
        //Luaに関数を登録する
        lua_register(lua, "example_a", example_a);
        lua_register(lua, "example_b", example_b);
        lua_register(lua, "example_c", example_c);
        lua_register(lua, "example_d", example_d);
        lua_register(lua, "example_e", example_e);
        lua_register(lua, "title", set_title);
        
        printf("%d\n", luaL_dofile(lua, [path UTF8String]));//Luaスクリプトを読み込んで実行する
    }
    return 0;
}