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

//クラス宣言
@interface ExampleB: NSObject {
    //クラス変数
    ExampleA *object;
    int val;
}
//メソッド宣言
-init;
-(void)hello;
-(int)addInt:(int)p1 withInt:(int)p2;
-(NSString *)addStr:(NSString *)p1 withStr:(NSString *)p2;
-(NSString *)joinString:(NSString *)string withNumber:(NSNumber *)number;
@end


//クラス定義
@implementation ExampleB
- init {
    object = [[ExampleA alloc] init];
    return self;
}
- (void)hello {
    [object hello];
}
- (NSString *)joinString:(NSString *)string withNumber:(NSNumber *)number {
    return [object joinString:string number:number];
}
-(int)addInt:(int)p1 withInt:(int)p2 {
    return (int)[object addInt:p1 p2:p2];
}
-(NSString *)addStr:(NSString *)p1 withStr:(NSString *)p2 {
    return [object addStr:p1 p2:p2];
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSBundle *bundle = [NSBundle mainBundle]; // バンドルを取得する
        NSString *path = [bundle bundlePath]; // バンドルのパスを取得する
        path = [path stringByAppendingString:@"/example.lua"]; //パスにスクリプトファイル名を追加
        
        lua_State *lua = luaL_newstate(); //Luaの初期化
        luaL_openlibs(lua);//Luaライブラリを使えるようにする
        
        printf("%d\n", luaL_dofile(lua, [path UTF8String]));//Luaスクリプトを読み込んで実行する
        
        //Swiftクラスを直接指定して呼び出す
        ExampleA *a = [[ExampleA alloc] init];
        [a hello]; //引数なし、戻り値なし
        long l = (long)[a addInt:100 p2:200];//整数値の引数と戻り値
        NSLog( @"%ld",l );
        NSString *t =[a addStr:@"abc" p2:@"def"];//文字列の引数と戻り値
        NSLog( @"%@",t );
        
        
        //SwiftクラスをObjCでラップしたクラスを呼び出す
        ExampleB *b = [[ExampleB alloc] init];
        [b hello];
        int ret_b_int = [b addInt:100 withInt:200];
        NSLog( @"%d",ret_b_int );
        NSString *ret_b_str =[b addStr:@"abc" withStr:@"def"];
        NSLog(@"%@",ret_b_str);
    }
    return 0;
}
