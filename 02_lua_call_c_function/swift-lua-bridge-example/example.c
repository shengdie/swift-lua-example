//
//  example.c
//  swift-lua-bridge-example
//
//  Created by dolphilia on 2016/01/08.
//  Copyright © 2016年 dolphilia. All rights reserved.
//

#include "example.h"

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


void luaWithPath(const char* str) {
    lua_State *lua = luaL_newstate();
    luaL_openlibs(lua);

    //Luaに関数を登録する
    lua_register(lua, "example_a", example_a);
    lua_register(lua, "example_b", example_b);
    lua_register(lua, "example_c", example_c);
    lua_register(lua, "example_d", example_d);
    
    printf("%d\n", luaL_dofile(lua, str));
}