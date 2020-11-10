import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//hack:下のSettingsItemと同時に更新する
enum SettingsKey {
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

//hack:上のSettingsKeyと同時に更新する
class SettingsItem {
  static Map name = {
    SettingsKey.CardInfo.index: 'カード情報',
    SettingsKey.CardA.index: 'カードA',
    SettingsKey.CardB.index: 'カードB',
    SettingsKey.CardC.index: 'カードC',
    SettingsKey.StartWeek.index: '週の始まり',
    SettingsKey.Sunday.index: '日曜日',
    SettingsKey.Monday.index: '月曜日',
    SettingsKey.Tuesday.index: '火曜日',
    SettingsKey.Wednesday.index: '水曜日',
    SettingsKey.Thursday.index: '木曜日',
    SettingsKey.Friday.index: '金曜日',
    SettingsKey.Saturday.index: '土曜日',
    SettingsKey.Notification.index: '通知',
    SettingsKey.NotificationOnOff.index: '通知する',
    SettingsKey.NotificationOnOffBadge.index: 'バッジで通知する',
    SettingsKey.NotificationTime.index: '通知時間',
    SettingsKey.TrashCan.index: 'ごみ箱',
    SettingsKey.TrashCardA.index: 'カードA',
    SettingsKey.TrashCardB.index: 'カードB',
    SettingsKey.TrashCardC.index: 'カードC',
    SettingsKey.DarkMode.index: 'ダークモード',
    SettingsKey.DarkModeOnOff.index: 'ダークモードにする',
    SettingsKey.DarkModeStartTime.index: 'ダークモード開始時間',
    SettingsKey.DarkModeEndTime.index: 'ダークモード終了時間',
    SettingsKey.AppIcon.index: 'アプリのアイコン',
    SettingsKey.AppIconA.index: 'アイコンA',
    SettingsKey.AppIconB.index: 'アイコンB',
    SettingsKey.AppIconC.index: 'アイコンC',
    SettingsKey.FontSize.index: 'フォントサイズ',
    SettingsKey.FontSizeLarge.index: '大',
    SettingsKey.FontSizeMedium.index: '中',
    SettingsKey.FontSizeSmall.index: '小',
    SettingsKey.Language.index: '言語',
    SettingsKey.Japanese.index: '日本語',
    SettingsKey.English.index: '英語',
    SettingsKey.ReviewThisApp.index: 'このアプリをレビューする',
    SettingsKey.ReviewByAppleStore.index: 'AppleStoreでレビューする',
    SettingsKey.ReviewByGooglePlay.index: 'GooglePlayでレビューする',
    SettingsKey.Introduction.index: '紹介',
    SettingsKey.IntroduceByTwitter.index: 'Twitterで紹介する',
    SettingsKey.IntroduceByLINE.index: 'LINEで紹介する',
    SettingsKey.IntroduceByCopyLink.index: 'リンクをコピーする',
    SettingsKey.Inquiry.index: 'お問い合わせ',
    SettingsKey.InquiryByTwetter.index: 'Twitterで問い合わせる',
    SettingsKey.InquiryByMail.index: 'メールで問い合わせる',
    SettingsKey.Donation.index: '寄付',
    SettingsKey.DonationExplanation.index: '(寄付の説明文)',
    SettingsKey.Help.index: 'ヘルプ',
    SettingsKey.HelpExplanation.index: '(ヘルプの説明文)',
    SettingsKey.TermsOfService.index: '利用規約',
    SettingsKey.TermsExplanation.index: '(利用規約の説明文)',
    SettingsKey.PrivacyPoricy.index: 'プライバシーポリシー',
    SettingsKey.PoricyExplanation.index: '(プライバシーポリシーの説明文)',
    SettingsKey.Other.index: 'その他',
  };
}

//設定の初期画面
class SettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.CardInfo, context, Icon(Icons.credit_card),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsKey.StartWeek, context, Icon(Icons.calendar_today),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsKey.Notification, context, Icon(Icons.alarm),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsKey.TrashCan, context, Icon(Icons.delete),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsKey.DarkMode, context, Icon(Icons.brightness_4),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsKey.AppIcon, context, Icon(Icons.phone_iphone),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsKey.FontSize, context, Icon(Icons.format_size),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsKey.Language, context, Icon(Icons.g_translate),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsKey.ReviewThisApp, context,
            Icon(Icons.insert_emoticon), Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsKey.Introduction, context, Icon(Icons.chat),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsKey.Inquiry, context, Icon(Icons.contact_mail),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsKey.Donation, context, Icon(Icons.attach_money),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsKey.Help, context, Icon(Icons.help),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsKey.TermsOfService, context, Icon(Icons.rule),
            Icon(Icons.arrow_forward_ios)),
        MenuItem(SettingsKey.PrivacyPoricy, context, Icon(Icons.privacy_tip),
            Icon(Icons.arrow_forward_ios)),
      ]),
    );
  }
}

//--------------------------------------------------
//　　　　　　　　以下、設定の各画面
//--------------------------------------------------

class SettingsCardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(SettingsItem.name[SettingsKey.CardInfo.index])),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.CardA, context),
        MenuItem(SettingsKey.CardB, context),
        MenuItem(SettingsKey.CardC, context),
      ]),
    );
  }
}

