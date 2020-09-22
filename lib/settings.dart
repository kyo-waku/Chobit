import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        //todo:各項目の名称を変数化する
        MenuItem("カード情報", Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem("週の始まり", Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(
            "通知", Icon(Icons.alarm), context, Icon(Icons.arrow_forward_ios)),
        MenuItem("ダークモード", Icon(Icons.brightness_4), context),
        MenuItem("ホーム画面のアイコン", Icon(Icons.phone_iphone), context),
        MenuItem("フォントサイズ", Icon(Icons.format_size), context),
        MenuItem("言語", Icon(Icons.g_translate), context),
        MenuItem("今後の予定", Icon(Icons.watch), context),
        MenuItem("紹介", Icon(Icons.chat), context),
        MenuItem("ご意見", Icon(Icons.contact_mail), context),
        MenuItem("寄付", Icon(Icons.attach_money), context),
        MenuItem("ごみ箱", Icon(Icons.delete), context),
      ]),
    );
  }
}

//todo:各項目の名称を変数化する
//todo:各項目の設定を決めて更新する
class SettingsCardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カード情報'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem("foo", Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem("bar", Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
      ]),
    );
  }
}

class SettingsStartWeek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('週の始まり'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem("foo", Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem("bar", Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
      ]),
    );
  }
}

class SettingsNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通知'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem("foo", Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem("bar", Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
      ]),
    );
  }
}

class SettingsDarkMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ダークモード'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem("foo", Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem("bar", Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
      ]),
    );
  }
}

class SettingsHomeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム画面のアイコン'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem("foo", Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem("bar", Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
      ]),
    );
  }
}

class SettingsFontSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('フォントサイズ'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem("foo", Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem("bar", Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
      ]),
    );
  }
}

class SettingsLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('言語'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem("foo", Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem("bar", Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
      ]),
    );
  }
}

class SettingsFutureSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('今後の予定'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem("foo", Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem("bar", Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
      ]),
    );
  }
}

class SettingsIntroduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('紹介'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem("foo", Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem("bar", Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
      ]),
    );
  }
}

class SettingsOpinion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ご意見'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem("foo", Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem("bar", Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
      ]),
    );
  }
}

class SettingsDonation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('寄付'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem("foo", Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem("bar", Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
      ]),
    );
  }
}

class SettingsTrashCan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ごみ箱'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem("foo", Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem("bar", Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
      ]),
    );
  }
}

class MenuItem extends StatelessWidget {
  MenuItem(this.title, this.leadingIcon, this.context, [this.trailingIcon]);

  final String title;
  final Icon leadingIcon;
  final BuildContext context;
  final Icon trailingIcon;

  @override
  Widget build(BuildContext context) {
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

          switch (title) {
            //各項目を変数化する
            case 'カード情報':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsCardInfo(),
                  ));
              break;
            case '週の始まり':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsStartWeek(),
                  ));
              break;
            case '通知':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsNotification(),
                  ));
              break;
            case 'ダークモード':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsDarkMode(),
                  ));
              break;
            case 'ホーム画面のアイコン':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsHomeIcon(),
                  ));
              break;
            case 'フォントサイズ':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsFontSize(),
                  ));
              break;
            case '言語':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsLanguage(),
                  ));
              break;
            case '今後の予定':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsFutureSchedule(),
                  ));
              break;
            case '紹介':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsIntroduction(),
                  ));
              break;
            case 'ご意見':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsOpinion(),
                  ));
              break;
            case '寄付':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsDonation(),
                  ));
              break;
            case 'ごみ箱':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsTrashCan(),
                  ));
              break;
            default:
              //最終版では、エラー処理にする
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsWidget(),
                  ));
          }
        },
        onLongPress: () {
          print("onLongPress called.");
        },
      ),
    );
  }
}
