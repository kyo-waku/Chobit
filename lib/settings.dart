import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//hack:下のSettingsItemNameリストと同時に更新する
enum SettingsItem {
  CardInfo,
  CardA,
  CardB,
  CardC,

  StartWeek,
  Sunday,
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,

  Notification,
  NotificationOnOff,
  NotificationOnOffBadge,
  NotificationTime,

  TrashCan,
  TrashCardA,
  TrashCardB,
  TrashCardC,

  DarkMode,
  DarkModeOnOff,
  DarkModeStartTime,
  DarkModeEndTime,

  AppIcon,
  AppIconA,
  AppIconB,
  AppIconC,

  FontSize,
  FontSizeLarge,
  FontSizeMedium,
  FontSizeSmall,

  Language,
  Japanese,
  English,

  ReviewThisApp,
  ReviewByAppleStore,
  ReviewByGooglePlay,

  Introduction,
  IntroduceByTwitter,
  IntroduceByLINE,
  IntroduceByCopyLink,

  Inquiry,
  InquiryByTwetter,
  InquiryByMail,

  Donation,
  DonationExplanation,

  Help,
  HelpExplanation,

  TermsOfService,
  TermsExplanation,

  PrivacyPoricy,
  PoricyExplanation,

  Other,
}

//hack:上のSettingsItemのenumと同時に更新する
const List<String> SettingsItemName = [
  "カード情報",
  "カードA",
  "カードB",
  "カードC",
  "週の始まり",
  "日曜日",
  "月曜日",
  "火曜日",
  "水曜日",
  "木曜日",
  "金曜日",
  "土曜日",
  "通知",
  "通知する",
  "バッジで通知する",
  "通知時間",
  "ごみ箱",
  "カードA",
  "カードB",
  "カードC",
  "ダークモード",
  "ダークモードにする",
  "ダークモード開始時間",
  "ダークモード終了時間",
  "アプリのアイコン",
  "アイコンA",
  "アイコンB",
  "アイコンC",
  "フォントサイズ",
  "大",
  "中",
  "小",
  "言語",
  "日本語",
  "英語",
  "このアプリをレビューする",
  "AppleStoreでレビューする",
  "GooglePlayでレビューする",
  "紹介",
  "Twitterで紹介する",
  "LINEで紹介する",
  "リンクをコピーする",
  "お問い合わせ",
  "Twitterで問い合わせる",
  "メールで問い合わせる",
  "寄付",
  "(寄付の説明文)",
  "ヘルプ",
  "(ヘルプの説明文)",
  "利用規約",
  "(利用規約の説明文)",
  "プライバシーポリシー",
  "(プライバシーポリシーの説明文)",
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

        MenuItem(SettingsItem.CardInfo, context, Icon(Icons.credit_card),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.StartWeek, context, Icon(Icons.calendar_today),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Notification, context, Icon(Icons.alarm),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.TrashCan, context, Icon(Icons.delete),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.DarkMode, context, Icon(Icons.brightness_4),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.AppIcon, context, Icon(Icons.phone_iphone),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.FontSize, context, Icon(Icons.format_size),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Language, context, Icon(Icons.g_translate),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.ReviewThisApp, context,
            Icon(Icons.insert_emoticon), Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Introduction, context, Icon(Icons.chat),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Inquiry, context, Icon(Icons.contact_mail),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Donation, context, Icon(Icons.attach_money),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.Help, context, Icon(Icons.help),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.TermsOfService, context, Icon(Icons.rule),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsItem.PrivacyPoricy, context, Icon(Icons.privacy_tip),
            Icon(Icons.arrow_forward_ios)),
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
        MenuItem(SettingsItem.CardA, context),
        MenuItem(SettingsItem.CardB, context),
        MenuItem(SettingsItem.CardC, context),
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
        MenuItem(SettingsItem.Sunday, context),
        MenuItem(SettingsItem.Monday, context),
        MenuItem(SettingsItem.Tuesday, context),
        MenuItem(SettingsItem.Wednesday, context),
        MenuItem(SettingsItem.Thursday, context),
        MenuItem(SettingsItem.Friday, context),
        MenuItem(SettingsItem.Saturday, context),
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
        MenuItem(SettingsItem.NotificationOnOff, context),
        MenuItem(SettingsItem.NotificationOnOffBadge, context),
        MenuItem(SettingsItem.NotificationTime, context),
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
        MenuItem(SettingsItem.TrashCardA, context),
        MenuItem(SettingsItem.TrashCardB, context),
        MenuItem(SettingsItem.TrashCardC, context),
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
        MenuItem(SettingsItem.DarkModeOnOff, context),
        MenuItem(SettingsItem.DarkModeStartTime, context),
        MenuItem(SettingsItem.DarkModeEndTime, context),
      ]),
    );
  }
}

class SettingsAppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItemName[SettingsItem.AppIcon.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.AppIconA, context),
        MenuItem(SettingsItem.AppIconB, context),
        MenuItem(SettingsItem.AppIconC, context),
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
        MenuItem(SettingsItem.FontSizeLarge, context),
        MenuItem(SettingsItem.FontSizeMedium, context),
        MenuItem(SettingsItem.FontSizeSmall, context),
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
        MenuItem(SettingsItem.Japanese, context),
        MenuItem(SettingsItem.English, context),
      ]),
    );
  }
}

class SettingsReviewThisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItemName[SettingsItem.ReviewThisApp.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.ReviewByAppleStore, context),
        MenuItem(SettingsItem.ReviewByGooglePlay, context),
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
        MenuItem(SettingsItem.IntroduceByTwitter, context),
        MenuItem(SettingsItem.IntroduceByLINE, context),
        MenuItem(SettingsItem.IntroduceByCopyLink, context),
      ]),
    );
  }
}

class SettingsInquiry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItemName[SettingsItem.Inquiry.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.InquiryByTwetter, context),
        MenuItem(SettingsItem.InquiryByMail, context),
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
        MenuItem(SettingsItem.DonationExplanation, context),
      ]),
    );
  }
}

class SettingsHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItemName[SettingsItem.Help.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.HelpExplanation, context),
      ]),
    );
  }
}

class SettingsTermsOfService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItemName[SettingsItem.TermsOfService.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.TermsExplanation, context),
      ]),
    );
  }
}

class SettingsPrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItemName[SettingsItem.PrivacyPoricy.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsItem.PoricyExplanation, context),
      ]),
    );
  }
}

class MenuItem extends StatelessWidget {
//  MenuItem(this.settingsItem, this.leadingIcon, this.context,
//      [this.trailingIcon]);
  MenuItem(this.settingsItem, this.context,
      [this.leadingIcon, this.trailingIcon]);

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
            case SettingsItem.TrashCan:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsTrashCan(),
                  ));
              break;
            case SettingsItem.DarkMode:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsDarkMode(),
                  ));
              break;
            case SettingsItem.AppIcon:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsAppIcon(),
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
            case SettingsItem.ReviewThisApp:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsReviewThisApp(),
                  ));
              break;
            case SettingsItem.Introduction:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsIntroduction(),
                  ));
              break;
            case SettingsItem.Inquiry:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsInquiry(),
                  ));
              break;
            case SettingsItem.Donation:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsDonation(),
                  ));
              break;
            case SettingsItem.Help:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsHelp(),
                  ));
              break;
            case SettingsItem.TermsOfService:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsTermsOfService(),
                  ));
              break;
            case SettingsItem.PrivacyPoricy:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPrivacyPolicy(),
                  ));
              break;

            default:
              //最終版では、エラー処理にする
              print("onTap $settingsItem");
          }
        },
        onLongPress: () {
          print("onLongPress called.");
        },
      ),
    );
  }
}
