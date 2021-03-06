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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSBundle *bundle = [NSBundle mainBundle]; // バンドルを取得する
        NSString *path = [bundle bundlePath]; // バンドルのパスを取得する
        path = [path stringByAppendingString:@"/example.lua"]; //パスにスクリプトファイル名を追加
        
        lua_State *lua = luaL_newstate(); //Luaの初期化
        luaL_openlibs(lua);//Luaライブラリを使えるようにする
        
        //Luaに関数を登録する
        lua_register(lua, "example_a", example_a);
        lua_register(lua, "example_b", example_b);
        lua_register(lua, "example_c", example_c);
        lua_register(lua, "example_d", example_d);
        
        printf("%d\n", luaL_dofile(lua, [path UTF8String]));//Luaスクリプトを読み込んで実行する
        
        //Swiftクラスを直接指定して呼び出す
        ExampleA *a = [[ExampleA alloc] init];
        [a hello]; //引数なし、戻り値なし
        long l = (long)[a addInt:100 p2:200];//整数値の引数と戻り値
        NSLog( @"%ld",l );
        NSString *t =[a addStr:@"abc" p2:@"def"];//文字列の引数と戻り値
        NSLog( @"%@",t );
    }
    return 0;
}
