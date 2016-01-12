# swift-lua-bridge-example

SwiftからLuaを呼び出す単純なサンプル。

## 仕組み

SwiftとCをブリッジして、CからLuaを呼び出しています。

## 実行

Xcodeからプロジェクトファイル（swift-lua-bridge-example.xcodeproj）を読み込んでビルドします。

## 動作環境

- MacOSX(10.11.2)
- Xcode7.2
- Lua5

## 覚え書き

- 実行ファイルと同ディレクトリにスクリプトファイルをコピーする設定
	- Xcode -> Build Phases -> Copy Files ->
		- Destination を Products Directory に
		- Subpath は未記入
		- Copy only when installing のチェックを外す
		- Name に luaスクリプトファイルを追加
- Bridging-Headerについて
	- C/C++ファイルを作成するとき、それに伴って作成できる
		- Bridging-Header.h に使用するCのヘッダーファイルをインポートする
			- 例：#import "example.h"
- Swift-C間の値のやり取りについて
	- Int型はそのままやり取りできる
	- Swift側は、NSStringのUTF8Stringプロパティを渡せる
	- C側は const char* を使用する
- ライブラリの読み込みについて
	- Add File to ... で liblua5.1.a を読み込む
		- Xcode -> Build Phases -> Link Binary With Libraries に反映される
	- Add File to ... で lauxlib.h, lua.h, lua.hpp, luaconf.h, lualib.h を読み込む
