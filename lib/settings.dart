import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        _menuItem("カード情報", Icon(Icons.settings), Icon(Icons.arrow_forward_ios)),
        _menuItem("週の始まり", Icon(Icons.map), Icon(Icons.arrow_forward_ios)),
        _menuItem("通知", Icon(Icons.room), Icon(Icons.arrow_forward_ios)),
        _menuItem("ダークモード", Icon(Icons.local_shipping)),
        _menuItem("ホーム画面のアイコン", Icon(Icons.airplanemode_active)),
        _menuItem("フォント", Icon(Icons.airplanemode_active)),
        _menuItem("言語", Icon(Icons.airplanemode_active)),
        _menuItem("今後の予定", Icon(Icons.airplanemode_active)),
        _menuItem("紹介", Icon(Icons.airplanemode_active)),
        _menuItem("ご意見", Icon(Icons.airplanemode_active)),
        _menuItem("寄付", Icon(Icons.airplanemode_active)),
        _menuItem("メニュー5", Icon(Icons.airplanemode_active)),
        _menuItem("メニュー5", Icon(Icons.airplanemode_active)),
      ]),
    );
  }

  Widget _menuItem(String title, Icon leadingIcon, [Icon trailingIcon]) {
    return Container(
      decoration: new BoxDecoration(
          border:
              new Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
      child: ListTile(
        //tileColor: Colors.white, //色を塗ると、なぜかタップ時のインタラクティブが機能しない。一旦、色なしにしておく。
        enabled: true,
        selected: true,
        dense: true,
        leading: leadingIcon,
        trailing: trailingIcon,
        title: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 12.0),
        ),
        onTap: () {
          print("onTap called.");
        },
        onLongPress: () {
          print("onLongPress called.");
        },
      ),
    );
  }
}
