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

void luaWithPath(const char* str) {
    lua_State *lua = luaL_newstate();
    luaL_openlibs(lua);
    printf("%d\n", luaL_dofile(lua, str));
}