class SettingsStartWeek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItem.name[SettingsKey.StartWeek.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.Sunday, context),
        MenuItem(SettingsKey.Monday, context),
        MenuItem(SettingsKey.Tuesday, context),
        MenuItem(SettingsKey.Wednesday, context),
        MenuItem(SettingsKey.Thursday, context),
        MenuItem(SettingsKey.Friday, context),
        MenuItem(SettingsKey.Saturday, context),
      ]),
    );
  }
}

class SettingsNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItem.name[SettingsKey.Notification.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.NotificationOnOff, context),
        MenuItem(SettingsKey.NotificationOnOffBadge, context),
        MenuItem(SettingsKey.NotificationTime, context),
      ]),
    );
  }
}

class SettingsTrashCan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItem.name[SettingsKey.TrashCan.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.TrashCardA, context),
        MenuItem(SettingsKey.TrashCardB, context),
        MenuItem(SettingsKey.TrashCardC, context),
      ]),
    );
  }
}

class SettingsDarkMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItem.name[SettingsKey.DarkMode.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.DarkModeOnOff, context),
        MenuItem(SettingsKey.DarkModeStartTime, context),
        MenuItem(SettingsKey.DarkModeEndTime, context),
      ]),
    );
  }
}

class SettingsAppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItem.name[SettingsKey.AppIcon.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.AppIconA, context),
        MenuItem(SettingsKey.AppIconB, context),
        MenuItem(SettingsKey.AppIconC, context),
      ]),
    );
  }
}

class SettingsFontSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItem.name[SettingsKey.FontSize.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.FontSizeLarge, context),
        MenuItem(SettingsKey.FontSizeMedium, context),
        MenuItem(SettingsKey.FontSizeSmall, context),
      ]),
    );
  }
}

class SettingsLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItem.name[SettingsKey.Language.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.Japanese, context),
        MenuItem(SettingsKey.English, context),
      ]),
    );
  }
}

class SettingsReviewThisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItem.name[SettingsKey.ReviewThisApp.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.ReviewByAppleStore, context),
        MenuItem(SettingsKey.ReviewByGooglePlay, context),
      ]),
    );
  }
}

class SettingsIntroduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItem.name[SettingsKey.Introduction.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.IntroduceByTwitter, context),
        MenuItem(SettingsKey.IntroduceByLINE, context),
        MenuItem(SettingsKey.IntroduceByCopyLink, context),
      ]),
    );
  }
}

class SettingsInquiry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItem.name[SettingsKey.Inquiry.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.InquiryByTwetter, context),
        MenuItem(SettingsKey.InquiryByMail, context),
      ]),
    );
  }
}

class SettingsDonation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItem.name[SettingsKey.Donation.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.DonationExplanation, context),
      ]),
    );
  }
}

class SettingsHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItem.name[SettingsKey.Help.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.HelpExplanation, context),
      ]),
    );
  }
}

class SettingsTermsOfService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItem.name[SettingsKey.TermsOfService.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.TermsExplanation, context),
      ]),
    );
  }
}

class SettingsPrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsItem.name[SettingsKey.PrivacyPoricy.index]),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: [
        MenuItem(SettingsKey.PoricyExplanation, context),
      ]),
    );
  }
}

//設定項目のボタンレイアウトや押下時の挙動
class MenuItem extends StatelessWidget {
  MenuItem(this.settingsKey, this.context,
      [this.leadingIcon, this.trailingIcon]);

  final SettingsKey settingsKey;
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
          SettingsItem.name[settingsKey.index],
          style: TextStyle(color: Colors.black, fontSize: 12.0),
        ),
        onTap: () {
          print("onTap called.");

          //todo:関数化した方が理解見やすい。あとで。
          switch (settingsKey) {
            case SettingsKey.CardInfo:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsCardInfo(),
                  ));
              break;
            case SettingsKey.StartWeek:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsStartWeek(),
                  ));
              break;
            case SettingsKey.Notification:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsNotification(),
                  ));
              break;
            case SettingsKey.TrashCan:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsTrashCan(),
                  ));
              break;
            case SettingsKey.DarkMode:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsDarkMode(),
                  ));
              break;
            case SettingsKey.AppIcon:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsAppIcon(),
                  ));
              break;
            case SettingsKey.FontSize:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsFontSize(),
                  ));
              break;
            case SettingsKey.Language:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsLanguage(),
                  ));
              break;
            case SettingsKey.ReviewThisApp:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsReviewThisApp(),
                  ));
              break;
            case SettingsKey.Introduction:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsIntroduction(),
                  ));
              break;
            case SettingsKey.Inquiry:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsInquiry(),
                  ));
              break;
            case SettingsKey.Donation:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsDonation(),
                  ));
              break;
            case SettingsKey.Help:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsHelp(),
                  ));
              break;
            case SettingsKey.TermsOfService:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsTermsOfService(),
                  ));
              break;
            case SettingsKey.PrivacyPoricy:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPrivacyPolicy(),
                  ));
              break;

            default:
              //最終版では、エラー処理にする
              print("onTap $settingsKey");
          }
        },
        onLongPress: () {
          print("onLongPress called.");
        },
      ),
    );
  }
}
