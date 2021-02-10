import 'package:flutter/material.dart';

class HistoryBarGraph extends StatelessWidget {
  final double width;
  final double height;
  const HistoryBarGraph({this.width, this.height});
  @override
  Widget build(BuildContext context) {
    final double h = (height - 20) / 3;
    return Column(
      children: [
        // Bar graphs
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(height: h * 3, width: width / 7, color: Colors.grey[500]),
            Container(height: 0, width: width / 7, color: Colors.grey[500]),
            Container(height: h * 2, width: width / 7, color: Colors.grey[500]),
            Container(height: 0, width: width / 7, color: Colors.grey[500]),
            Container(height: h, width: width / 7, color: Colors.grey[500]),
            Container(height: h * 2, width: width / 7, color: Colors.grey[500]),
            Container(height: h, width: width / 7, color: Colors.grey[500]),
          ],
        ),
        // labels
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(alignment: Alignment.center, height: 20, width: width / 7, child: Text('M')),
            Container(alignment: Alignment.center, height: 20, width: width / 7, child: Text('M')),
            Container(alignment: Alignment.center, height: 20, width: width / 7, child: Text('M')),
            Container(alignment: Alignment.center, height: 20, width: width / 7, child: Text('M')),
            Container(alignment: Alignment.center, height: 20, width: width / 7, child: Text('M')),
            Container(alignment: Alignment.center, height: 20, width: width / 7, child: Text('M')),
            Container(alignment: Alignment.center, height: 20, width: width / 7, child: Text('M')),
          ],
        ),
      ],
    );
  }
}

class SingleItemBarGraph extends StatelessWidget {
  final MaterialColor accentColor;
  final String title;
  final int score;
  const SingleItemBarGraph({this.accentColor, this.title, this.score});

  // size
  final double singleItemHeight = 60;
  final double titleHeight = 50;
  final double scorePanelWidth = 100;

  Widget getTitle(String title) {
    return Container(
      height: titleHeight,
      child: Row(
        children: [
          Icon(Icons.donut_large, color: accentColor),
          SizedBox(width: 10),
          Text(title, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  Widget getScorePanel(int score) {
    return Container(
      width: scorePanelWidth,
      height: singleItemHeight,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: singleItemHeight / 2,
        child: Text(score.toString(), style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: accentColor)),
      ),
    );
  }

  Widget getBarGraphContainer(double width) {
    return Container(
      width: width,
      height: singleItemHeight,
      child: HistoryBarGraph(width: width, height: singleItemHeight),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final double sideMarginWidth = 32;
    final mainContainerWidth = mediaWidth - scorePanelWidth - sideMarginWidth * 2;
    return Padding(
      padding: EdgeInsets.only(left: sideMarginWidth, right: sideMarginWidth, top: 16, bottom: 16),
      child: Column(
        children: [
          getTitle(title),
          Row(
            children: [
              getScorePanel(score),
              getBarGraphContainer(mainContainerWidth),
            ],
          )
        ],
      ),
    );
  }
}

class HabitResultsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              child: Text('なんかよさげタイトルエリア', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.circular(180)),
                ),
                Container(
                  height: 160,
                  width: 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(180)),
                ),
                Container(
                  height: 150,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.lightGreen, borderRadius: BorderRadius.circular(180)),
                ),
                Container(
                  height: 110,
                  width: 110,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(180)),
                ),
                Text('🐓', style: TextStyle(fontSize: 50)),
              ],
            ),
            SingleItemBarGraph(accentColor: Colors.cyan, title: '筋トレ', score: 8),
            SingleItemBarGraph(accentColor: Colors.lightGreen, title: '水飲む', score: 12),
            SingleItemBarGraph(accentColor: Colors.lightBlue, title: '本を読む', score: 5),
            SingleItemBarGraph(accentColor: Colors.amber, title: '叫ぶ', score: 14),
            SingleItemBarGraph(accentColor: Colors.purple, title: '踊る', score: 3),
          ],
        ),
      ),
    );
  }
}
