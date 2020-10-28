import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//hack:下のSettingsItemNameリストと同時に更新する
enum SettingsItem {
  CardInfo,
  StartWeek,
  Notification,
  DarkMode,
  HomeIcon,
  FontSize,
  Language,
  FutureSchedule,
  Introduction,
  Opinion,
  Donation,
  TrashCan,
  Other,
}

//hack:上のSettingsItemのenumと同時に更新する
const List<String> SettingsItemName = [
  "カード情報",
  "週の始まり",
  "通知",
  "ダークモード",
  "ホーム画面のアイコン",
  "フォントサイズ",
  "言語",
  "今後の予定",
  "紹介",
  "ご意見",
  "寄付",
  "ごみ箱",
  "その他",
];

class SettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        //todo:各項目の名称を変数化する

        MenuItem(SettingsItem.CardInfo, Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.StartWeek, Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Notification, Icon(Icons.alarm), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.DarkMode, Icon(Icons.brightness_4), context),
        MenuItem(SettingsItem.HomeIcon, Icon(Icons.phone_iphone), context),
        MenuItem(SettingsItem.FontSize, Icon(Icons.format_size), context),
        MenuItem(SettingsItem.Language, Icon(Icons.g_translate), context),
        MenuItem(SettingsItem.FutureSchedule, Icon(Icons.watch), context),
        MenuItem(SettingsItem.Introduction, Icon(Icons.chat), context),
        MenuItem(SettingsItem.Opinion, Icon(Icons.contact_mail), context),
        MenuItem(SettingsItem.Donation, Icon(Icons.attach_money), context),
        MenuItem(SettingsItem.TrashCan, Icon(Icons.delete), context),
      ]),
    );
  }
}

//todo:各項目の設定を決めて更新する
class SettingsCardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItemName[SettingsItem.CardInfo.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.CardInfo, Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Other, Icon(Icons.calendar_today), context,
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
        title: Text(SettingsItemName[SettingsItem.StartWeek.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.StartWeek, Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Other, Icon(Icons.calendar_today), context,
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
        title: Text(SettingsItemName[SettingsItem.Notification.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.Notification, Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Other, Icon(Icons.calendar_today), context,
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
        title: Text(SettingsItemName[SettingsItem.DarkMode.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.DarkMode, Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Other, Icon(Icons.calendar_today), context,
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
        title: Text(SettingsItemName[SettingsItem.HomeIcon.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.HomeIcon, Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Other, Icon(Icons.calendar_today), context,
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
        title: Text(SettingsItemName[SettingsItem.FontSize.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.FontSize, Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Other, Icon(Icons.calendar_today), context,
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
        title: Text(SettingsItemName[SettingsItem.Language.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.Language, Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Other, Icon(Icons.calendar_today), context,
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
        title: Text(SettingsItemName[SettingsItem.FutureSchedule.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.FutureSchedule, Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Other, Icon(Icons.calendar_today), context,
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
        title: Text(SettingsItemName[SettingsItem.Introduction.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.Introduction, Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Other, Icon(Icons.calendar_today), context,
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
        title: Text(SettingsItemName[SettingsItem.Opinion.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.Opinion, Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Other, Icon(Icons.calendar_today), context,
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
        title: Text(SettingsItemName[SettingsItem.Donation.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.Donation, Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Other, Icon(Icons.calendar_today), context,
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
        title: Text(SettingsItemName[SettingsItem.TrashCan.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.TrashCan, Icon(Icons.credit_card), context,
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Other, Icon(Icons.calendar_today), context,
            Icon(Icons.arrow_forward_ios)),
      ]),
    );
  }
}

class MenuItem extends StatelessWidget {
  MenuItem(this.settingsItem, this.leadingIcon, this.context,
      [this.trailingIcon]);

  final SettingsItem settingsItem;
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
          SettingsItemName[settingsItem.index],
          style: TextStyle(color: Colors.black, fontSize: 12.0),
        ),
        onTap: () {
          print("onTap called.");

          switch (settingsItem) {
            case SettingsItem.CardInfo:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsCardInfo(),
                  ));
              break;
            case SettingsItem.StartWeek:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsStartWeek(),
                  ));
              break;
            case SettingsItem.Notification:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsNotification(),
                  ));
              break;
            case SettingsItem.DarkMode:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsDarkMode(),
                  ));
              break;
            case SettingsItem.HomeIcon:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsHomeIcon(),
                  ));
              break;
            case SettingsItem.FontSize:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsFontSize(),
                  ));
              break;
            case SettingsItem.Language:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsLanguage(),
                  ));
              break;
            case SettingsItem.FutureSchedule:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsFutureSchedule(),
                  ));
              break;
            case SettingsItem.Introduction:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsIntroduction(),
                  ));
              break;
            case SettingsItem.Opinion:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsOpinion(),
                  ));
              break;
            case SettingsItem.Donation:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsDonation(),
                  ));
              break;
            case SettingsItem.TrashCan:
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
